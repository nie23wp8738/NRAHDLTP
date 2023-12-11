
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NRAHDLTP

<!-- badges: start -->

[![](https://www.r-pkg.org/badges/version/NRAHDLTP)](https://cran.r-project.org/package=NRAHDLTP)
[![](https://www.r-pkg.org/badges/last-release/NRAHDLTP)](https://cran.r-project.org/package=NRAHDLTP)
[![](https://cranlogs.r-pkg.org/badges/grand-total/NRAHDLTP)](https://cran.r-project.org/package=NRAHDLTP)
[![R-CMD-check](https://github.com/nie23wp8738/NRAHDLTP/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nie23wp8738/NRAHDLTP/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The R package **NRAHDLTP** includes the latest methods based on
normal-reference approach to test the equality of the mean vectors of
high-dimensional samples with possibly different covariance matrices.
And `NRAHDLTP` is also used to demonstrate the implementation of these
tests, catering not only to the two-sample problem, but also to the
general linear hypothesis testing (GLHT) problem. This package provides
easy and user-friendly access to these tests. Both coded in C++ to allow
for reasonable execution time using
[Rcpp](https://github.com/RcppCore/Rcpp). And except for
[Rcpp](https://github.com/RcppCore/Rcpp), the package has no strict
dependencies in order to provide a stable self-contained toolbox that
invites re-use.

There are two real data sets in `NRAHDLTP`:
[COVID19](https://nie23wp8738.github.io/NRAHDLTP/reference/COVID19.html)
and
[corneal](https://nie23wp8738.github.io/NRAHDLTP/reference/corneal.html).

Seven normal-refernece Approach Based Tests for Two-sample Problem:
[ts_zgzc2020()](https://nie23wp8738.github.io/NRAHDLTP/reference/ts_zgzc2020.html),
[ts_zz2022()](https://nie23wp8738.github.io/NRAHDLTP/reference/ts_zz2022.html),
[ts_zzz2020()](https://nie23wp8738.github.io/NRAHDLTP/reference/ts_zzz2020.html),
[tsbf_zwz2023()](https://nie23wp8738.github.io/NRAHDLTP/reference/tsbf_zwz2023.html),
[tsbf_zz2022()](https://nie23wp8738.github.io/NRAHDLTP/reference/tsbf_zz2022.html),
[tsbf_zzgz2021()](https://nie23wp8738.github.io/NRAHDLTP/reference/tsbf_zzgz2021.html),
[tsbf_zzz2023()](https://nie23wp8738.github.io/NRAHDLTP/reference/tsbf_zzz2023.html).

Five normal-refernece Approach Based Tests for GLHT Problem in
`NRAHDLTP`:
[glht_zgz2017()](https://nie23wp8738.github.io/NRAHDLTP/reference/glht_zgz2017.html),
[glht_zz2022()](https://nie23wp8738.github.io/NRAHDLTP/reference/glht_zz2022.html),
[glht_zzz2022()](https://nie23wp8738.github.io/NRAHDLTP/reference/glht_zzz2022.html),
[glhtbf_zz2022()](https://nie23wp8738.github.io/NRAHDLTP/reference/glhtbf_zz2022.html),
[glhtbf_zzg2022()](https://nie23wp8738.github.io/NRAHDLTP/reference/glhtbf_zzg2022.html).

Four of the others’ Tests for Two-sample Problem in `NRAHDLTP`:
[ts_bs1996()](https://nie23wp8738.github.io/NRAHDLTP/reference/ts_bs1996.html),
[ts_sd2008()](https://nie23wp8738.github.io/NRAHDLTP/reference/ts_sd2008.html),
[tsbf_cq2010()](https://nie23wp8738.github.io/NRAHDLTP/reference/tsbf_cq2010.html),
[tsbf_skk2013()](https://nie23wp8738.github.io/NRAHDLTP/reference/tsbf_skk2013.html).

Five of the others’ test for GLHT problem in `NRAHDLTP`:
[glht_fhw2004()](https://nie23wp8738.github.io/NRAHDLTP/reference/glht_fhw2004.html),
[glht_sf2006()](https://nie23wp8738.github.io/NRAHDLTP/reference/glht_sf2006.html),
[glht_ys2012()](https://nie23wp8738.github.io/NRAHDLTP/reference/glht_ys2012.html),
[glhtbf_zgz2017()](https://nie23wp8738.github.io/NRAHDLTP/reference/glhtbf_zgz2017.html),
[ks_s2007()](https://nie23wp8738.github.io/NRAHDLTP/reference/ks_s2007.html).

## Installation

You can install and load the most recent approved version from
[CRAN](https://cran.r-project.org/web/packages/NRAHDLTP/index.html)
with:

``` r
# install the most recent approved version from CRAN
install.packages("NRAHDLTP")
# load the most recent approved version from CRAN
library(NRAHDLTP)
```

Or You can install and load the most recent development version of
`NRAHDLTP` from [GitHub](https://github.com/) with:

``` r
# Installing from GitHub requires you first install the devtools or remotes package
install.packages("devtools")
# Or
install.packages("remotes")

# install the most recent development version from GitHub
devtools::install_github("nie23wp8738/NRAHDLTP")
# Or
remotes::install_github("nie23wp8738/NRAHDLTP")
# load the most recent development version from GitHub
library(NRAHDLTP)
```

## Usage

### Load the package

``` r
library(NRAHDLTP)
```

### Example data

Package `NRAHDLTP` comes with two real data sets:

``` r
# A COVID19 data set from NCBI with ID GSE152641.
?COVID19

# A corneal data set acquired during a keratoconus study.
?corneal
```

### Example for two-sample problem

A simple example of how to run one of the normal-reference approach
based test `tsbf_zwz2023` using data set `COVID19`:

``` r
data("COVID19")
group1 <- as.matrix(COVID19[c(2:19, 82:87), ]) #healthy group1
group2 <- as.matrix(COVID19[-c(1:19, 82:87), ]) #patients group2
# The data matrix for tsbf_zwz2023 should be p by n, sometimes we should transpose the data matrix
tsbf_zwz2023(t(group1),t(group2))
#> 
#> 
#> 
#> data:  
#> statistic = 4.1877, df1 = 2.7324, df2 = 171.7596, p-value = 0.008673
```

### Example for GLHT problem

A simple example of how to run one of the normal-reference approach
based test `glhtbf_zzg2022` using data set `corneal`:

``` r
data("corneal")
p <- dim(corneal)[2]
k <- 4
Y <- list()
group1 <- as.matrix(corneal[1:43, ]) #normal
group2 <- as.matrix(corneal[44:57, ]) #unilateral suspect
group3 <- as.matrix(corneal[58:78, ]) #suspect
group4 <- as.matrix(corneal[79:150, ]) #clinical leratoconus
Y[[1]] <- t(group1)
Y[[2]] <- t(group2)
Y[[3]] <- t(group3)
Y[[4]] <- t(group4)
dim(Y[[1]])
#> [1] 2000   43
dim(Y[[2]])
#> [1] 2000   14
dim(Y[[3]])
#> [1] 2000   21
dim(Y[[4]])
#> [1] 2000   72
n <- c(43,14,21,72)
G <- cbind(diag(k-1),rep(-1,k-1))
glhtbf_zzg2022(Y,G,n,p)
#> 
#> 
#> 
#> data:  
#> statistic = 159.73, df = 6.1652, beta = 6.1464, p-value = 0.0002577
```

## Code of Conduct

Please note that the NRAHDLTP project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
