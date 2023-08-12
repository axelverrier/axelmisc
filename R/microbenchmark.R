#' A microbenchmarking function
#'
#' Use this to analyze your code and find what is the most efficient piece of code.
#' Duration is computed using system.time() and is composed of solely system time.
#'
#'
#' @param ... Quoted expressions to analyse.
#' @param rep A number of time your code will be repeated, for better accuracy.
#' @param visual FALSE by default. If TRUE, returns a boxplot instead of values
#'
#' @return Either a list of ...length vectors of duration, or a boxplot of those vectors.
#' @importFrom graphics boxplot
#' @export
#'
#' @examples microbenchmark("for (i in 1:1000000) {result <- sqrt(i)}",
#' "for (i in 1:1000000) {result <- i^2}", rep=10)
#'


microbenchmark <- function(..., rep=50, visual=FALSE){
  formulas <- list(...)
  efficiency <- list()
  for (i in formulas){
    time <- c()
    for (j in 1:rep){
      duration <- system.time(eval(parse(text=i), envir = .GlobalEnv))
      time <- c(time, as.numeric(duration[3]))
    }
    efficiency <- append(efficiency, list(time))
  }

  if(visual==TRUE){
    return(boxplot(efficiency, horizontal=TRUE))
  }else{
    return(efficiency)
  }
}
