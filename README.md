# Gene_Fusion_ICB

This repository contains the data and scripts necessary to reproduce the results from the paper:

**"Evaluating Gene Fusions as Outcome Predictors and Therapeutic Targets in Immune Checkpoint Blockade-Treated Advanced Melanoma"**

## Repository Structure

The repository is organized into the following directories:

### 1. `data/`
This folder contains the datasets used in the study:
- **Table_S1.csv**: Clinical and demographic information of patients treated with immune checkpoint blockade (ICB).
- **Table_S2.csv**: List of all detected gene fusions in the analyzed cohorts.
- **non_ICB_Cohort.csv**: Clinical and demographic information of patients from cohorts that did not receive immunotherapy.

### 2. `R/`
This folder contains R scripts and functions used for data processing and figure generation. These scripts allow for the reproduction of all the figures presented in the study.

1. Clone the repository:

```
git clone https://github.com/gnibeyro/Gene_Fusion_ICB.git

```
2. Install necessary R dependencies (if applicable).

```
install.packages("ggplot2")
install.packages("ggpubr")
install.packages("survival")
install.packages("survminer")
install.packages("tidyr")
install.packages("stringr")
install.packages("epiR")
install.packages("gridExtra")
install.packages("smoothROCtime")

```

3. Run the main.R script in the to generate figures and analyses based on the provided datasets.

## Authors

- **Guadalupe Nibeyro** - *Curator and Developer* - [CONICET](http://www.conicet.gov.ar) - [Fundación para el Progreso de la Medicina - FPM](https://fpmlab.org.ar/) 
- **Elmer A. Fernández** - *Idea and Developer* - [Profile](https://www.researchgate.net/profile/Elmer_Fernandez) - [CONICET](http://www.conicet.gov.ar) - [Fundación para el Progreso de la Medicina - FPM](https://fpmlab.org.ar/) 

## Citation

If you use this repository in your research, please cite our paper:

**"Evaluating Gene Fusions as Outcome Predictors and Therapeutic Targets in Immune Checkpoint Blockade-Treated Advanced Melanoma"**

Year: 2025

## Contact
For any questions or issues, please open an issue in this repository or contact gnibeyro@gmail.com.


