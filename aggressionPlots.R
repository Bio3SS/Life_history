library(ggplot2); theme_set(theme_bw(base_size=16))
library(dplyr)

library(shellpipes)

yTop <- 5

dat <- rdsRead()
summary(dat)

p <- (ggplot(dat)
	+ aes(x=agg, y=value, color=name)
	+ geom_line()
	+ xlab("Pathogen aggressiveness")
	+ ylim(c(0, yTop))
)

print(p %+% (dat %>% filter(name == "beta")))
print(p %+% (dat %>% filter(name != "R0")))
print(p)
