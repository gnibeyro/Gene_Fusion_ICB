#Make sure to set the working directory into Gene_Fusion_ICB folder

#load data
Table_S1 <- read.csv("data/Table_S1.csv")
Table_S2 <- read.csv("data/Table_S2.csv")
non_ICB_Cohort <- read.csv("data/non_ICB_Cohort.csv")

#load libraries
library(ggplot2)
library(ggpubr)
library(dplyr)
library(survival)
library(survminer)
library(tidyr)
library(stringr)
library(epiR)
library(gridExtra)
library(smoothROCtime)

source("R/Fig1A.R", echo=F)
source("R/Fig1B_lm.R", echo=F)
source("R/Fig1C.R", echo=F)
source("R/Fig2A.R", echo=F)
source("R/Fig2B.R", echo=F)
source("R/tdROC.R", echo=F)
source("R/Fig3.R", echo=F)
source("R/Fig4.R", echo=F)
source("R/Fig5A.R", echo=F)
source("R/Fig5B.R", echo=F)

