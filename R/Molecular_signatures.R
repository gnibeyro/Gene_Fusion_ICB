library(dplyr)
#MX_TPM is TPM matrix from any of the cohorts

#proliferation signature
TPMt <- t(MX_TPM)
TPMlog <- TPMt+1
TPMlog <- log(TPMlog)
prolif <- Prolif_Hoja_1_1_$X1
cols <- match(prolif, colnames(TPMlog))
cols <- cols[-which(is.na(cols)==T)]
Prolif_logC <- TPMlog[,cols]

Prolif_logC <- exp(Prolif_logC)
Prolif_logC <- as.data.frame(Prolif_logC)

#the number dividing Prolif_logC$Total represent the number of genes in Prolif_logC
Prolif_logC <- Prolif_logC %>%
  mutate(Total = rowSums(.))
Prolif_logC$Prolif <- Prolif_logC$Total/94

#ca20 signature
t_list <- list(TPMlog)
rlist <- list()
ca20<- c("AURKA", "CCNA2", "CCND1", "CCNE2", "CDK1", "CEP63", "CEP152", "E2F1", "E2F2", "LMO4", 
         "MDM2", "MYCN", "NDRG1", "NEK2", "PIN1", "PLK1", "PLK4", "SASS6", "STIL", "TUBG1")

for (i in 1:1) {
  aux_mx <- t_list[[i]]
  aux_mx <- t(aux_mx)
  aux.expr<- aux_mx-median(aux_mx, na.rm=TRUE)
  aux.expr<- aux.expr/sd(aux.expr, na.rm=TRUE)
  rows <- match(ca20, rownames(aux.expr))
  ca20_aux <- aux.expr[rows,]
  aux.scores<- colSums(ca20_aux, na.rm=TRUE)
  rlist[[i]] <- aux.scores
}

ca20_res <- unlist(rlist)

#cytolytic score signature
cols <- match(c("GZMA", "PRF1"), colnames(TPMt))
TPM2 <- TPMt[,cols]
cyt_res <- exp((log(TPM2[,1] + 1)+log(TPM2[,2]+1))/2)

#prepare results
#the vector index represent the column with prolif index
MX_sign <- cbind(Prolif_logC[96], cyt_res, ca20_res)
colnames(MX_sign) <- c("prolif","cyt","cin")