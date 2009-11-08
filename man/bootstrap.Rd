\name{bootstrap}
\Rdversion{1.1}
\alias{bootstrap}

\title{
	Non parametric bootstrap for a fitted correlation.
}
\description{
	This function performs a non parametric bootstrap for a fitted correlation. The argument should be an object returned by copulaCorr, empiricalCorr or spearmanCorr.
}
\usage{
	bootstrap(model, size)
}

\arguments{
	  \item{model}{
		a correlation object as returned by functions copulaCorr, empiricalCorr or spearmanCorr.
	}
	  \item{size}{
		the number of resamples
	}
}

\value{
 \item{model}{copy of the object argument model}
 \item{r}{vector with correlation (r) values for every sample}
 \item{theta}{only for copulaCorr models: vector of fitted theta values for the Copula distribution}
 \item{loss}{only for copulaCorr models: vector of loss values for the fitted Copula distribution}
}


\examples{

	#load contingency table
	data(table4);

	#fit a copula correlation
	myOC <- copulaCorr(table4,"gauss","MH");
	bs1 <- bootstrap(myOC, size=10);
	print(bs1);

	#fit an empirical correlation
	myEC <- empiricalCorr(table4);
	bs2 <- bootstrap(myEC);

	#fit a spearman correlation
	mySR <- spearmanCorr(table4);
	bs3 <- bootstrap(mySR);
}
