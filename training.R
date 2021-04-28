#!/usr/bin/Rscript --save --no-restore

# ? display number of iteration
# set alpha with args["alpha=.5"]
# check data x.len = y.len
# 
# source("sources/index.R")
args <-commandArgs(TRUE)
datasCSV <- read.csv(args[1])

X11()
plot(datasCSV)

X <- datasCSV[[1]]
Y <- datasCSV[[2]]
α <- 0.005
Θ0 <- 0
Θ1 <- 0
m <- length(X)
i = 0
cat("learning ... \n")
while (1){
	h <- function(x){ Θ0 + Θ1 * x }
	tmp0 <- Θ0 - (α * (1 / m) * sum(h(X) - Y))
	tmp1 <- Θ1 - (α * (1 / m) * sum((h(X) - Y) * X))
	cat(c(tmp0, Θ0, tmp1, Θ1), sep="\n", "-----------")
#	if (tmp0 == Θ0 && tmp1 == Θ1 || i > 5){
#	if (tmp0 == Θ0 && tmp1 == Θ1){
	if (tmp1 == Θ1){
		cat("LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOL")
		break
	}
	Θ0 <- tmp0
	Θ1 <- tmp1
	i <- i + 1
}
cat("ok done, you can launch the predict program.\n")
Θ0
Θ1
message("Press Return To Continue")
invisible(readLines("stdin", n=1))