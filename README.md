# dse_mk
This is the github repository for the second part of the Seminar Data Science for Economics. It contains folders with lecture slides and the codes for tutorials.

Copy this repository to your laptop and pull from the master branch before each class to get the most recent version of lecture slides and new tutorials. 

The tutorials are based on R. If you like, you still can use Python (or any other programming language), but then you will have to rely on self-exploration.

## Preparing R for the hard work
You have to [install R](https://www.r-project.org/) and [R Studio Desktop](https://rstudio.com/products/rstudio/download/) on your laptop.

If you already have those installed, perhaps you still want to update your R and R Studio to the latest available version.

After the installation, open R studio, copy and paste the following code in the console, push enter:
```r
req_packages <- c(
  "tidyverse", # The collection of packages used for data analysis
  "glmnet",  # Regression regularization
  "tree", # Decision trees
  "randomForest", 
  "gbm", # Boosted regression models
  "broom", # Tidies up regression output
  "furrr", # Parallel computing for purrr functions 
  "grf" # Causal forests
)

if (!require("pacman")) install.packages("pacman")
pacman::p_load(req_packages, character.only = TRUE)

# Check whether installation worked. See the output.
loaded_packages <- pacman::p_loaded(req_packages, character.only = TRUE)
if (loaded_packages %>% sum() == length(req_packages)) {
  cat("\n\n\n\nEvery package has been installed correctly\n")
} else {
  cat("\n\n\n\nThere is an installation problem. The following packages have not installed properly:\n")
  not_loaded <- req_packages[loaded_packages == FALSE]
  install.packages(not_loaded)
}

```
If the code returns that there was an installation problem. Try to run the code above again.

## Useful resources


Links for the theoretical material:
* [An Introduction to Statistical Learning with Applications in R (ISLR)](http://faculty.marshall.usc.edu/gareth-james/ISL/ISLR%20Seventh%20Printing.pdf)
* [High-dimensional methods and inference on structural and treatment effect (Double Reg)](https://www.aeaweb.org/articles?id=10.1257/jep.28.2.29)
* [Double/debiased machine learning for treatment and structural parameters (Double ML](https://onlinelibrary.wiley.com/doi/full/10.1111/ectj.12097)
* [Recursive partitioning for heterogeneous causal effects (Causal Forest)](https://www.pnas.org/content/113/27/7353.short)

Links for R material:
* [R for Data Science](https://r4ds.had.co.nz/index.html)
* [Cookbook R](http://www.cookbook-r.com/)
* Visualization with [ggplot2](https://ggplot2.tidyverse.org/)

The list of [keyboard shortcuts for RStudio](https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts)

Among them the most useful but not that well known are:

- `cmd+shift+m` (or `ctrl+shift+m` for Windows) to type the pipe operator `%>%`.
- `alt+up` or `alt+down` to move a line up or down.
- `ctrl+alt+down` for multiline selection.
- `cmd+shift+d` (or `ctrl+shift+d`) duplicates the line or selection


Links for Python code:
* [ISLR-python](https://github.com/JWarmenhoven/ISLR-python)
