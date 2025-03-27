Badal <- non_ICB_Cohort[which(non_ICB_Cohort$Cohort == "Badal"),]
TCGA_01 <- non_ICB_Cohort[which(non_ICB_Cohort$Cohort == "TCGA_01"),]
TCGA_06 <- non_ICB_Cohort[which(non_ICB_Cohort$Cohort == "TCGA_06"),]

ggplot(Badal[which(Badal$cyt < 30),], aes(x=TFB,y=cyt, col=group))+geom_point()+
  geom_vline(xintercept = 11.5)+
  geom_hline(yintercept = 15, linetype=3)+
  ggtitle("Cytolytic activity")+
  labs(x = "TFB", y = "Cyt", col = "TFB-group")

ggplot(TCGA_01, aes(x=TFB,y=cyt, col=group))+geom_point()+
  geom_vline(xintercept = 11.5)+
  geom_hline(yintercept = 15, linetype=3)+
  ggtitle("Cytolytic activity")+
  labs(x = "TFB", y = "Cyt", col = "TFB-group")

ggplot(TCGA_06, aes(x=TFB,y=cyt, col=group))+geom_point()+
  geom_vline(xintercept = 11.5)+
  geom_hline(yintercept = 55, linetype=3)+
  ggtitle("Cytolytic activity")+
  labs(x = "TFB", y = "Cyt", col = "TFB-group")

library("survival")
library("survminer")

surv_object <- Surv(time = TCGA_06$OS, event = TCGA_06$V)
fit1 <- survfit(surv_object ~ group, data = TCGA_06)
ggsurvplot(fit1, data = TCGA_06, pval = TRUE, risk.table = TRUE)

surv_object <- Surv(time = TCGA_01$OS, event = TCGA_01$V)
fit2 <- survfit(surv_object ~ group, data = TCGA_01)
ggsurvplot(fit2, data = TCGA_01, pval = TRUE, risk.table = TRUE)

surv_object <- Surv(time = Badal$OS, event = Badal$V)
fit3 <- survfit(surv_object ~ group, data = Badal)
ggsurvplot(fit3, data = Badal, pval = TRUE, risk.table = TRUE)
