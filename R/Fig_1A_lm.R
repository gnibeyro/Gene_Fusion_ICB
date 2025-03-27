library(ggplot2)
library(ggpubr)

#figure 1A and linear models
#the outliers are removed from the analysis

ca20_Fus <- ggscatter(Table_S1, x = "CA20", y = "TFB",
                      color = "Cohort", palette = "jco",
                      add = "reg.line", conf.int = F)+
  geom_hline(yintercept = 11)+
  ggtitle("CA20")

Prolif_Fus <- ggscatter(Table_S1[-174,], x = "Prolif", y = "TFB",
                        color = "Cohort", palette = "jco",
                        add = "reg.line", conf.int = F)+
  geom_hline(yintercept = 11)+
  ggtitle("Proliferation")

CYT_Fus <- ggscatter(Table_S1[-c(78,136),], x = "CYT", y = "TFB",
                     color = "Cohort", palette = "jco",
                     add = "reg.line", conf.int = F)+
  geom_hline(yintercept = 11)+
  ggtitle("Cytolytic activity")

summary(lm(TFB ~ Prolif+Cohort, Table_S1[-174,]))
summary(lm(TFB ~ CYT+Cohort, Table_S1[-c(78,136),]))
summary(lm(TFB ~ CA20+Cohort, Table_S1))
