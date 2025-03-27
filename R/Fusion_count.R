library(plyr)
library(tidyr)
library(dplyr)

Fusions <- Table_S2
Metadata <- Table_S1

Fus_count <-ldply(unique(Fusions$Sample),function(x){
  set <- subset(Fusions, Sample==x)
  tf <- nrow(set)
  pf <- sum(set$peptide_sequence !=".")
  h <- nrow(set[which(set$confidence == "high"),])
  m <- nrow(set[which(set$confidence == "medium"),])
  l <- nrow(set[which(set$confidence == "low"),])
  onf <- nrow(set[which(set$reading_frame == "out-of-frame"),])
  inf <- nrow(set[which(set$reading_frame == "in-frame"),])
  h_p <- nrow(set[which(set$confidence == "high" & set$peptide_sequence !="."),])
  h_of <- nrow(set[which(set$confidence == "high" & set$reading_frame == "out-of-frame"),])
  data.frame(Sample=x,Fus=tf,Prot=pf,hc=h,mc=m,lc=l,in_f=inf,out_f=onf,hc_prot=h_p,hc_of=h_of)
})
View(Fus_count)