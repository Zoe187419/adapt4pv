% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lasso_cv.R
\name{lasso_cv}
\alias{lasso_cv}
\title{wrap function for \code{cv.glmnet}}
\usage{
lasso_cv(x, y, nfolds = 5, foldid = NULL, betaPos = TRUE, ...)
}
\arguments{
\item{x}{Input matrix, of dimension nobs x nvars. Each row is an observation
vector. Can be in sparse matrix format (inherit from class
\code{"sparseMatrix"} as in package \code{Matrix}).}

\item{y}{Binary response variable, numeric.}

\item{nfolds}{Number of folds - default is 5. Although \code{nfolds} can be
as large as the sample size (leave-one-out CV), it is not recommended for
large datasets. Smallest value allowable is \code{nfolds=3}.}

\item{foldid}{An optional vector of values between 1 and \code{nfolds}
identifying what fold each observation is in.
If supplied, \code{nfolds} can be missing.}

\item{betaPos}{Should the covariates selected by the procedure be positively
associated with the outcome ? Default is \code{TRUE}.}

\item{\dots}{Other arguments that can be passed to \code{cv.glmnet}
from package \code{glmnet} other than \code{nfolds}, \code{foldid},
and \code{family}.}
}
\value{
An object with S3 class \code{"log.lasso"}.
\item{beta}{Numeric vector of regression coefficients in the lasso.
In \code{lasso_cv} function, the regression coefficients are PENALIZED.
Length equal to nvars.}
\item{selected_variables}{Character vector, names of variable(s) selected with the
lasso-cv approach.
If \code{betaPos = TRUE}, this set is the covariates with a positive regression
coefficient in \code{beta}.
Else this set is the covariates with a non null regression coefficient in
\code{beta}.
Covariates are ordering according to magnitude of their regression
coefficients absolute value.}
}
\description{
Fit a first cross-validation on lasso regression and return selected covariates.
Can deal with very large sparse data matrices.
Intended for binary reponse only (option \code{family = "binomial"} is forced).
Depends on the \code{cv.glmnet} function from the package \code{glmnet}.
}
\examples{

set.seed(15)
drugs <- matrix(rbinom(100*20, 1, 0.2), nrow = 100, ncol = 20)
colnames(drugs) <- paste0("drugs",1:ncol(drugs))
ae <- rbinom(100, 1, 0.3)
lcv <- lasso_cv(x = drugs, y = ae, nfolds = 3)


}
\author{
Emeline Courtois \cr Maintainer: Emeline Courtois
\email{emeline.courtois@inserm.fr}
}
