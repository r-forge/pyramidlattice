\name{Giza-package}
\alias{Giza-package}
\alias{Giza}
\docType{package}
\title{
Construct multiple population pyramids based on lattice
}
\description{
`Giza' offers a simple way of creating multiple pyramid plots in one graphics window, exploiting the power of the lattice package. It is a handy way of visualizing longitudinal grouped (i.e.: age- and education-structured) data.
}
\details{
\tabular{ll}{
Package: \tab Giza\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2011-11-08\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
Most important functions: pyramidlattice, useOuterStrips2
}
\author{
Erich Striessnig

Maintainer: erich.striessnig@wu.ac.at
}
\references{
Neil Klepeis' heR.Misc package:

http://www.exposurescience.org/hosted-projects/inhalation-exposure-simulation-modeling-project/the-her-software-project
}
\keyword{ package }
\seealso{
`lattice', `heR.Misc'
}
\examples{

require(lattice)

data(EduDat)
data(dictionary)
# select the desired year, country, and education-scenario from EduDat
Years <- c(2010,2030,2050)
Countries <- c("Pakistan","Bangladesh","Indonesia","Brazil")
Scenarios <- c("GET")
# the male-column needs to be flipped
iEduDat <- subset(EduDat,match(cc,getcode(Countries,dictionary)) & match(yr,Years) & match(scen2,Scenarios))
iEduDat$value[iEduDat$sex == "Male"] <- (-1) * iEduDat$value[iEduDat$sex == "Male"]

agegrs <- paste(seq(15,100,5),seq(19,104,5),sep="-")
agegrs[length(agegrs)] <- "100+"

x <- pyramidlattice(agegr ~ value| factor(sex,levels=c("Male","Female")) *
                                   factor(cc,levels=getcode(Countries,dictionary),labels=Countries) *
                                   factor(yr,levels=Years,labels=Years),
           groups=variable,data=iEduDat,layout=c(length(Countries)*2,length(Years)),
           type="l",lwd=3,xlab="Population",ylab="Age",main="Population by Highest Level of Education",
           strip=TRUE,par.settings = simpleTheme(lwd=3,col=colors()[c(35,76,613,28)]),
           scales=list(alternating=3,tick.number=5,relation="same",y=list(at=1:length(4:21),labels=agegrs)),
           auto.key=list(text=c("No-edu","Primary","Secondary","Tertiary"),reverse.row=TRUE,
                           points=FALSE,rectangles=TRUE,space="right",columns=1,border=FALSE,
                           title="ED-Level",cex.title=1.1,lines.title=2.5,padding.text=1,background="white"),
           prepanel=prepanel.default.bwplot2,panel=function(...){
                    panel.grid(h=length(agegrs),v=5,col="lightgrey",lty=3)
                    panel.pyramid(...)
                   })

x # with strips for every factor over each panel
# useOuterStrips(x) # with outer strips, but only in case of two factors
useOuterStrips2(x) # with outer strips in case of three factors

# compare different education-scenarios rather than countries
Countries <- c("Pakistan")
Scenarios <- c("FT","GET","CER")
# the male-column needs to be flipped
iEduDat <- subset(EduDat,match(cc,getcode(Countries,dictionary)) & match(yr,Years) & match(scen2,Scenarios))
iEduDat$value[iEduDat$sex == "Male"] <- (-1) * iEduDat$value[iEduDat$sex == "Male"]

x <- pyramidlattice(agegr ~ value| factor(sex,levels=c("Male","Female")) *
                                   factor(scen2,levels=Scenarios,labels=Scenarios) *
                                   factor(yr,levels=Years,labels=Years),
           groups=variable,data=iEduDat,layout=c(length(Scenarios)*2,length(Years)),
           type="l",lwd=3,xlab="Population",ylab="Age",main=paste("Population by Highest Level of Education, ",Countries,sep=""),
           strip=TRUE,par.settings = simpleTheme(lwd=3,col=colors()[c(35,76,613,28)]),
           scales=list(alternating=3,tick.number=5,relation="same",y=list(at=1:length(4:21),labels=agegrs)),
           auto.key=list(text=c("No-edu","Primary","Secondary","Tertiary"),reverse.row=TRUE,
                           points=FALSE,rectangles=TRUE,space="right",columns=1,border=FALSE,
                           title="ED-Level",cex.title=1.1,lines.title=2.5,padding.text=1,background="white"),
           prepanel=prepanel.default.bwplot2,panel=function(...){
                    panel.grid(h=length(agegrs),v=5,col="lightgrey",lty=3)
                    panel.pyramid(...)
                   })

x # with strips for every factor over each panel
# useOuterStrips(x) # with outer strips, but only in case of two factors
useOuterStrips2(x) # with outer strips in case of three factors
}

