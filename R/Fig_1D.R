DB_TX <- Table_S1[-which(Table_S1$LS == "Dead (not melanoma)"),]
DB_TX <- DB_TX[-which(is.na(DB_TX$OS) == T),]
DB_TX$group <- factor(DB_TX$group, levels = c("low", "high"))

model <- coxph( Surv(OS, V) ~ Cohort + group + previousTX,
                data = as.data.frame(DB_TX))

print("Figure 1D: TFB-group HR")
print(ggforest(model, fontsize = 1) +  # adjust the font size in the ggforest function if available
  theme(text = element_text(size = 14), # adjust general font size
        axis.text = element_text(size = 12),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 14)))

DB_TX$logFus <- log(DB_TX$TFB + 1)

surv_object <- Surv(time = DB_TX$OS, event = DB_TX$V)

print("Cox: Cohort")
print(coxph(formula = surv_object ~ Cohort, data = DB_TX))

print("Cox: Previous Treatment")
print(coxph(formula = surv_object ~ previousTX, data = DB_TX))

print("Cox: TFB")
print(coxph(formula = surv_object ~ logFus, data = DB_TX))

print("Multivariate Cox: TFB-group, Cohort, Previous Treatment")
print(coxph(formula = surv_object ~ group + Cohort + previousTX, data = DB_TX))
