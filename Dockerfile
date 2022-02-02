# Build & Push Image
FROM rocker/tidyverse

#  install from a versioned repo
COPY /required-packages/required-packages.R /

# Making home & test folders 
RUN Rscript /required-packages.R

# Copying test files
COPY /test/test.R /
COPY /test/run_tests.sh /

# Giving permission to tests to run
RUN chmod +x /test.R
RUN chmod +x /run_tests.sh

# Run Tests  
RUN Rscript /test.R 

WORKDIR "turkey-macro-dashboard-docker"
