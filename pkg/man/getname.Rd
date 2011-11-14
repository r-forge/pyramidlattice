\name{getname}
\alias{getname}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
getname Function
}
\description{
Extract the UN country name for a given country code
}
\usage{
getname(ccode, dictionary)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ccode}{
any country code in dictionary
}
  \item{dictionary}{see ?dictionary
}
}
\details{
This is the ``inverse'' of the `getcode' function.
}
\value{
the name of the country corresponding to the ccode value in question
}
\author{
Erich Striessnig <erich.striessnig@wu.ac.at>
}
\seealso{
`getcode'
}
\examples{
data(dictionary)
getname(156,dictionary)
}
