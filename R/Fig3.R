# Figure 3A

M2 <- ggplot(Table_S1, aes(x=group, y=Macrophages.M2, fill=group)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggtitle("M2") + stat_compare_means()
print("Figure 3A: M2 macrophages")
print(M2)

# Figure 3B

#Data preparation
DB_TX <- Table_S1[-which(Table_S1$LS == "Dead (not melanoma)"),]
DB_TX <- DB_TX[-which(is.na(DB_TX$OS) == T),]
DB_TX$group <- factor(DB_TX$group, levels = c("low", "high"))
DB_TX$V <- ifelse(DB_TX$LS == "Alive", 0, 1)

#Cox model creation
TME <- coxph( Surv(OS, V) ~ TFB + Macrophages.M2 + T.cells.CD8 + PD_L1log ,
              data = as.data.frame(DB_TX))
#Forest plot
TME_plot <- print(ggforest(TME, fontsize = 1) +  
                    theme(text = element_text(size = 14),
                          axis.text = element_text(size = 12),
                          legend.text = element_text(size = 12),
                          legend.title = element_text(size = 14)))
print("Figure 3B: TME forestplot")
print(TME_plot)

#Figure 3C
TMB_plot <- ggscatter(Table_S1, x = "nsMUT", y = "TFB", palette = "jco",
                      add = "reg.line", conf.int = F)+ 
  geom_hline(yintercept = 11)+
  stat_cor(aes(), label.x = 3)+
  ggtitle("TMB")
print("Figure 3C: TMB correlation")
print(TMB_plot)

#Figure 3D
TMB_plot2 <- ggplot(Table_S1, aes(x=group, y=nsMUT, fill=group)) +
  geom_boxplot() + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  ggtitle("nsMUT") + stat_compare_means()
print("Figure 3D: TMB distribution")
print(TMB_plot2)

