#' @title NRAHDLTP_data corneal
#' @description
#' This dataset was acquired during a keratoconus study, a collaborative project involving Ms.Nancy Tripoli and Dr.Kenneth L.Cohen of Department of Ophthalmology at the University of North Carolina, Chapel Hill. The fitted feature vectors for the complete corneal surface dataset collectively into a feature matrix with dimensions of 150 × 2000.
#'
#' @docType data
#' @keywords datasets
#' @name corneal
#' @usage data(corneal)
#' @format ## 'corneal'
#' A data frame with 150 observations on the following 4 groups.
#' \describe{
#' \item{normal group1}{row 1 to row 43 in total 43 rows of the feature matrix correspond to observations from the normal group}
#' \item{unilateral suspect group2}{row 44 to row 57 in total 14 rows of the feature matrix correspond to observations from the unilateral suspect group}
#' \item{suspect map group3}{row 58 to row 78 in total 21 of the feature matrix correspond to observations from the suspect map group}
#' \item{ clinical keratoconus group4}{row 79 to row 150 in total 72 of the feature matrix correspond to observations from the clinical keratoconus group}
#' }
#' @references
#' \insertRef{smaga2019linear}{NRAHDLTP}

#' @concept data
#' @examples
#' library(NRAHDLTP)
#' data(corneal)
#' dim(corneal)
#' group1 <- as.matrix(corneal[1:43, ])
#' dim(group1)
#' group2 <- as.matrix(corneal[44:57, ])
#' dim(group2)
#' group3 <- as.matrix(corneal[58:78, ])
#' dim(group3)
#' group4 <- as.matrix(corneal[79:150, ])
#' dim(group4)
NULL
