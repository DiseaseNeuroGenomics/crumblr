% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crumblr.R
\name{crumblr}
\alias{crumblr}
\alias{crumblr,matrix-method}
\alias{crumblr,data.frame-method}
\title{Count ratio uncertainty modeling based linear regression}
\usage{
crumblr(counts, pseudocount = 0.5, tau = 1)

\S4method{crumblr}{matrix}(counts, pseudocount = 0.5, tau = 1)

\S4method{crumblr}{data.frame}(counts, pseudocount = 0.5, tau = 1)
}
\arguments{
\item{counts}{count data with samples as rows and variables are columns}

\item{pseudocount}{added to counts to avoid issues with zeros}

\item{tau}{overdispersion parameter for Dirichlet multinomial.  If \code{NULL}, estimate from observed counts.}
}
\value{
An \code{EList} object with the following components:
\itemize{
 \item{E: }{numeric matrix of CLR transformed counts}
 \item{weights: }{numeric matrix of observation-level inverse-variance weights}
}
}
\description{
Count ratio uncertainty modeling based linear regression (crumblr) returns CLR-transformed counts and observation-level inverse-variance weights for use in weighted linear models.
}
\details{
Evalute the centered log ratio (CLR) transform of the count matrix, and the asymptotic theoretical variances of each transformed observation.  The asymptotic normal approximation is increasingly accurate for small overdispersion \eqn{\tau}, large total counts \eqn{C}, and large proportions \eqn{p}, but shows good agreement with the empirical results in most situtations. In practice, it is often reasonable to assume a sufficient number of counts before a variable is included in an analysis anyway.  But the feasability of this assumption is up to the user to determine.
}
\examples{

# set probability of each category
prob = c(0.1, 0.2, 0.3, 0.5)

# number of total counts
countsTotal = 300

# number of samples
n_samples = 100

# simulate info for each sample
info = data.frame(Age = rgamma(n_samples, 50, 1))
rownames(info) = paste0("sample_", 1:n_samples)

# simulate counts from multinomial
counts = t(rmultinom(n_samples, size = countsTotal, prob = prob))
colnames(counts) = paste0("cat_", 1:length(prob))
rownames(counts) = paste0("sample_", 1:n_samples)

# run crumblr on counts
cobj = crumblr(counts)

# run standard variancePartition analysis on crumblr results
library(variancePartition)

fit = dream(cobj, ~ Age, info)
fit = eBayes(fit)

topTable(fit, coef="Age", sort.by="none")

}
\seealso{
\code{limma::voom}, \code{variancePartition::dream}
}
