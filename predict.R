#!/usr/bin/Rscript --no-save --restore

message("enter a numeric value to get a related prediction : ")

user_input <- readLines("stdin", n=1)
x <- as.numeric(user_input);
if ((is.na(x))){
	cat("enter a numeric value only\n")
	q()
}

if (isFALSE(exists("Θ0")) | isFALSE(exists("Θ1"))){
	Θ0 <- 0
	Θ1 <- 0
}

cat("Θs parameters : ", c(Θ0, Θ1), "\n")
cat("prediction : ", Θ0 + Θ1 * x, "\n")