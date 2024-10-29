# photosynthesis_timescale_model.R
## code to calculate photosynthesis using timescale data from Eve Gray's thesis

## libraries
# install.packages('R.utils')
library(R.utils)
library(ggplot2)

## load up model and functions
source('../model_code/photosynthesis_model.R')
sourceDirectory('../model_code/functions')

## load data
variability_treatment_data <- read.csv('../data/variability_treatment_data.csv')
variability_vcmax25jmax25 <- read.csv('../data/variability_vcmax25jmax25.csv')

## run model
### LTVLLV
LTVLLV_model_output <- photosynthesis_model(vcmax25 = subset(variability_vcmax25jmax25, treatment == 'LTVLLV')$vcmax25,
                                            jmax25 = subset(variability_vcmax25jmax25, treatment == 'LTVLLV')$jmax25,
                                            par = subset(variability_treatment_data, treatment == 'LTVLLV')$par,
                                            temperature_c = subset(variability_treatment_data, treatment == 'LTVLLV')$temp)

### LTVHLV
LTVHLV_model_output <- photosynthesis_model(vcmax25 = subset(variability_vcmax25jmax25, treatment == 'LTVHLV')$vcmax25,
                                            jmax25 = subset(variability_vcmax25jmax25, treatment == 'LTVHLV')$jmax25,
                                            par = subset(variability_treatment_data, treatment == 'LTVHLV')$par,
                                            temperature_c = subset(variability_treatment_data, treatment == 'LTVHLV')$temp)

### HTVLLV
HTVLLV_model_output <- photosynthesis_model(vcmax25 = subset(variability_vcmax25jmax25, treatment == 'HTVLLV')$vcmax25,
                                            jmax25 = subset(variability_vcmax25jmax25, treatment == 'HTVLLV')$jmax25,
                                            par = subset(variability_treatment_data, treatment == 'HTVLLV')$par,
                                            temperature_c = subset(variability_treatment_data, treatment == 'HTVLLV')$temp)

### HTVHLV
HTVHLV_model_output <- photosynthesis_model(vcmax25 = subset(variability_vcmax25jmax25, treatment == 'HTVHLV')$vcmax25,
                                            jmax25 = subset(variability_vcmax25jmax25, treatment == 'HTVHLV')$jmax25,
                                            par = subset(variability_treatment_data, treatment == 'HTVHLV')$par,
                                            temperature_c = subset(variability_treatment_data, treatment == 'HTVHLV')$temp)


