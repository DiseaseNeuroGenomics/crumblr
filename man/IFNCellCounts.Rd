% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{IFNCellCounts}
\alias{IFNCellCounts}
\alias{info}
\alias{cellCounts}
\title{Cell counts following interferon treatment}
\format{
\itemize{    
\item \code{info} is metadata for each sample
\item \code{cellCounts} data.frame of counts for each sample
}

An object of class \code{data.frame} with 16 rows and 4 columns.

An object of class \code{matrix} (inherits from \code{array}) with 16 rows and 8 columns.
}
\usage{
data(IFNCellCounts)

info

cellCounts
}
\description{
Counts are from single cell RNA-seq data from treated and untreated samples from \insertCite{kang2018multiplexed}{crumblr}.
}
\references{
{
  \insertRef{kang2018multiplexed}{crumblr}
}
}
\keyword{datasets}
