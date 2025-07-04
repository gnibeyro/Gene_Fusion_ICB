# Figure 5

Badal <- non_ICB_Cohort[which(non_ICB_Cohort$Cohort == "Badal"),]
TCGA_01 <- non_ICB_Cohort[which(non_ICB_Cohort$Cohort == "TCGA_01"),]
TCGA_06 <- non_ICB_Cohort[which(non_ICB_Cohort$Cohort == "TCGA_06"),]

# Figure 5A
surv_object <- Surv(time = Badal$OS, event = Badal$V)
fit3 <- survfit(surv_object ~ group, data = Badal)
print("Figure 5E: Badal KM")
print(ggsurvplot(fit3, data = Badal, pval = TRUE, risk.table = TRUE))

# Figure 5B
print("Figure 5B: Badal Cytolityc Scores")
print(ggplot(Badal[which(Badal$cyt < 30),], aes(x=TFB,y=cyt, col=group))+geom_point()+
  geom_vline(xintercept = 11.5)+
  geom_hline(yintercept = 15, linetype=3)+
  ggtitle("Cytolytic activity")+
  labs(x = "TFB", y = "Cyt", col = "TFB-group"))

# Figure 5C
surv_object <- Surv(time = TCGA_01$OS, event = TCGA_01$V)
fit2 <- survfit(surv_object ~ group, data = TCGA_01)
print("Figure 5C: TCGA_01 KM")
print(ggsurvplot(fit2, data = TCGA_01, pval = TRUE, risk.table = TRUE))

# Figure 5D
print("Figure 5D: TCGA_01 Cytolityc Scores")
print(ggplot(TCGA_01, aes(x=TFB,y=cyt, col=group))+geom_point()+
  geom_vline(xintercept = 11.5)+
  geom_hline(yintercept = 15, linetype=3)+
  ggtitle("Cytolytic activity")+
  labs(x = "TFB", y = "Cyt", col = "TFB-group"))

# Figure 5E
surv_object <- Surv(time = TCGA_06$OS, event = TCGA_06$V)
fit1 <- survfit(surv_object ~ group, data = TCGA_06)
print("Figure 5A: TCGA_06 KM")
print(ggsurvplot(fit1, data = TCGA_06, pval = TRUE, risk.table = TRUE))

# Figure 5F
print("Figure 5F: TCGA_06 Cytolityc Scores")
print(ggplot(TCGA_06, aes(x=TFB,y=cyt, col=group))+geom_point()+
  geom_vline(xintercept = 11.5)+
  geom_hline(yintercept = 55, linetype=3)+
  ggtitle("Cytolytic activity")+
  labs(x = "TFB", y = "Cyt", col = "TFB-group"))
