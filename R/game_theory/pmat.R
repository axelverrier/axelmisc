#' Payoff matrix (2x2)
#'
#' Creates a payoff matrix for a 2 players 2 choices situation, where every player has the 2 same choices.
#'
#' @param choices A vector of 2 choices (same choices for the two players)
#' @param vec1 Payoff duplet n°1 (position in the matrix : (1,1))
#' @param vec2 Payoff duplet n°2 (position in the matrix : (1,2))
#' @param vec3 Payoff duplet n°3 (position in the matrix : (2,1))
#' @param vec4 Payoff duplet n°4 (position in the matrix : (2,2))
#'
#' @return a payoff matrix of class payoff_matrix
#' @export
#'
#' @examples #Prisoner's dilemma (matrix with utilities, not years of prison)
#' prisoner_dilemma <- payoff_matrix(c("Remaining silent", "Testifying"),
#'   c(10,10),
#'   c(9,4),
#'   c(4,9),
#'   c(1,1))
#'
#'
payoff_matrix <- function(choices, vec1, vec2, vec3, vec4){
  data <- list(vec1 = vec1, vec2 = vec2, vec3 = vec3, vec4 = vec4)

  if(length(data)!=4){return("Wrong number of values. There should be 4 payoff vectors.")}
  if(length(choices)!=2){return("Wrong number of values. There should be 2 choices.")}

  class(data) <- "payoff_matrix"
  attr(data, "choices") <- choices
  return(data)
}
