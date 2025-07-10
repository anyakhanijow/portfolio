library(data.table)
library(ggplot2)


ticker = c('tsla','nvda','nio','f','nflx','aapl','msft','amd','dis','pep','ko')
setDT(DATA)
dt=DATA[(Date<=201612 & Date>=201603) & PRIME %in% toupper(ticker),.(PRIME,Date,`Operating Income`,`Shares Outstanding (Eop)`,`Total Debt Per Share`,`Cash And Cash Equivalents`,`Preferred Stock`,`Minority Interest`)]
names(dt) = c('ticker','date','oi','so','tds','cash','ps','mi')

for(i in ticker)
{
  st = getSymbols(i,auto.assign = FALSE)
  p2017=as.vector(first(st['2017',6],1))
  p2018=as.vector(first(st['2018',6],1))
  p2019=as.vector(first(st['2019',6],1))
  dt[i==tolower(ticker),buy2017:=p2017]
  dt[i==tolower(ticker),buy2018:=p2018]
  dt[i==tolower(ticker),buy2019:=p2019]
}

dt[,c('oi2','oi3','oi4'):=shift(oi,n=1:3),by=ticker]
dt[,oiavg:=(oi+oi2+oi3+oi4)/4]
dt[,ey:=oiavg/(buy2017*so + tds*so - cash + ps +mi)]

dt2 = dt[is.finite(ey)]
dt2 = dt2[order(-ey)]
dt2[,ret1:=(buy2019/buy2017) - 1]
dt2[,ret2:=(buy2019/buy2018) - 1]
ret2017 = dt2[,mean(head(ret1,4))]
ret2018 = dt2[,mean(tail(ret2,4))]

fp = 5000*(1+ret2017) + 5000*(1+ret2018)

exmp3 = function(cr)
{
  t = 5000*(1+cr)^2 + 5000*(1+cr) - fp
  return(t)
}

uniroot(exmp3,lower=0,upper=1)
