#' @title Test proposed by Zhu and Zhang (2022)
#' @description
#' Zhu and Zhang (2022)'s test for general linear hypothesis testing (GLHT) problem for high-dimensional data with assuming that underlying covariance matrices are the same.
#' @usage glht_zz2022(Y,G,n,p)
#' @param Y A list of \eqn{k} data matrices.  The \eqn{i}th element represents the data matrix (\eqn{p\times n_i}) from the \eqn{i}th population with each column representing a \eqn{p}-dimensional sample.
#' @param G A known full-rank coefficient matrix (\eqn{q\times k}) with \eqn{\operatorname{rank}(\boldsymbol{G})<k}.
#' @param n A vector of \eqn{k} sample sizes. The \eqn{i}th element represents the sample size of group \eqn{i}, \eqn{n_i}.
#' @param p The dimension of data.
#'
#' @details
#' Suppose we have the following \eqn{k} independent high-dimensional samples:
#' \deqn{
#' \boldsymbol{y}_{i1},\ldots,\boldsymbol{y}_{in_i}, \;\operatorname{are \; i.i.d. \; with}\; \operatorname{E}(\boldsymbol{y}_{i1})=\boldsymbol{\mu}_i,\; \operatorname{Cov}(\boldsymbol{y}_{i1})=\boldsymbol{\Sigma},\; i=1,\ldots,k.
#' }
#' It is of interest to test the following GLHT problem:
#' \deqn{H_0: \boldsymbol{G M}=\boldsymbol{0}, \quad \text { vs. } \quad H_1: \boldsymbol{G M} \neq \boldsymbol{0},}
#' where
#' \eqn{\boldsymbol{M}=(\boldsymbol{\mu}_1,\ldots,\boldsymbol{\mu}_k)^\top} is a \eqn{k\times p} matrix collecting \eqn{k} mean vectors and \eqn{\boldsymbol{G}:q\times k} is a known full-rank coefficient matrix with \eqn{\operatorname{rank}(\boldsymbol{G})<k}.
#'
#' Zhu and Zhang (2022) proposed the following test statistic:
#' \deqn{
#' T_{ZZ}=\|\boldsymbol{C} \hat{\boldsymbol{\mu}}\|^2-q \operatorname{tr}(\hat{\boldsymbol{\Sigma}}),
#' }
#' where \eqn{\boldsymbol{C}=[(\boldsymbol{G D G}^\top)^{-1/2}\boldsymbol{G}]\otimes\boldsymbol{I}_p}, and \eqn{\hat{\boldsymbol{\mu}}=(\bar{\boldsymbol{y}}_1^\top,\ldots,\bar{\boldsymbol{y}}_k^\top)^\top}, with \eqn{\bar{\boldsymbol{y}}_{i},i=1,\ldots,k} being the sample mean vectors and \eqn{\hat{\boldsymbol{\Sigma}}} being the usual pooled sample covariance matrix of the \eqn{k} samples.
#'
#' They showed that under the null hypothesis, \eqn{T_{ZZ}} and a chi-squared-type mixture have the same normal or non-normal limiting distribution.

#' @references
#' \insertRef{zhu2022linear}{NRAHDLTP}
#'
#' @return A  (list) object of  \code{S3} class \code{htest}  containing the following elements:
#' \describe{
#' \item{p.value}{the \eqn{p}-value of the test proposed by  Zhu and Zhang (2022).}
#' \item{statistic}{the test statistic proposed by  Zhu and Zhang (2022).}
#' \item{beta0}{the parameter used in  Zhu and Zhang (2022)'s test.}
#' \item{beta1}{the parameter used in  Zhu and Zhang (2022)'s test.}
#' \item{df}{estimated approximate degrees of freedom of  Zhu and Zhang (2022)'s test.}
#' }


#' @examples
#' set.seed(1234)
#' k <- 3
#' p <- 50
#' n <- c(25, 30, 40)
#' rho <- 0.1
#' M <- matrix(rep(0, k * p), nrow = k, ncol = p)
#' y <- (-2 * sqrt(1 - rho) + sqrt(4 * (1 - rho) + 4 * p * rho)) / (2 * p)
#' x <- y + sqrt((1 - rho))
#' Gamma <- matrix(rep(y, p * p), nrow = p)
#' diag(Gamma) <- rep(x, p)
#' Y <- list()
#' for (g in 1:k) {
#'   Z <- matrix(rnorm(n[g] * p, mean = 0, sd = 1), p, n[g])
#'   Y[[g]] <- Gamma %*% Z + t(t(M[g, ])) %*% (rep(1, n[g]))
#' }
#' G <- cbind(diag(k - 1), rep(-1, k - 1))
#' glht_zz2022(Y, G, n, p)
#'
#' @concept nraglht
#' @export
glht_zz2022 <- function(Y, G, n, p) {
  stats <- glht_zz2022_cpp(Y, G, n, p)
  stat <- stats[1]
  beta0 <- stats[2]
  beta1 <- stats[3]
  df <- stats[4]
  statn <- (stat - beta0) / beta1
  pvalue <- pchisq(
    q = statn, df = df, ncp = 0, lower.tail = FALSE, log.p = FALSE
  )
  names(stat) <- "statistic"
  names(beta0) <- "beta0"
  names(beta1) <- "beta1"
  names(df) <- "df"
  res <- list(statistic = stat, p.value = pvalue, parameters = c(df, beta0, beta1))
  class(res) <- "htest"
  return(res)
}
