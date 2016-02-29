par(cex=1.4)

set.seed(20330)
v <- c(0.002, 0.02, 0.2)
vlist <- sample(rep(v, 3))

# par(mfrow=c(1, 2))

plot(vlist, xlab="time", ylab="survivorship", type="l", log="y",
	main="Averaging between generations", sub="Geometric mean"
)
abline(h=exp(mean(log(vlist))))

plot(vlist, xlab="space", ylab="survivorship", type="l",
	main="Averaging within generations", sub="Arithmetic mean"
)
abline(h=mean(vlist))
