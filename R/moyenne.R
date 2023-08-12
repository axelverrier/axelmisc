#' Moyenne d'un vecteur
#'
#' Une fonction pour faire une moyenne en enlevant les valeurs manquantes.
#'
#' @param x A numericla vector
#'
#' @return returns the mean of x, minus NA
#' @importFrom stats na.omit
#'
#' @examples moyenne(c(4,5))
#' @export


moyenne <- function(x){
  x <- na.omit(x)
  sum(x)/length(x)
}
