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

## run model

### new leaf HC
#### subset data
# newleaf_em_HC <- subset(newleaf_em, starting_trt == 'high' & ending_trt == 'high')
# newleaf_em_HC_vcmax <- subset(newleaf_em_HC, trait == 'vcmax')$emmean
# newleaf_em_HC_jmax <- subset(newleaf_em_HC, trait == 'jmax')$emmean
# newleaf_em_HC_phi2 <- subset(newleaf_em_HC, trait == 'phi2')$emmean
# 
# #### run model
# newleaf_HC_simulation <- photosynthesis_model(par = 1100, 
#                                               vcmax = newleaf_em_HC_vcmax,
#                                               jmax = newleaf_em_HC_jmax,
#                                               phi_psii = newleaf_em_HC_phi2)
# 
# ### new leaf LH
# #### subset data
# newleaf_em_LH <- subset(newleaf_em, starting_trt == 'low' & ending_trt == 'high')
# newleaf_em_LH_vcmax <- subset(newleaf_em_LH, trait == 'vcmax')$emmean
# newleaf_em_LH_jmax <- subset(newleaf_em_LH, trait == 'jmax')$emmean
# newleaf_em_LH_phi2 <- subset(newleaf_em_LH, trait == 'phi2')$emmean
# 
# #### run model
# newleaf_LH_simulation <- photosynthesis_model(par = 1100, 
#                                               vcmax = newleaf_em_LH_vcmax,
#                                               jmax = newleaf_em_LH_jmax,
#                                               phi_psii = newleaf_em_LH_phi2)
# 
# ### new leaf LC
# #### subset data
# newleaf_em_LC <- subset(newleaf_em, starting_trt == 'low' & ending_trt == 'low')
# newleaf_em_LC_vcmax <- subset(newleaf_em_LC, trait == 'vcmax')$emmean
# newleaf_em_LC_jmax <- subset(newleaf_em_LC, trait == 'jmax')$emmean
# newleaf_em_LC_phi2 <- subset(newleaf_em_LC, trait == 'phi2')$emmean
# 
# #### run model
# newleaf_LC_simulation <- photosynthesis_model(par = 600, 
#                                               vcmax = newleaf_em_LC_vcmax,
#                                               jmax = newleaf_em_LC_jmax,
#                                               phi_psii = newleaf_em_LC_phi2)
# 
# ### new leaf HL
# #### subset data
# newleaf_em_HL <- subset(newleaf_em, starting_trt == 'high' & ending_trt == 'low')
# newleaf_em_HL_vcmax <- subset(newleaf_em_HL, trait == 'vcmax')$emmean
# newleaf_em_HL_jmax <- subset(newleaf_em_HL, trait == 'jmax')$emmean
# newleaf_em_HL_phi2 <- subset(newleaf_em_HL, trait == 'phi2')$emmean
# 
# #### run model
# newleaf_HL_simulation <- photosynthesis_model(par = 600, 
#                                               vcmax = newleaf_em_HL_vcmax,
#                                               jmax = newleaf_em_HL_jmax,
#                                               phi_psii = newleaf_em_HL_phi2)
# 
# ### combine new leaf data
# newleaf_df <- rbind(newleaf_HC_simulation, newleaf_LH_simulation, newleaf_LC_simulation, newleaf_HL_simulation)
# newleaf_df$treatment <- c('HC', 'LH', 'LC', 'HL')
# newleaf_df$leaf_age <- 'new'
# newleaf_df$days_since_first <- NA
# 
# ### old leaf HC day0
# #### subset data
# oldleaf_em_HC_day0 <- subset(oldleaf_em, starting_trt == 'high' & ending_trt == 'high' & days_since_first == 0)
# oldleaf_em_HC_day0_vcmax <- subset(oldleaf_em_HC_day0, trait == 'vcmax')$emmean
# oldleaf_em_HC_day0_jmax <- subset(oldleaf_em_HC_day0, trait == 'jmax')$emmean
# oldleaf_em_HC_day0_phi2 <- subset(oldleaf_em_HC_day0, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_HC_day0_simulation <- photosynthesis_model(par = 1100, 
#                                               vcmax = oldleaf_em_HC_day0_vcmax,
#                                               jmax = oldleaf_em_HC_day0_jmax,
#                                               phi_psii = oldleaf_em_HC_day0_phi2)
# 
# ### old leaf HC day9
# #### subset data
# oldleaf_em_HC_day9 <- subset(oldleaf_em, starting_trt == 'high' & ending_trt == 'high' & days_since_first == 9)
# oldleaf_em_HC_day9_vcmax <- subset(oldleaf_em_HC_day9, trait == 'vcmax')$emmean
# oldleaf_em_HC_day9_jmax <- subset(oldleaf_em_HC_day9, trait == 'jmax')$emmean
# oldleaf_em_HC_day9_phi2 <- subset(oldleaf_em_HC_day9, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_HC_day9_simulation <- photosynthesis_model(par = 1100, 
#                                                    vcmax = oldleaf_em_HC_day9_vcmax,
#                                                    jmax = oldleaf_em_HC_day9_jmax,
#                                                    phi_psii = oldleaf_em_HC_day9_phi2)
# 
# ### old leaf HC day17
# #### subset data
# oldleaf_em_HC_day17 <- subset(oldleaf_em, starting_trt == 'high' & ending_trt == 'high' & days_since_first == 17)
# oldleaf_em_HC_day17_vcmax <- subset(oldleaf_em_HC_day17, trait == 'vcmax')$emmean
# oldleaf_em_HC_day17_jmax <- subset(oldleaf_em_HC_day17, trait == 'jmax')$emmean
# oldleaf_em_HC_day17_phi2 <- subset(oldleaf_em_HC_day17, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_HC_day17_simulation <- photosynthesis_model(par = 1100, 
#                                                    vcmax = oldleaf_em_HC_day17_vcmax,
#                                                    jmax = oldleaf_em_HC_day17_jmax,
#                                                    phi_psii = oldleaf_em_HC_day17_phi2)
# 
# ### old leaf LH day0
# #### subset data
# oldleaf_em_LH_day0 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'high' & days_since_first == 0)
# oldleaf_em_LH_day0_vcmax <- subset(oldleaf_em_LH_day0, trait == 'vcmax')$emmean
# oldleaf_em_LH_day0_jmax <- subset(oldleaf_em_LH_day0, trait == 'jmax')$emmean
# oldleaf_em_LH_day0_phi2 <- subset(oldleaf_em_LH_day0, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_LH_day0_simulation <- photosynthesis_model(par = 600, 
#                                                    vcmax = oldleaf_em_LH_day0_vcmax,
#                                                    jmax = oldleaf_em_LH_day0_jmax,
#                                                    phi_psii = oldleaf_em_LH_day0_phi2)
# 
# ### old leaf LH day9
# #### subset data
# oldleaf_em_LH_day9 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'high' & days_since_first == 9)
# oldleaf_em_LH_day9_vcmax <- subset(oldleaf_em_LH_day9, trait == 'vcmax')$emmean
# oldleaf_em_LH_day9_jmax <- subset(oldleaf_em_LH_day9, trait == 'jmax')$emmean
# oldleaf_em_LH_day9_phi2 <- subset(oldleaf_em_LH_day9, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_LH_day9_simulation <- photosynthesis_model(par = 1100, 
#                                                    vcmax = oldleaf_em_LH_day9_vcmax,
#                                                    jmax = oldleaf_em_LH_day9_jmax,
#                                                    phi_psii = oldleaf_em_LH_day9_phi2)
# 
# ### old leaf LH day17
# #### subset data
# oldleaf_em_LH_day17 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'high' & days_since_first == 17)
# oldleaf_em_LH_day17_vcmax <- subset(oldleaf_em_LH_day17, trait == 'vcmax')$emmean
# oldleaf_em_LH_day17_jmax <- subset(oldleaf_em_LH_day17, trait == 'jmax')$emmean
# oldleaf_em_LH_day17_phi2 <- subset(oldleaf_em_LH_day17, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_LH_day17_simulation <- photosynthesis_model(par = 1100, 
#                                                     vcmax = oldleaf_em_LH_day17_vcmax,
#                                                     jmax = oldleaf_em_LH_day17_jmax,
#                                                     phi_psii = oldleaf_em_LH_day17_phi2)
# 
# ### old leaf LC day0
# #### subset data
# oldleaf_em_LC_day0 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'low' & days_since_first == 0)
# oldleaf_em_LC_day0_vcmax <- subset(oldleaf_em_LC_day0, trait == 'vcmax')$emmean
# oldleaf_em_LC_day0_jmax <- subset(oldleaf_em_LC_day0, trait == 'jmax')$emmean
# oldleaf_em_LC_day0_phi2 <- subset(oldleaf_em_LC_day0, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_LC_day0_simulation <- photosynthesis_model(par = 600, 
#                                                    vcmax = oldleaf_em_LC_day0_vcmax,
#                                                    jmax = oldleaf_em_LC_day0_jmax,
#                                                    phi_psii = oldleaf_em_LC_day0_phi2)
# 
# ### old leaf LC day9
# #### subset data
# oldleaf_em_LC_day9 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'low' & days_since_first == 9)
# oldleaf_em_LC_day9_vcmax <- subset(oldleaf_em_LC_day9, trait == 'vcmax')$emmean
# oldleaf_em_LC_day9_jmax <- subset(oldleaf_em_LC_day9, trait == 'jmax')$emmean
# oldleaf_em_LC_day9_phi2 <- subset(oldleaf_em_LC_day9, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_LC_day9_simulation <- photosynthesis_model(par = 600, 
#                                                    vcmax = oldleaf_em_LC_day9_vcmax,
#                                                    jmax = oldleaf_em_LC_day9_jmax,
#                                                    phi_psii = oldleaf_em_LC_day9_phi2)
# 
# ### old leaf LC day17
# #### subset data
# oldleaf_em_LC_day17 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'low' & days_since_first == 17)
# oldleaf_em_LC_day17_vcmax <- subset(oldleaf_em_LC_day17, trait == 'vcmax')$emmean
# oldleaf_em_LC_day17_jmax <- subset(oldleaf_em_LC_day17, trait == 'jmax')$emmean
# oldleaf_em_LC_day17_phi2 <- subset(oldleaf_em_LC_day17, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_LC_day17_simulation <- photosynthesis_model(par = 600, 
#                                                     vcmax = oldleaf_em_LC_day17_vcmax,
#                                                     jmax = oldleaf_em_LC_day17_jmax,
#                                                     phi_psii = oldleaf_em_LC_day17_phi2)
# 
# ### old leaf HL day0
# #### subset data
# oldleaf_em_HL_day0 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'low' & days_since_first == 0)
# oldleaf_em_HL_day0_vcmax <- subset(oldleaf_em_HL_day0, trait == 'vcmax')$emmean
# oldleaf_em_HL_day0_jmax <- subset(oldleaf_em_HL_day0, trait == 'jmax')$emmean
# oldleaf_em_HL_day0_phi2 <- subset(oldleaf_em_HL_day0, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_HL_day0_simulation <- photosynthesis_model(par = 600, 
#                                                    vcmax = oldleaf_em_HL_day0_vcmax,
#                                                    jmax = oldleaf_em_HL_day0_jmax,
#                                                    phi_psii = oldleaf_em_HL_day0_phi2)
# 
# ### old leaf HL day9
# #### subset data
# oldleaf_em_HL_day9 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'low' & days_since_first == 9)
# oldleaf_em_HL_day9_vcmax <- subset(oldleaf_em_HL_day9, trait == 'vcmax')$emmean
# oldleaf_em_HL_day9_jmax <- subset(oldleaf_em_HL_day9, trait == 'jmax')$emmean
# oldleaf_em_HL_day9_phi2 <- subset(oldleaf_em_HL_day9, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_HL_day9_simulation <- photosynthesis_model(par = 600, 
#                                                    vcmax = oldleaf_em_HL_day9_vcmax,
#                                                    jmax = oldleaf_em_HL_day9_jmax,
#                                                    phi_psii = oldleaf_em_HL_day9_phi2)
# 
# ### old leaf HL day17
# #### subset data
# oldleaf_em_HL_day17 <- subset(oldleaf_em, starting_trt == 'low' & ending_trt == 'low' & days_since_first == 17)
# oldleaf_em_HL_day17_vcmax <- subset(oldleaf_em_HL_day17, trait == 'vcmax')$emmean
# oldleaf_em_HL_day17_jmax <- subset(oldleaf_em_HL_day17, trait == 'jmax')$emmean
# oldleaf_em_HL_day17_phi2 <- subset(oldleaf_em_HL_day17, trait == 'Phi2')$emmean
# 
# #### run model
# oldleaf_HL_day17_simulation <- photosynthesis_model(par = 600, 
#                                                     vcmax = oldleaf_em_HL_day17_vcmax,
#                                                     jmax = oldleaf_em_HL_day17_jmax,
#                                                     phi_psii = oldleaf_em_HL_day17_phi2)
# 
# ### combine old leaf data
# oldleaf_df <- rbind(oldleaf_HC_day0_simulation, oldleaf_HC_day9_simulation, oldleaf_HC_day17_simulation, 
#                     oldleaf_LH_day0_simulation, oldleaf_LH_day9_simulation, oldleaf_LH_day17_simulation,
#                     oldleaf_LC_day0_simulation, oldleaf_LC_day9_simulation, oldleaf_LC_day17_simulation,
#                     oldleaf_HL_day0_simulation, oldleaf_HL_day9_simulation, oldleaf_HL_day17_simulation)
# oldleaf_df$treatment <- c(rep('HC', 3), rep('LH', 3), rep('LC', 3), rep('HL', 3))
# oldleaf_df$leaf_age <- 'old'
# oldleaf_df$days_since_first <- rep(c(0, 9, 17), 4)
# 
# ### combine all data and write out
# photosynthesis_timescale_model_data <- rbind(newleaf_df, oldleaf_df)
# write.csv(photosynthesis_timescale_model_data, '../results/photosynthesis_timescale_model_data.csv', row.names = F)
