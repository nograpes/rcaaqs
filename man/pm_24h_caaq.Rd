% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pm_24h_caaq.R
\name{pm_24h_caaq}
\alias{pm_24h_caaq}
\title{Calculates the three year average for the PM2.5 24 hour metric}
\usage{
pm_24h_caaq(data, year = "year", val = "ann_98_percentile", by = NULL,
  cyear = "latest")
}
\arguments{
\item{data}{data frame containing annual 98th percentile values.}

\item{year}{name of the column containing the year. Default \code{"year"}}

\item{val}{name of the column containing annual 98th percentile values.
Default \code{"ann_98_percentile"}}

\item{by}{character vector of grouping variables in data, probably an id if
using multiple sites. Even if not using multiple sites, you shoud specfify
the id column so that it is retained in the output.}

\item{cyear}{The year to calculate the metric for (this will be the latest of
the three years used in the calculation). Can be "latest" to use the latest 
year found in the data frame, or an integer denoting the year.}
}
\value{
a data frame, with year, the value, and the number of years the value 
 is based on
}
\description{
Flags if based on only two years.
}

