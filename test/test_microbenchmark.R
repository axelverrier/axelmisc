
microbenchmark("for (i in 1:100000) {result <- sqrt(i)}", rep=3)

a <- Sys.time()
for (i in 1:100000) {result <- sqrt(i)}
b <- Sys.time()
duration <- b-a


system.time(eval(parse(text="for (i in 1:100000) {result <- sqrt(i)}")))
