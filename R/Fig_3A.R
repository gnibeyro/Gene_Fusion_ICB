# Figure 3A

Table_S1$V <- ifelse(Table_S1$LS == "Alive", 0, 1)

MGH <- Table_S1[which(Table_S1$Cohort == "MGH"),]
Gide <- Table_S1[which(Table_S1$Cohort == "Gide"),]
Hugo <- Table_S1[which(Table_S1$Cohort == "Hugo"),]
Riaz <- Table_S1[which(Table_S1$Cohort == "Riaz"),]

Gide <- Gide[-which(Gide$LS == "Dead (not melanoma)"),]
surv_object <- Surv(time = Gide$OS, event = Gide$V)
fit_G <- survfit(surv_object ~ group, data = Gide)
print("Figure 3A: Gide KM")
print(ggsurvplot(fit_G, data = Gide, pval = TRUE, risk.table = TRUE, linetype = "strata", palette = "jco"))

surv_object <- Surv(time = Riaz$OS, event = Riaz$V)
fit_R <- survfit(surv_object ~ group, data = Riaz)
print("Figure 3A: Riaz KM")
print(ggsurvplot(fit_R, data = Riaz, pval = TRUE, risk.table = TRUE, linetype = "strata", palette = "jco"))

surv_object <- Surv(time = Hugo$OS, event = Hugo$V)
fit_H <- survfit(surv_object ~ group, data = Hugo)
print("Figure 3A: Hugo KM")
print(ggsurvplot(fit_H, data = Hugo, pval = TRUE, risk.table = TRUE, linetype = "strata", palette = "jco"))

surv_object <- Surv(time = MGH$OS, event = MGH$V)
fit_M <- survfit(surv_object ~ group, data = MGH)
print("Figure 3A: MGH KM")
print(ggsurvplot(fit_M, data = MGH, pval = TRUE, risk.table = TRUE, linetype = "strata", palette = "jco"))
