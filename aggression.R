library(dplyr)
library(tidyr)

library(shellpipes)

max <-10
points <- 50
betMax <- 5
dSlope <- 8
dFeed <- 0.8

dat <- tibble(NULL
	, agg = seq(0, max, length.out=points)
	, beta = agg*betMax/(agg+betMax)
	, D = agg*dSlope*exp(-agg*dFeed)
	, R0 = beta*D
)

longdat <- (dat
	%>% pivot_longer(beta:R0)
)

rdsSave(longdat)
