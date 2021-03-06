% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_filter.R
\name{data_filter}
\alias{data_filter}
\title{Filter a cleaned tibble based on user input}
\usage{
data_filter(df, min_price, max_price, sqrt_ft, num_bedroom_input, city_input)
}
\arguments{
\item{df}{tibble}

\item{min_price}{number minimum price}

\item{max_price}{number maximum price}

\item{sqrt_ft}{number footage of the unit}

\item{num_bedroom_input}{number number of bedrooms}

\item{city_input}{char the chosen city}
}
\value{
tibble
}
\description{
Filter a cleaned tibble based on user input
}
\examples{
data_filter(tibble::tibble(
  "listing_url" = c("example.com"), "price" = c(1000),
  "num_bedroom" = c(1), "area_sqft" = c(500), "city" = c("vancouver")
), 1000, 2000, 500, 1, "Vancouver")
}
