#' Print method for a payoff_matrix
#'
#' @param x The payoff matrix
#'
#' @return x The payoff matrix
#' @importFrom purrr map_vec
#' @export
#'
#' @examples prisoner_dilemma <- payoff_matrix(c("Remaining silent", "Testifying"),
#'   c(10,10),
#'   c(9,4),
#'   c(4,9),
#'   c(1,1))
#' print(prisoner_dilemma)
#'

print.payoff_matrix <- function(x) {
  y <- append(x, attr(x, "choices"))
  col_width <- max(purrr::map_vec(.x = y, .f = \(x) nchar(paste(x, collapse = ","))))

  blank <- "\t\t"
  row_format <- paste("%-", col_width, "s", sep = "")

  cat(paste(sprintf(row_format, attr(x, "choices")[[1]]), blank, sprintf(row_format, attr(x, "choices")[[2]])), "\n")
  cat(paste(sprintf(row_format, paste(x$vec1, collapse = ",")), blank, sprintf(row_format, paste(x$vec2, collapse = ",")), "\n\n", sep = ""))
  cat(paste(sprintf(row_format, paste(x$vec3, collapse = ",")), blank, sprintf(row_format, paste(x$vec4, collapse = ",")), "\n", sep = ""))
}
