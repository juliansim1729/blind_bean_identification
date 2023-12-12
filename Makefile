all: figures/correlation_heatmap.png figures/counts_by_class.png intermediate_data/labeled_beans.csv intermediate_data/deidentified_beans.csv

clean:
	rm -f intermediate_data/*
	rm -f figures/*
	
figures/correlation_heatmap.png: scripts/graphics/make_correlation_heatmap.R intermediate_data/deidentified_beans.csv
	Rscript scripts/graphics/make_correlation_heatmap.R

figures/counts_by_class.png: scripts/graphics/make_class_counts.R source_data/Dry_Bean_Dataset.csv
	Rscript scripts/graphics/make_class_counts.R

intermediate_data/deidentified_beans.csv: scripts/datagen/make_deidentified_data.R intermediate_data/labeled_beans.csv
	Rscript scripts/datagen/make_deidentified_data.R
	
intermediate_data/labeled_beans.csv: scripts/datagen/make_labeled_data.R source_data/Dry_Bean_Dataset.csv
	Rscript scripts/datagen/make_labeled_data.R





