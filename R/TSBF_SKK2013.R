#' @title Test proposed by Srivastava et al. (2013)
#' @description
#' Srivastava et al. (2013)'s test for testing equality of two-sample high-dimensional mean vectors without assuming that two covariance matrices are the same.
#' @usage tsbf_skk2013(y1, y2)
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
#' Srivastava et al. (2013) proposed the following test statistic:
#'  \deqn{T_{SKK} = \frac{(\bar{\boldsymbol{y}}_1 - \bar{\boldsymbol{y}}_2)^\top \hat{\boldsymbol{D}}^{-1}(\bar{\boldsymbol{y}}_1 - \bar{\boldsymbol{y}}_2) - p}{\sqrt{2 \widehat{\operatorname{Var}}(\hat{q}_n) c_{p,n}}},}
#' where \eqn{\bar{\boldsymbol{y}}_{i},i=1,2} are the sample mean vectors, \eqn{\hat{\boldsymbol{D}}=\hat{\boldsymbol{D}}_1/n_1+\hat{\boldsymbol{D}}_2/n_2} with \eqn{\hat{\boldsymbol{D}}_i,i=1,2} being the diagonal matrices consisting of only the diagonal elements of the sample covariance matrices. \eqn{\widehat{\operatorname{Var}}(\hat{q}_n)} is given by equation (1.18) in Srivastava et al. (2013), and  \eqn{c_{p, n}} is the adjustment coefficient proposed by Srivastava et al. (2013).

#' They showed that under the null hypothesis, \eqn{T_{SKK}} is asymptotically normally distributed.
#'
#'
#' @references
#' \insertRef{Srivastava_2013}{NRAHDLTP}
#'
#' @return A  (list) object of  \code{S3} class \code{htest}  containing the following elements:
#' \describe{
#' \item{statistic}{the test statistic proposed by Srivastava et al. (2013)}
#' \item{p.value}{the \eqn{p}-value of the test proposed by Srivastava et al. (2013)}
#' \item{cpn}{the adjustment coefficient proposed by Srivastava et al. (2013)}
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

#' tsbf_skk2013(y1, y2)
#'
#'
#' @concept ts
#' @export
tsbf_skk2013 <- function(y1, y2) {
  if (nrow(y1) != nrow(y2)) {
    stop("y1 and y2 must have same dimension!")
  } else {
    stats <- tsbf_skk2013_cpp(y1, y2)
    stat <- stats[1]
    cpn <- stats[3]
    pvalue <- pnorm(stat, 0, 1, lower.tail = FALSE, log.p = FALSE)
  }
  names(stat) <- "statistic"
  names(cpn) <- "cpn"
  res <- list(statistic = stat, p.value = pvalue, parameters = cpn)
  class(res) <- "htest"
  return(res)
}
