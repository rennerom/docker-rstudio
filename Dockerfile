ARG VERION
FROM rocker/r-ver:$VERSION

ENV RENV_VERSION 0.15.5

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh

RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"
RUN R -e "renv::restore()"

EXPOSE 8787

CMD ["/init"]