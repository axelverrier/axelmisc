#' Minimum function for payoff_matrix
#'
#' @param x the payoff matrix
#' @param na_rm FALSE by default. If TRUE, payoff duplets with NA will not be computed nor shown.
#'
#' @return The minimum (or minima) of the payoff duplets (gain vector). Social optimum of the game.
#' @importFrom purrr map_vec
#' @export
#'
#' @examples prisoner_dilemma <- payoff_matrix(choices = c("Remaining silent", "Testifying"),
#'   c(10,10),
#'   c(9,4),
#'   c(4,9),
#'   c(1,1))
#' p_min(prisoner_dilemma)
#'

p_min <- function(x, na_rm=FALSE){
  #keep vector only when contains no NA
  if(na_rm==TRUE){x <- x[purrr::map_vec(.x=x, .f=\(x) NA %in% x)==FALSE]}

  min <- min(purrr::map_vec(.x = x, .f = \(x) sum(x,na.rm=TRUE)))
  vec <- purrr::map_vec(.x = x, .f=\(x) {sum(x, na.rm=TRUE)==min})
  vec <- x[vec]
  class(vec) <- "payoff_matrix"
  return(vec)
}
