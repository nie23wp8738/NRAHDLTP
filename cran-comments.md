# Version 0.1.2

Re-submitting after adding references describing the methods in our package in the description field and Adding a REFERENCES.bib in 'inst' folder and modified the reference format in each '.R' file.

## Test environments

-   local OS X install, R 4.3.1
-   Ubuntu Linux 20.04.1 LTS (on R-hub), R 4.2
-   Fedora Linux (on R-hub) R-devel
-   Windows (devel and release)

## R CMD check results

I think this package was archived because a re-submission was submitted with the same release (0.1.2) as the release that I was trying to correct (0.1.1). This submission (0.1.2) attempts to correct this in line with CRAN policy (<https://cran.r-project.org/web/packages/policies.html>).

0 errors ✔ \| 0 warnings ✔ \| 5 notes ✖

The main notes are as following:

1 \* checking CRAN incoming feasibility ... [6s/19s] NOTE

```         
Maintainer: ‘Pengfei Wang <nie23.wp8738@e.ntu.edu.sg>’

New submission
```

2 \* checking installed package size ... NOTE

```         
  installed size is  6.4Mb
    sub-directories of 1Mb or more:
      data   4.8Mb
      libs   1.4Mb
```

3 \* checking HTML version of manual ... NOTE

```         
Skipping checking math rendering: package 'V8' unavailable
```

This also seems to be a recurring issue on Rhub [R-hub issue #560](https://github.com/r-hub/rhub/issues/548) and so can likely be ignored.

4 \* checking for non-standard things in the check directory ... NOTE

```         
Found the following files/directories:
  ''NULL''
```

As noted in [R-hub issue #560](https://github.com/r-hub/rhub/issues/560), this seems to be an Rhub issue and so can likely be ignored.

5 \* checking for detritus in the temp directory ... NOTE

```         
Found the following files/directories:
  'lastMiKTeXException'
```

As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this could be due to a bug/crash in MiKTeX and can likely be ignored.

-   This is a new release.

## Reverse dependencies

There are currently no downstream dependencies for this package.

------------------------------------------------------------------------

This version fixes and catches for failing tests,some spelling corrections and some formatting corrections.

Thanks! Pengfei Wang
