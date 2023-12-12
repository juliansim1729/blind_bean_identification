FROM rocker/verse
RUN R -e "install.packages(c(\"reshape2\", \"class\", \"caret\"))"
RUN R -e "devtools::install_github('bbc/bbplot')"

RUN apt update && apt install -y python3 python3-pip
RUN pip3 install numpy scikit-learn pandas

RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
