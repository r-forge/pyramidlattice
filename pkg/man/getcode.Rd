\name{getcode}
\alias{getcode}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
getcode Function
}
\description{
Extract the UN country code for a given country
}
\usage{
getcode(cname, dictionary)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cname}{\dots any country name in dictionary}
  \item{dictionary}{\dots see data(dictionary)}
}
\details{
``inverse'' of getname function
}
\value{
the UN country-code for the country in question
}
\author{
Erich Striessnig <erich.striessnig@wu.ac.at>
}
\seealso{
getname
}
\examples{
data(dictionary)
getcode("China",dictionary)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
