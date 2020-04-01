# Data Science for Economics
This is the github repository for the second part of the Seminar Data Science for Economics. It contains folders with lecture slides and the codes for tutorials.

Copy this repository to your laptop and pull from the master branch before each class to get the most recent version of lecture slides and new tutorials. 

The tutorials are based on R. If you like, you still can use Python (or any other programming language), but then you will have to rely on self-study.


## Online lectures and tutorials

### How to use the online lectures and tutorials:

1) For each topic, first, listen to video lectures which summarise the material and cover only a simplified version of lecture slides.
2) For the full treatment of the topic, read through the full version of the lecture slides. 
3) Finally, go through the interactive tutorials which allow you to learn-by-doing. Notice that the correct answers for coding exercises are provided as hints. 
4) Still have questions? Open a discussion on Canvas.


### Decision trees

1) [Video Lecture Decision Trees](https://youtu.be/rrSW03Yw_nk) (HINT: put speed to 1.25 or even 1.5)
2) [Lecture slides Decision Trees](https://github.com/madina-k/dse_mk/blob/master/lectures/DSE_MK_decisiontrees.pdf)
3) [Interactive Tutorial Classification Trees Compas version 2](https://github.com/madina-k/dse_mk/tree/master/tutorials/tutorial_dt). See the  instructions below and please run the following code before compiling the tutorial:
```r
req_packages <- c("learnr", "fairness", "tree", "tidyverse")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(req_packages, character.only = TRUE)
```


### Bagging, Random Forest, Boosting

1) [Video Lecture Bagging, RF, Boosting](https://youtu.be/STKJNh6us_I) (HINT: put speed to 1.25 or even 1.5)
2) [Lecture slides Bagging, RF, Boosting ](https://github.com/madina-k/dse_mk/blob/master/lectures/DSE_MK_boostingRFbagging.pdf)
3) [Interactive Tutorial Bagging, RF, Boosting version 2](https://github.com/madina-k/dse_mk/tree/master/tutorials/tutorial_bagboost). See the  instructions below and please run the following code before compiling the tutorial:
```r
req_packages <- c("learnr", "fairness", "tree", "randomForest", "gbm", "tidyverse")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(req_packages, character.only = TRUE)
```

### Why we cannot use Machine Learning for inference (recap)

1) [Video Lecture Why ML Fails](https://youtu.be/KwWGhneQUmk) (HINT: put speed to 1.25 or even 1.5)
2) [Lecture slides Why ML Fails](https://github.com/madina-k/dse_mk/blob/master/lectures/DSE_MK_slides_whyMLfails_inference.pdf)

### Double Machine learning

1) Attend live lecture using Zoom on Thursday, March 26, at 10:45. [Download Zoom](https://zoom.us/download) in advance for easy experience
2) [Lecture slides Double ML](https://github.com/madina-k/dse_mk/blob/master/lectures/DSE_MK_doubleML.pdf)
3) [NON-interactive Tutorial DML](https://github.com/madina-k/dse_mk/blob/master/tutorials/tutorial3_notebook.Rmd)
4) [NON-interactive Tutorial DML with ANSWERS](https://github.com/madina-k/dse_mk/blob/master/tutorials/tutorial3_notebook_withanswers.Rmd)


### Causal Trees

1) Attend live lecture using Zoom on Thursday, March 26, at 10:45. [Download Zoom](https://zoom.us/download) in advance for easy experience
2) [Lecture slides Causal Trees](https://github.com/madina-k/dse_mk/blob/master/lectures/DSE_MK_causal_trees.pdf)
3) [Interactive Tutorial Causal Tree](https://github.com/madina-k/dse_mk/tree/master/tutorials/tutorial_ct). Please run the following code before compiling the tutorial:
```r
req_packages <- c("learnr", "fairness", "DiagrammeR", "grf", "tidyverse")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(req_packages, character.only = TRUE)
```

### Working with maps

1) [Interactive Tutorial Maps](https://github.com/madina-k/dse_mk/tree/master/tutorials/tutorial_maps) Please run the following code before compiling the tutorial:
```r
req_packages <- c("learnr", "osmdata", "sf", "ggmap", "naniar", "broom", "viridis", "randomForest", "tidyverse") 
if (!require("pacman")) install.packages("pacman")
pacman::p_load(req_packages, character.only = TRUE)
```


## HOW TO run an interactive tutorial [updated March 19, 2020]

Do steps 1 to 4. If you fail to run the tutorial successfully, please, post your reply on [canvas discussion](https://tilburguniversity.instructure.com/courses/3527/discussion_topics/40946)

Step 1. Pull the updated version of this git repository

Step 2. Open R and install the required packages as indicated for each tutorial. e.g.:
```r
req_packages <- c("learnr", "fairness", "tree", "tidyverse")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(req_packages, character.only = TRUE)
```
Step 3. Open the tutorial file in the `tutorials/tutorial_xyz/tutorial_xyz.Rmd` and click the green button "Run Document" at the top
![Filedirectory](https://github.com/madina-k/dse_mk/blob/master/pics/step1.png)

![Rundoc](https://github.com/madina-k/dse_mk/blob/master/pics/step2.png)

Step 4. Work with the compiled tutorial. You get the correct answers for each quiz after you submit an answer first. You can get the **correct answer** to any coding question, by clicking **"hint"** button at the top panel of the coding chunk.

![Checktutorial](https://github.com/madina-k/dse_mk/blob/master/pics/step3.png)

## Preparing R for the hard work
You have to [install R](https://www.r-project.org/) and [R Studio Desktop](https://rstudio.com/products/rstudio/download/) on your laptop.

If you already have those installed, perhaps you still want to [update your R and R Studio](https://uvastatlab.github.io/phdplus/installR.html) to the latest available version.

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
  cat("\n\n\n\nThere is an installation problem. Trying to install the failed packages again:\n")
  not_loaded <- req_packages[loaded_packages == FALSE]
  install.packages(not_loaded)
}

```
If the code returns that there was an installation problem, try to run the code above again.

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
