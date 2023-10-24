PHONY: clean

clean: 
	rm intermediate_data/*
	rm logs/*
	rm figures/*

intermediate_data/deidentified_beans.csv:
	Rscript make_deidentified_data.R

figures/correlation_heatmap.png:
	Rscript make_correlation_heatmap.R