#figure 1B and linear models
#the outliers are removed from the analysis

ca20_Fus <- ggscatter(Table_S1, x = "CA20", y = "TFB",
                      color = "Cohort", palette = "jco",
                      add = "reg.line", conf.int = F)+
  geom_hline(yintercept = 11)+
  ggtitle("CA20")
print("Figure 1B: Cromosomal Instability")
print(ca20_Fus)

Prolif_Fus <- ggscatter(Table_S1[-174,], x = "Prolif", y = "TFB",
                        color = "Cohort", palette = "jco",
                        add = "reg.line", conf.int = F)+
  geom_hline(yintercept = 11)+
  ggtitle("Proliferation")
print("Figure 1B: Proliferation")
print(Prolif_Fus)

CYT_Fus <- ggscatter(Table_S1[-c(78,136),], x = "CYT", y = "TFB",
                     color = "Cohort", palette = "jco",
                     add = "reg.line", conf.int = F)+
  geom_hline(yintercept = 11)+
  ggtitle("Cytolytic activity")
print("Figure 1B: Cytolityc Activity")
print(CYT_Fus)

print("Linear Model: Proliferation")
print(summary(lm(TFB ~ Prolif+Cohort, Table_S1[-174,])))

print("Linear Model: Cytolityc Activity")
print(summary(lm(TFB ~ CYT+Cohort, Table_S1[-c(78,136),])))

print("Linear Model: Cromosomal Instability")
print(summary(lm(TFB ~ CA20+Cohort, Table_S1)))
