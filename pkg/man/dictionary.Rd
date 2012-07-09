\name{dictionary}
\alias{dictionary}
\docType{data}
\title{
UN Country Codes
}
\description{Country-names and corresponding country-codes as used by the United Nations Population Division}
\usage{data(dictionary)}
\format{
  A data frame with 228 observations on the following 2 variables.
  \describe{
    \item{\code{area}}{a factor with levels \code{Afghanistan} \code{AFRICA} \code{Albania} \code{...} }
    \item{\code{ccode}}{a numeric vector}
  }
}
\source{http://esa.un.org/unpd/wpp/unpp/panel_population.htm}
\examples{
  data(dictionary)
  head(dictionary)

  getname(156,dictionary)
  getcode("China",dictionary)
}
\keyword{datasets}
