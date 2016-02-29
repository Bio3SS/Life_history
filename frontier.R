xvec <- seq(0,7,length=101)

ff <- function(x, xmax, ymax) {
	diff <- pmax(0, xmax-x)
	s <- (xmax+1)/xmax
	return(s*ymax*diff/(1+diff))
}

frontier <- ff(xvec,ymax=1.2,xmax=6)
sub <- ff(xvec,ymax=1.1,xmax=5.5)

par(las=1,bty="l",xaxs="i",yaxs="i",mgp=c(1,0,0),cex=1.5)

cplot <- function(x, f){
	plot(x, f
		, xlab="Reproduction",ylab="Survival"
		, axes=FALSE, type="l"
	)
}

poly <- function(x, f, col){
	polygon(
		c(x, rev(x))
		, c(f, 0*f)
		, col=col
	)
}

aplot <- function(x, f){
	cplot(x, f)
	poly(x, 0*f+max(f), "lightgrey")
	poly(x, f, "white")
	text(5.5, 1.0 , "inaccessible")
}

## Accessible
aplot(xvec, frontier)

## Optimal
aplot(xvec, frontier)
poly(xvec, sub, "lightgrey")
text(3,0.7,"suboptimal")
