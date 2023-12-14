FROM rocker/verse
RUN R -e "install.packages(\"gridExtra\")" 
RUN R -e "install.packages(\"naivebayes\")" 
RUN R -e "install.packages(\"class\")" 
RUN R -e "install.packages(\"mclust\")" 
RUN R -e "install.packages(\"reshape2\")" 
