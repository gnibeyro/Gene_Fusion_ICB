#load data
Table_S1 <- read.csv("Data/Table_S1.csv")
Table_S2 <- read.csv("Data/Table_S2.csv")
non_ICB_Cohort <- read.csv("Data/non_ICB_Cohort.csv")

#load libraries
library(ggplot2)
library(ggpubr)
library(survival)
library(survminer)
library(tidyr)
library(stringr)
library(epiR)
library(gridExtra)
library(smoothROCtime)

source("~/Documents/Gene_Fusion_ICB/R/Fig_1A_lm.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/Fig_1B.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/Fig_1C.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/Fig_1D.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/tdROC.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/Fig_2AB.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/Fig_3A.R", echo=F)
source("~/Documents/Gene_Fusion_ICB/R/Fig_3B.R", echo=F)

