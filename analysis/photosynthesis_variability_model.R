# photosynthesis_timescale_model.R
## code to calculate photosynthesis using timescale data from Eve Gray's thesis

## libraries
# install.packages('R.utils')
library(R.utils)
library(ggplot2)
library(reshape2)
library(ggpubr)

## load up model and functions
source('model_code/photosynthesis_model.R')
sourceDirectory('model_code//functions')

## load data
variability_treatment_data <- read.csv('data/variability_treatment_data.csv')
variability_vcmax25jmax25 <- read.csv('data/variability_vcmax25jmax25.csv')

## run model #########
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


## graph a, aj, ac

LTVLLV_model_output$time <- c(0:23)
select_ltvllv_data <- LTVLLV_model_output[ , c(18, 25, 26, 27)]
select_ltvllv_long <- melt(select_ltvllv_data, id = "time", variable.name = "photosynthesis", value.name = "a_value")

ltvllv_model_plot <- ggplot(select_ltvllv_long, 
                            aes(x = time, y = a_value, linetype = photosynthesis,
                                                    color = photosynthesis)) +
  geom_line(size = .75) + theme_bw() + scale_x_continuous(breaks = seq(0, 23, 2)) +
  scale_linetype_manual(values = c("dashed", "dashed", "solid"),
                        labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  labs(x = "Hours in a Day (00-23)", y = expression(italic("A")["LTVLLV"]*" ("*mu*"mol m"^"-2"*" s"^"-1"*")")) +
  theme(legend.position = "top") + theme(legend.title= element_blank()) +
  coord_cartesian(ylim = c(0,17)) +
  scale_y_continuous(breaks = seq(0, 17, by = 2)) +
  scale_color_manual(values = c("#D55E00", "#009E73", "#0072B2"), 
                     labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  annotate("text", x = 13, y = 1, label = expression("A"["total"]* " = 0.601 "*"mol m"^"-2"*" d"^"-1"), size = 2)

ltvllv_model_plot


#########
LTVHLV_model_output$time <- c(0:23)
select_ltvhlv_data <- LTVHLV_model_output[ , c(18, 25, 26, 27)]
select_ltvhlv_long <- melt(select_ltvhlv_data, id = "time", variable.name = "photosynthesis", value.name = "a_value")

ltvhlv_model_plot <- ggplot(select_ltvhlv_long, 
                            aes(x = time, y = a_value, linetype = photosynthesis,
                                color = photosynthesis)) +
  geom_line(size = .75) + theme_bw() + scale_x_continuous(breaks = seq(0, 23, 2)) +
  scale_linetype_manual(values = c("dashed", "dashed", "solid"),
                        labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  labs(x = "Hours in a Day (00-23)", y = expression(italic("A")["LTVHLV"]*" ("*mu*"mol m"^"-2"*" s"^"-1"*")")) +
  theme(legend.position = "top") + theme(legend.title= element_blank()) +
  coord_cartesian(ylim = c(0,17)) +
  scale_y_continuous(breaks = seq(0, 17, by = 2)) +
  scale_color_manual(values = c("#D55E00", "#009E73", "#0072B2"), 
                     labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  annotate("text", x = 13, y = 1, label = expression("A"["total"]* " = 0.535 "*"mol m"^"-2"*" d"^"-1"), size = 2)

ltvhlv_model_plot

##########
HTVLLV_model_output$time <- c(0:23)
select_htvllv_data <- HTVLLV_model_output[ , c(18, 25, 26, 27)]
select_htvllv_long <- melt(select_htvllv_data, id = "time", variable.name = "photosynthesis", value.name = "a_value")

htvllv_model_plot <- ggplot(select_htvllv_long, 
                            aes(x = time, y = a_value, linetype = photosynthesis,
                                color = photosynthesis)) +
  geom_line(size = .75) + theme_bw() + scale_x_continuous(breaks = seq(0, 23, 2)) +
  scale_linetype_manual(values = c("dashed", "dashed", "solid"),
                        labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  labs(x = "Hours in a Day (00-23)", y = expression(italic("A")["HTVLLV"]*" ("*mu*"mol m"^"-2"*" s"^"-1"*")")) +
  theme(legend.position = "top") + theme(legend.title= element_blank()) +
  coord_cartesian(ylim = c(0,17)) +
  scale_y_continuous(breaks = seq(0, 17, by = 2)) +
  scale_color_manual(values = c("#D55E00", "#009E73", "#0072B2"), 
                     labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  annotate("text", x = 13, y = 1, label = expression("A"["total"]* " = 0.598 "*"mol m"^"-2"*" d"^"-1"), size = 2)

htvllv_model_plot

##########
HTVHLV_model_output$time <- c(0:23)
select_htvhlv_data <- HTVHLV_model_output[ , c(18, 25, 26, 27)]
select_htvhlv_long <- melt(select_htvhlv_data, id = "time", variable.name = "photosynthesis", value.name = "a_value")

htvhlv_model_plot <- ggplot(select_htvhlv_long,
                            aes(x = time, y = a_value, linetype = photosynthesis,
                                color = photosynthesis)) +
  geom_line(size = .75) + theme_bw() + scale_x_continuous(breaks = seq(0, 23, 2)) +
  scale_linetype_manual(values = c("dashed", "dashed", "solid"),
                        labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  labs(x = "Hours in a Day (00-23)", y = expression(italic("A")["HTVHLV"]*" ("*mu*"mol m"^"-2"*" s"^"-1"*")")) +
  theme(legend.position = "top") + theme(legend.title= element_blank()) +
  coord_cartesian(ylim = c(0,17)) +
  scale_y_continuous(breaks = seq(0, 17, by = 2)) +
  scale_color_manual(values = c("#D55E00", "#009E73", "#0072B2"), 
                     labels = c(expression("A"["c"]), expression("A"["j"]), expression("A"["net"]))) +
  annotate("text", x = 13, y = 1, label = expression("A"["total"]* " = 0.512 "*"mol m"^"-2"*" d"^"-1"), size = 2)

htvhlv_model_plot

fvcb <- ggarrange(ltvllv_model_plot, ltvhlv_model_plot, htvllv_model_plot, htvhlv_model_plot,
          labels = c("a)", "b)", "c)", "d)"))
fvcb

jpeg(filename = "fvcb.jpg",
     width = 5, height = 5, units = "in", res = 300)
grid.newpage()
grid.draw(fvcb)
dev.off()

## average Anet value in a day #######
  # average "a" in a day * 86400 (number of seconds in day) = total photosynthesis in
  # a day
  # divide by 1,000,000 to concert to mols

total_A_LTVLLV <- (mean(LTVLLV_model_output$a)*86400)/1000000
total_A_LTVLLV # 0.6014321

total_A_LTVHLV <- (mean(LTVHLV_model_output$a)*86400)/1000000
total_A_LTVHLV # 0.5350313

total_A_HTVLLV <- (mean(HTVLLV_model_output$a)*86400)/1000000
total_A_HTVLLV # 0.5977194

total_A_HTVHLV <- (mean(HTVHLV_model_output$a)*86400)/1000000
total_A_HTVHLV # 0.5119196

