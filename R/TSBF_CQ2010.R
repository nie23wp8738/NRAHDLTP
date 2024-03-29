#' @title Test proposed by Chen and Qin (2010)
#' @description
#' Chen and Qin (2010)'s test for testing equality of two-sample high-dimensional mean vectors without assuming that two covariance matrices are the same.
#'
#' @usage tsbf_cq2010(y1, y2)
#' @param y1 The data matrix (p by n1) from the first population. Each column represents a \eqn{p}-dimensional sample.
#' @param y2 The data matrix (p by n2) from the first population. Each column represents a \eqn{p}-dimensional sample.
#'
#' @details
#' Suppose we have two independent high-dimensional samples:
#' \deqn{
#' \boldsymbol{y}_{i1},\ldots,\boldsymbol{y}_{in_i}, \;\operatorname{are \; i.i.d. \; with}\; \operatorname{E}(\boldsymbol{y}_{i1})=\boldsymbol{\mu}_i,\; \operatorname{Cov}(\boldsymbol{y}_{i1})=\boldsymbol{\Sigma}_i,i=1,2.
#' }
#' The primary object is to test
#' \deqn{H_{0}: \boldsymbol{\mu}_1 = \boldsymbol{\mu}_2\; \operatorname{versus}\; H_{1}: \boldsymbol{\mu}_1 \neq \boldsymbol{\mu}_2.}
#' Chen and Qin (2010) proposed the following test statistic:
#'  \deqn{T_{CQ} = \frac{\sum_{i \neq j}^{n_1} \boldsymbol{y}_{1i}^\top \boldsymbol{y}_{1j}}{n_1 (n_1 - 1)} + \frac{\sum_{i \neq j}^{n_2} \boldsymbol{y}_{2i}^\top \boldsymbol{y}_{2j}}{n_2 (n_2 - 1)} - 2 \frac{\sum_{i = 1}^{n_1} \sum_{j = 1}^{n_2} \boldsymbol{y}_{1i}^\top \boldsymbol{y}_{2j}}{n_1 n_2}.}
#'  They showed that under the null hypothesis, \eqn{T_{CQ}} is asymptotically normally distributed.
#'
#' @references
#' \insertRef{Chen_2010}{NRAHDLTP}
#'
#' @return A  (list) object of  \code{S3} class \code{htest}  containing the following elements:
#' \describe{
#' \item{statistic}{the test statistic proposed by Chen and Qin (2010)}
#' \item{p.value}{the \eqn{p}-value of the test proposed by Chen and Qin (2010).}
#' }
#'

#' @examples
#' set.seed(1234)
#' n1 <- 20
#' n2 <- 30
#' p <- 50
#' mu1 <- t(t(rep(0, p)))
#' mu2 <- mu1
#' rho1 <- 0.1
#' rho2 <- 0.2
#' a1 <- 1
#' a2 <- 2
#' w1 <- (-2 * sqrt(a1 * (1 - rho1)) + sqrt(4 * a1 * (1 - rho1) + 4 * p * a1 * rho1)) / (2 * p)
#' x1 <- w1 + sqrt(a1 * (1 - rho1))
#' Gamma1 <- matrix(rep(w1, p * p), nrow = p)
#' diag(Gamma1) <- rep(x1, p)
#' w2 <- (-2 * sqrt(a2 * (1 - rho2)) + sqrt(4 * a2 * (1 - rho2) + 4 * p * a2 * rho2)) / (2 * p)
#' x2 <- w2 + sqrt(a2 * (1 - rho2))
#' Gamma2 <- matrix(rep(w2, p * p), nrow = p)
#' diag(Gamma2) <- rep(x2, p)

#' Z1 <- matrix(rnorm(n1*p,mean = 0,sd = 1), p, n1)
#' Z2 <- matrix(rnorm(n2*p,mean = 0,sd = 1), p, n2)
#' y1 <- Gamma1 %*% Z1 + mu1%*%(rep(1,n1))
#' y2 <- Gamma2 %*% Z2 + mu2%*%(rep(1,n2))

#' tsbf_cq2010(y1, y2)
#'
#'
#' @concept ts
#' @export

tsbf_cq2010 <- function(y1, y2) {
  if (nrow(y1) != nrow(y2)) {
    stop("y1 and y2 must have same dimension!")
  } else {
    stat <- tsbf_cq2010_cpp(y1, y2)
    statn <- stat[1]
    pvalue <- pnorm(
      q = statn, mean = 0, sd = 1, lower.tail = FALSE, log.p = FALSE
    )
  }
  names(statn) <- "statistic"
  res <- list(statistic = statn, p.value = pvalue)
  class(res) <- "htest"
  return(res)
}
