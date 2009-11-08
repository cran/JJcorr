#require:
library(JJcor);
data(table4);
data(table6);

#correlations and bootstraps
myOC <- copulaCorr(table4,"gauss","MH");
myEC <- empiricalCorr(table4);
mySR <- spearmanCorr(table4);
copulaGF(myOC);
bs1 <- bootstrap(myOC, size=10);
bs2 <- bootstrap(myEC);
bs3 <- bootstrap(mySR);

#polychoric correlations for multiple Copula families and loss functions
myPC <- polyCorr(table4,loss=c("MH","SS"),fitLoss="SS",subdomains=2);
myPC <- polyCorr(table6,loss=c("MH","SS"),fitLoss="SS",subdomains=2);

#Correlation matrix for multiple variables in a dataframe
mydf <- data.frame(W=rbinom(100,1,.5), X=rbinom(100,2,.5), Y=rbinom(100,3,.5), Z=rbinom(100,4,.5));
myMC <- multiCorr(mydf,cop="gauss",loss="MH");
myMC <- multiCorr(mydf,method="spearman");
cor(mydf,method="spearman")

