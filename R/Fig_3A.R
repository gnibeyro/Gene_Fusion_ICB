total_genes <- Table_S2[,c(1,5,4)]
colnames(total_genes) <- c("Sample","Gene","Group")
total_genes2 <- Table_S2[,c(1,6,4)]
colnames(total_genes2) <- c("Sample","Gene","Group")
total_genes <- rbind(total_genes,total_genes2)

for (i in 1:length(total_genes$Gene)) {
  gen <- total_genes$Gene[i]
  if (str_detect(gen, ",") == T) {
    row_g <- total_genes[i,]
    row_g[2] <- str_split_fixed(gen, ",",2)[1,2]
    total_genes$Gene[i] <- str_split_fixed(gen, ",",2)[1,1]
    total_genes <- rbind(total_genes, row_g)
  }
}

total_genes$Gene <- gsub(r"{\s*\([^\)]+\)}","",as.character(total_genes$Gene))

gene_t <- unique(total_genes)

gene_freq_t <- as.data.frame(table(gene_t$Gene,gene_t$Group))
colnames(gene_freq_t) <- c("Gene", "Group", "Freq")
gene_freq_t <- gene_freq_t %>% pivot_wider(names_from = Group, values_from = Freq)
gene_freq_t$total <- gene_freq_t$high + gene_freq_t$low

gene_freq_t$total_per <- gene_freq_t$total*100/222
gene_freq_t$high_per <- gene_freq_t$high*100/54
gene_freq_t$low_per <- gene_freq_t$low*100/168

Gene_overlapping <- gene_freq_t[which(gene_freq_t$total_per > 2),]
Gene_overlapping2 <- Gene_overlapping[which(Gene_overlapping$high > 0 & Gene_overlapping$low > 0),]
ORdf <- Gene_overlapping2[,1:4]
ORdf <- as.data.frame(ORdf)
colnames(ORdf) <- c("Gene","OR","Lower", "Upper")

data <- matrix(c(0,0,0,0), ncol = 2, byrow = T)
colnames(data) <- c("HTFB", "LTFB")
rownames(data) <- c("pos", "neg")
data <- as.table(data)

for(i in 1:19){
  data[1,1] <- Gene_overlapping2$high[i]
  data[1,2] <- Gene_overlapping2$low[i]
  data[2,1] <- 54 - Gene_overlapping2$high[i]
  data[2,2] <- 168 - Gene_overlapping2$low[i]
  info <- epi.2by2(data)
  ORdf[i,2:4] <- info$massoc.detail$OR.strata.wald
}

ORdf <- ORdf[order(ORdf$OR,decreasing=TRUE ),]

## Plot forest plot
ORdf$index <- c(1:19)
plot1 <- ggplot(ORdf, aes(y = index, x = OR)) +
  geom_point(shape = 18, size = 5) +  
  geom_errorbarh(aes(xmin = Lower, xmax = Upper), height = 0.25) +
  geom_vline(xintercept = 1, color = "red", linetype = "dashed", cex = 1, alpha = 0.5) +
  scale_y_continuous(name = "", breaks=1:19, labels = ORdf$Gene, trans = "reverse") +
  xlab("Odds Ratio (95% CI)") + 
  ylab(" ") + 
  theme_bw() +
  theme(panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black"),
        axis.text.y = element_text(size = 12, colour = "black"),
        axis.text.x.bottom = element_text(size = 12, colour = "black"),
        axis.title.x = element_text(size = 12, colour = "black"))
print("Figure 3A: Odds Ratio for TFB-groups")
print(plot1)

for(i in 1:19){
  data[1,1] <- Gene_overlapping2$high[i]
  data[1,2] <- Gene_overlapping2$low[i]
  data[2,1] <- 54 - Gene_overlapping2$high[i]
  data[2,2] <- 168 - Gene_overlapping2$low[i]
  info <- epi.2by2(data)
  Gene_overlapping2[i,8] <- info$massoc.detail$OR.strata.wald[1]
  Gene_overlapping2[i,9] <- info$massoc.detail$chi2.strata.fisher[4]
}

colnames(Gene_overlapping2)[8:9] <- c("OR","p_value")
print("Gene frequency table")
print(Gene_overlapping2)
