# Figure 2C

Table_S1$logTFB <- log(Table_S1$TFB + 1)

my_comparisons <- list( c("CRPR", "SD"), c("CRPR", "PD"), c("PD", "SD"))
Table_S1$R <- factor(Table_S1$R, levels=c("CRPR", "SD", "PD"))
dp <- ggplot(Table_S1, aes(x=R, y=logTFB, fill=R)) + 
  geom_violin(trim=FALSE)+
  geom_boxplot(width=0.1, fill="white")+
  labs(title="TFB by RECIST group",x="RECIST", y = "logTFB") + 
  scale_fill_manual(values=c("#1b9e77", "#7570b3", "#d95f02")) +
  theme_classic()
print("Figure 2C: RECIST boxplot")
print(dp + stat_compare_means(comparisons = my_comparisons, label.y = c(6, 6.5, 7)))
