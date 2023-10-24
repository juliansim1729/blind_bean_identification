FROM rocker/verse
RUN R -e "install.packages(\"reshape2\")"

RUN yes | unminimize
RUN apt update && apt install -y man-db && rm -rf /var/lib/apt/lists/*
