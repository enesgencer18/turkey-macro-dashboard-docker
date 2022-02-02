# Build & Push Image
FROM rocker/tidyverse

#  install from a versioned repo
COPY /required-packages/required-packages.R /

# Making home & test folders 
RUN Rscript /required-packages.R

# Copying test files
COPY /test/test.R /

# Run Tests  
RUN Rscript /test.R

WORKDIR "turkey-macro-dashboard-docker"
