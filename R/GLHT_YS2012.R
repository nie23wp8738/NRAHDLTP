#' @title Test proposed by Yamada and Srivastava (2012)
#' @description
#' Yamada and Srivastava (2012)'test for general linear hypothesis testing (GLHT) problem for high-dimensional data with assuming that underlying covariance matrices are the same.

#' @usage glht_ys2012(Y,X,C)
#' @param Y An \eqn{n\times p} response matrix obtained by independently observing a \eqn{p}-dimensional response variable for \eqn{n} subjects.
#' @param X A known \eqn{n\times k} full-rank design matrix with \eqn{\operatorname{rank}(\boldsymbol{G})=k<n}.
#' @param C A known matrix of size \eqn{q\times k} with \eqn{\operatorname{rank}(\boldsymbol{C})=q<k}.

#'
#' @details
#' A high-dimensional linear regression model can be expressed as
#' \deqn{\boldsymbol{Y}=\boldsymbol{X\Theta}+\boldsymbol{\epsilon},}
#' where \eqn{\Theta} is a \eqn{k\times p} unknown parameter matrix and \eqn{\boldsymbol{\epsilon}} is an \eqn{n\times p} error matrix.
#'
#' It is of interest to test the following GLHT problem
#' \deqn{H_0: \boldsymbol{C\Theta}=\boldsymbol{0}, \quad \text { vs. } H_1: \boldsymbol{C\Theta} \neq \boldsymbol{0}.}
#'
#' Yamada and Srivastava (2012) proposed the following test statistic:
#' \deqn{T_{YS}=\frac{(n-k)\operatorname{tr}(\boldsymbol{S}_h\boldsymbol{D}_{\boldsymbol{S}_e}^{-1})-(n-k)pq/(n-k-2)}{\sqrt{2q[\operatorname{tr}(\boldsymbol{R}^2)-p^2/(n-k)]c_{p,n}}},}
#' where \eqn{\boldsymbol{S}_h} and \eqn{\boldsymbol{S}_e} are the variation matrices due to the hypothesis and error, respectively, and \eqn{\boldsymbol{D}_{\boldsymbol{S}_e}} and \eqn{\boldsymbol{R}} are diagonal matrix with the diagonal elements of \eqn{\boldsymbol{S}_e} and the sample correlation matrix, respectively. \eqn{c_{p, n}} is the adjustment coefficient proposed by Yamada and Srivastava (2012).
#' They showed that under the null hypothesis, \eqn{T_{YS}} is asymptotically normally distributed.


#'
#' @references
#' \insertRef{yamada2012test}{NRAHDLTP}
#'
#' @return A  (list) object of  \code{S3} class \code{htest}  containing the following elements:
#' \describe{
#' \item{statistic}{the test statistic proposed by Yamada and Srivastava (2012).}
#' \item{p.value}{the \eqn{p}-value of the test proposed by Yamada and Srivastava (2012).}
#' }

#' @examples

#' set.seed(1234)
#' k <- 3
#' q <- k-1
#' p <- 50
#' n <- c(25,30,40)
#' rho <- 0.01
#' Theta <- matrix(rep(0,k*p),nrow=k)
#' X <- matrix(c(rep(1,n[1]),rep(0,sum(n)),rep(1,n[2]),rep(0,sum(n)),rep(1,n[3])),ncol=k,nrow=sum(n))
#' y <- (-2*sqrt(1-rho)+sqrt(4*(1-rho)+4*p*rho))/(2*p)
#' x <- y+sqrt((1-rho))
#' Gamma <- matrix(rep(y,p*p),nrow=p)
#' diag(Gamma) <- rep(x,p)
#' U <- matrix(ncol = sum(n),nrow=p)
#' for(i in 1:sum(n)){
#' U[,i] <- rnorm(p,0,1)
#' }
#' Y <- X%*%Theta+t(U)%*%Gamma
#' C <- cbind(diag(q),-rep(1,q))
#' glht_ys2012(Y,X,C)
#'
#' @concept glht
#' @export
glht_ys2012 <- function(Y, X, C) {
  stats <- glht_ys2012_cpp(Y, X, C)
  stat <- stats[1]
  cpn <- stats[2]
  pvalue <- pnorm(stat, 0, 1, lower.tail = FALSE, log.p = FALSE)
  names(stat) <- "statistic"
  names(cpn) <- "cpn"
  res <- list(statistic = stat, p.value = pvalue, parameters = cpn)
  class(res) <- "htest"
  return(res)
}
