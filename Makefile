all: figures/correlation_heatmap.png figures/counts_by_class.png intermediate_data/deidentified_beans.csv

clean:
	rm -f intermediate_data/*
	rm -f figures/*

figures/correlation_heatmap.png: scripts/make_correlation_heatmap.R intermediate_data/deidentified_beans.csv
	Rscript scripts/make_correlation_heatmap.R

figures/counts_by_class.png: scripts/make_class_counts.R source_data/Dry_Bean_Dataset.csv
	Rscript scripts/make_class_counts.R

intermediate_data/deidentified_beans.csv: scripts/make_deidentified_data.R source_data/Dry_Bean_Dataset.csv
	Rscript scripts/make_deidentified_data.R





