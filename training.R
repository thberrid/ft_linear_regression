#!/usr/bin/Rscript --save --no-restore


normalize <- function(x, set){
	x / (max(set) - min(set))
}

unnormalize <- function(x, set){
	x * (max(set) - min(set))
}

args <-commandArgs(TRUE)
datasCSV <- read.csv(args[1])

X11()
plot(datasCSV)

datas_normed <- normalize(datasCSV, datasCSV)

X <- datas_normed[[1]]
Y <- datas_normed[[2]]

m <- length(X)
α <- 5 / 10
Θ0 <- 0
Θ1 <- 0
i <- 1

cat("learning ... \n")
while (1){
	h <- function(x){ Θ0 + Θ1 * x }
	abline(unnormalize(Θ0, datasCSV), Θ1, col=adjustcolor("lightgrey", alpha=0.1))
	tmp0 <- Θ0 - (α * (1 / m) * sum(h(X) - Y))
	tmp1 <- Θ1 - (α * (1 / m) * sum((h(X) - Y) * X))
#	cat(c(tmp0, Θ0, tmp1, Θ1), sep="\n", "-----------")
	if (isTRUE(all.equal(tmp0, Θ0)) & isTRUE(all.equal(tmp1, Θ1))){
		Θ0 <- unnormalize(Θ0, datasCSV)
		abline(Θ0, Θ1, col="red")
		break
	}
	Θ0 <- tmp0
	Θ1 <- tmp1
	i <- i + 1
}

cat("ok done, you can launch the predict program.\nRecap :\n")
cat(α, " (learning ratio)\n")
cat(i, " (iterations)\n")
cat("values of Θs parameters : \n")
Θ0
Θ1
message("Press Return To Continue")
invisible(readLines("stdin", n=1))