DB_TX <- Table_S1[-which(Table_S1$LS == "Dead (not melanoma)"),]
DB_TX <- DB_TX[-which(is.na(DB_TX$OS) == T),]

library(smoothROCtime)
data <- DB_TX[,c("OS","V","TFB")]
data <- as.matrix(data)

AUCbt3 <- 1:100
for(i in 1:100) {
  id_train <- sample(1:146, replace = TRUE)
  train <- data[id_train,]
  SROC <- stRoc(data=train, t=3, meth=1)
  AUCbt3[i] <- SROC[["auc"]][1]
}

AUC3 <- as.numeric(AUCbt3)

sum(AUC3)/100

wilcox.test(AUC3, mu=0.5, alternative = "greater" )

boxplot(AUC3)
