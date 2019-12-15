FROM rocker/r-apt:bionic

RUN apt-get update && \
    apt-get install -y -qq \
    	r-cran-devtools

RUN R -e 'library(devtools); install_github("datalorax/slidex")' && \
    R -e 'install.packages(c("xaringan", "knitr", "kableExtra", "tibble"))'

WORKDIR /work
CMD ["R"]
