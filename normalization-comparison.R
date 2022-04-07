# Normalization method comparison and qq plots

library("ggplot2")
library("gridExtra")

thm = theme_minimal() + theme(text = element_text(size = 16)) 
res = seq(0,1,by=.001)  # resolution variable

# Minmax normalization
minmax = function(x) {
	xprime = (x-min(x)) / ( max(x) - min(x) )
}

pl = function(df, dfn, dfs, dfm) {
	plots = list()

	## Distribution plot
	plots[[1]] = ggplot(df, aes(x=val, group=samp, color=samp)) + geom_density() + thm + ggtitle("Raw")

	## QQ plot
	plots[[5]] = ggplot() + geom_point(aes(x = quantile(d1, res), y = quantile(d2, res)), alpha=.6) + geom_abline(slope=1,intercept = 0) + thm + ggtitle("QQ Raw")

	## Dist after snorm
	plots[[2]] = ggplot(dfs, aes(x=val, group=samp, color=samp)) + geom_density() + thm  + ggtitle("Standard")

	plots[[6]] = ggplot() + geom_point(aes(x = quantile(d1s, res), y = quantile(d2s, res))) + theme_minimal() + theme(text = element_text(size = 16)) + geom_abline(slope=1,intercept = 0) + ggtitle("QQ Standard")

	## mmnorm
	plots[[3]] = ggplot(dfm, aes(x=val, group=samp, color=samp)) + geom_density() + thm + ggtitle("Minmax")

	plots[[7]] =ggplot() + geom_point(aes(x = quantile(d1m, res), y = quantile(d2m, res))) + theme_minimal() + theme(text = element_text(size = 16)) + geom_abline(slope=1,intercept = 0) + ggtitle("QQ Minmax")

	## qnorm
	plots[[4]] = ggplot(dfn, aes(x=val, group=samp, color=samp, linetype=samp)) + geom_density() + thm + ggtitle("Quantile")

	plots[[8]] = ggplot() + geom_point(aes(x = quantile(d1n, res), y = quantile(d2n, res))) + theme_minimal() + theme(text = element_text(size = 16)) + geom_abline(slope=1,intercept = 0) + ggtitle("QQ Quantile")

	plots
}

# Choose a set of d1 and d2 to compare
d1 = rexp(5000, 2)
d2 = rexp(5000, 4)

d1 = rnorm(5000, 3, 1)
d2 = rnorm(5000, 3, 2)

d1 = c(rnorm(2000, 2, 1), rnorm(3000, 6, 2))
d2 = rnorm(5000, 3, 2)

d1 = c(rnorm(4995, 3, 2), rnorm(5, 35, 1))
d2 = rnorm(5000, 3, 2)

d1 = rnorm(5000, 3, 4)
d2 = rexp(5000, 3, 2)

d1 = rbinom(5000, 30, .5)
d2 = rpois(5000, 15)


df = data.frame(val=c(d1, d2), samp=factor(rep(c(1,2), each=5000)))

# Quantile normalization
R = apply(cbind(sort(d1),sort(d2)), 1, mean)
d1n = R[rank(d1)] # d1 normalized
d2n = R[rank(d2)] # d2 normalized
dfn = data.frame(val=c(d1n, d2n), samp=factor(rep(c(1,2), each=5000)))

# Standard normalization
d1s = scale(d1)
d2s = scale(d2)
dfs = data.frame(val=c(d1s, d2s), samp=factor(rep(c(1,2), each=5000)))

# Minmax normalization
d1m = minmax(d1)
d2m = minmax(d2)
dfm = data.frame(val=c(d1m, d2m), samp=factor(rep(c(1,2), each=5000)))

# Plot
p = pl(df, dfn, dfs, dfm)
do.call(function(...) grid.arrange(..., ncol=4), p)
