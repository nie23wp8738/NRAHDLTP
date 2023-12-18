#' @title NRAHDLTP_data COVID19
#' @description
#' A COVID19 data set from NCBI with ID GSE152641. The data set profiled peripheral blood from 24 healthy controls and 62 prospectively enrolled patients with community-acquired lower respiratory tract infection by SARS-COV-2 within the first 24 hours of hospital admission using RNA sequencing.
#'
#' @docType data
#' @keywords datasets
#' @name COVID19
#' @usage data(COVID19)
#' @format ## 'COVID19'
#' A data frame with 86 observations on the following 2 groups.
#' \describe{
#' \item{healthy group1}{row 2 to row 19, and row 82 to 87, in total 24 healthy controls}
#' \item{patients group2}{row 20 to 81, in total 62 prospectively enrolled patients}
#' }
#' @references
#' \insertRef{thair2021transcriptomic}{NRAHDLTP}

#' @concept data
#' @examples
#' library(NRAHDLTP)
#' data(COVID19)
#' dim(COVID19)
#' group1 <- as.matrix(COVID19[c(2:19, 82:87), ])
#' dim(group1)
#' group2 <- as.matrix(COVID19[-c(1:19, 82:87), ])
#' dim(group2)
NULL
