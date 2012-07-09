\name{EduDat}
\alias{EduDat}
\docType{data}
\title{
IIASA/VID population data by age, sex, and education
}
\description{
Reconstruction of populations by age, sex and highest level of educational attainment for 142 countries for 1970-2000
using demographic back-projection methods together with education forward projections for 2000-2050.}
\usage{data(EduDat)}
\format{
  A data frame with 1009152 observations on the following 7 variables.
  \describe{
    \item{\code{cc}}{a numeric vector containing the UN's country codes}
    \item{\code{yr}}{a numeric vector indicating the year of the data point}
    \item{\code{sex}}{a character vector}
    \item{\code{agegr}}{a numeric vector}
    \item{\code{scen2}}{a factor with levels \code{BP} \code{CEN} \code{CER} \code{FT_Singapore_TR} \code{GET} \code{UN}
    
                        \dots different population projection scenarios - see References.}
    \item{\code{variable}}{a factor with levels \code{e1} \code{e2} \code{e3} \code{e4}}
    \item{\code{value}}{a numeric vector
    
    \dots the number of people in the respective country, year, by sex, age, and educational attainment level}
  }
}
\source{
http://www.iiasa.ac.at/Research/POP/edu07/index.html
}
\references{
Lutz, W., A. Goujon, S. KC, and W. Sanderson. 2007. Reconstruction of populations by age, sex and level of educational attainment for 120 countries for 1970-2000. Vienna Yearbook of Population Research 2007:193-235.\\

KC, S., B. Barakat, A. Goujon, V. Skirbekk, and W. Lutz. 2010. Projection of populations by level of educational attainment, age, and sex for 120 countries for 2005-2050. Demographic Research 22:383-472.
}
\examples{

data(EduDat)
data(dictionary)

icountry <- "China"
ipop <- subset(EduDat,cc==getcode(icountry,dictionary) & scen2 != "BP")
ipop <- cast(ipop,yr~scen2,sum)
row.names(ipop) <- ipop[,1]
matplot(as.data.frame(ipop[,-1]),type="l",lwd=3,main=paste("Projected Population 15+ by Education Scenario, ",icountry,sep=""),cex.main=1.8,
        xlab="Year",ylab="Total Population in 1000s",xaxt="n",cex=1.5,cex.axis=1.5,cex.lab=1.5)
axis(1,at=1:nrow(ipop),labels=row.names(ipop),cex.axis=1.5)
grid(lwd=2,lty=2)
legend(legend=names(ipop[,-1]),title="Education Scenario: ",
       col=1:ncol(ipop[,-1]),lwd=3,lty=1:ncol(ipop[,-1]),
       "topleft",inset=c(0.02,0.02),bty="o",bg="grey",cex=1.5)
}
\keyword{datasets}
