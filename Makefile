.PHONY: clean

clean:
	rm -rf intermediate_data/*
	rm -rf figures/*

.created-dirs:
	mkdir -p intermediate_data
	mkdir -p figures

# creates the base dataframes used for the rest of analysis
# most of the cleaning and processing takes place within make_labeled_data.R
# while the removal of sf4 and deidentification takes place within
# their respective files
intermediate_data/deidentified_beans.csv: scripts/datagen/make_deidentified_data.R intermediate_data/labeled_beans.csv
	Rscript scripts/datagen/make_deidentified_data.R

intermediate_data/labeled_beans.csv: scripts/datagen/remove_sf4.R intermediate_data/labeled_beans_sf4.csv
	Rscript scripts/datagen/remove_sf4.R
	
intermediate_data/labeled_beans_sf4.csv: scripts/datagen/make_labeled_data.R source_data/Dry_Bean_Dataset.csv
	Rscript scripts/datagen/make_labeled_data.R

# creating a correlation matrix from every numeric variable	
figures/correlation_heatmap.png: scripts/graphics/make_correlation_heatmap.R intermediate_data/deidentified_beans.csv
	Rscript scripts/graphics/make_correlation_heatmap.R

# creates a plot noting the amount of observations for each class
figures/counts_by_class.png: scripts/graphics/make_class_counts.R source_data/Dry_Bean_Dataset.csv
	Rscript scripts/graphics/make_class_counts.R


# the next three scripts serve to break down the process of checking whether
# shape factor 4 is a good variable to include or not and once done checking
# gives you both models and then returns a tile plot detailing their performances
intermediate_data/train_test.RData: scripts/datagen/train_test_split.R intermediate_data/labeled_beans_sf4.csv
	Rscript scripts/datagen/train_test_split.R
	
intermediate_data/nbc_models.RData: scripts/datagen/check_sf4.R intermediate_data/train_test.RData
	Rscript scripts/datagen/check_sf4.R
	
figures/sf4_comparison.png: scripts/graphics/graph_sf4_comp.R intermediate_data/nbc_models.RData intermediate_data/train_test.RData
	Rscript scripts/graphics/graph_sf4_comp.R


# plots area vs extent with the predicted values as compared to the expected plot
figures/area_vs_extent.png: scripts/graphics/plot_area_extent.R intermediate_data/nbc_models.RData intermediate_data/train_test.RData
	Rscript scripts/graphics/plot_area_extent.R

# compile full report
report.pdf: figures/correlation_heatmap.png figures/counts_by_class.png figures/sf4_comparison.png figures/area_vs_extent.png
	R -e "rmarkdown::render(\"report.Rmd\", output_format=\"pdf_document\")"


