---
title: "OpenIntro Lab - Chapter 1"
output:
  html_document:
    df_print: paged
    keep_md: true
---

# OpenIntro Lab - Introduction to data #

This notebook is the first chapter of my personal study book. The general aim is to learn how summarize and describe the raw information - the data. It is part of the first set of **OpenIntro** labs, that are part of the study of the book: **Introductory Statistics with Randomization and Simulation**. Lab avaliable from: [Introducton to Data](https://htmlpreview.github.io/?https://github.com/andrewpbray/oiLabs-base-R/blob/master/intro_to_data/intro_to_data.html)

We will use a data set collected by the **Centers for Disease Control and Prevention** (CDC), called **The Behavioral Risk Factor Surveillance System** (BRFSS). Avaliable from: [BRFSS](http://www.cdc.gov/brfss).

This R Notebooke is organized in the following way: there will always be a question about the dataset, followed by code chunks (R script) and its outputs. For some answers the output will be considered sufficient. For others a short answer will be written.

We will focus on a random sample of 20,000 people from the **BRFSS** survey conducted in 2000. While there are over 200 variables in this data set, we will work with a small subset. 


```r
source("http://www.openintro.org/stat/data/cdc.R")
```

### **Exercise 1** ### 
How many cases are there in this data set? How many variables? For each variable, identify its data type (e.g. categorical, discrete).


```r
names(cdc)
```

```
## [1] "genhlth"  "exerany"  "hlthplan" "smoke100" "height"   "weight"   "wtdesire"
## [8] "age"      "gender"
```


```r
head(cdc)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["genhlth"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["exerany"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["hlthplan"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["smoke100"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["height"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["weight"],"name":[6],"type":["int"],"align":["right"]},{"label":["wtdesire"],"name":[7],"type":["int"],"align":["right"]},{"label":["age"],"name":[8],"type":["int"],"align":["right"]},{"label":["gender"],"name":[9],"type":["fctr"],"align":["left"]}],"data":[{"1":"good","2":"0","3":"1","4":"0","5":"70","6":"175","7":"175","8":"77","9":"m","_rn_":"1"},{"1":"good","2":"0","3":"1","4":"1","5":"64","6":"125","7":"115","8":"33","9":"f","_rn_":"2"},{"1":"good","2":"1","3":"1","4":"1","5":"60","6":"105","7":"105","8":"49","9":"f","_rn_":"3"},{"1":"good","2":"1","3":"1","4":"0","5":"66","6":"132","7":"124","8":"42","9":"f","_rn_":"4"},{"1":"very good","2":"0","3":"1","4":"0","5":"61","6":"150","7":"130","8":"55","9":"f","_rn_":"5"},{"1":"very good","2":"1","3":"1","4":"0","5":"64","6":"114","7":"114","8":"55","9":"f","_rn_":"6"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


```r
tail(cdc)
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":[""],"name":["_rn_"],"type":[""],"align":["left"]},{"label":["genhlth"],"name":[1],"type":["fctr"],"align":["left"]},{"label":["exerany"],"name":[2],"type":["dbl"],"align":["right"]},{"label":["hlthplan"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["smoke100"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["height"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["weight"],"name":[6],"type":["int"],"align":["right"]},{"label":["wtdesire"],"name":[7],"type":["int"],"align":["right"]},{"label":["age"],"name":[8],"type":["int"],"align":["right"]},{"label":["gender"],"name":[9],"type":["fctr"],"align":["left"]}],"data":[{"1":"good","2":"0","3":"1","4":"1","5":"69","6":"224","7":"224","8":"73","9":"m","_rn_":"19995"},{"1":"good","2":"1","3":"1","4":"0","5":"66","6":"215","7":"140","8":"23","9":"f","_rn_":"19996"},{"1":"excellent","2":"0","3":"1","4":"0","5":"73","6":"200","7":"185","8":"35","9":"m","_rn_":"19997"},{"1":"poor","2":"0","3":"1","4":"0","5":"65","6":"216","7":"150","8":"57","9":"f","_rn_":"19998"},{"1":"good","2":"1","3":"1","4":"0","5":"67","6":"165","7":"165","8":"81","9":"f","_rn_":"19999"},{"1":"good","2":"1","3":"1","4":"1","5":"69","6":"170","7":"165","8":"83","9":"m","_rn_":"20000"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


```r
str(cdc)
```

```
## 'data.frame':	20000 obs. of  9 variables:
##  $ genhlth : Factor w/ 5 levels "excellent","very good",..: 3 3 3 3 2 2 2 2 3 3 ...
##  $ exerany : num  0 0 1 1 0 1 1 0 0 1 ...
##  $ hlthplan: num  1 1 1 1 1 1 1 1 1 1 ...
##  $ smoke100: num  0 1 1 0 0 0 0 0 1 0 ...
##  $ height  : num  70 64 60 66 61 64 71 67 65 70 ...
##  $ weight  : int  175 125 105 132 150 114 194 170 150 180 ...
##  $ wtdesire: int  175 115 105 124 130 114 185 160 130 170 ...
##  $ age     : int  77 33 49 42 55 55 31 45 27 44 ...
##  $ gender  : Factor w/ 2 levels "m","f": 1 2 2 2 2 2 1 1 2 1 ...
```

**Answer**: 
There are 20000 cases and 9 variables in this dataset. We can see the types of each variable in the output above.


### **Exercise 2** ### 
Create a numerical summary for `height` and `age`, and compute the interquartile range for each. Compute the relative frequency distribution for `gender` and `exerany`. How many males are in the sample? What proportion of the sample reports being in excellent health?


```r
summary(cdc$height)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   48.00   64.00   67.00   67.18   70.00   93.00
```


```r
# interquartile range = 3rd Qu - 1st Qu
IQR_height <- 70-64
```


```r
IQR_height
```

```
## [1] 6
```


```r
summary(cdc$age)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   18.00   31.00   43.00   45.07   57.00   99.00
```


```r
# interquartile range = 3rd Qu - 1st Qu
IQR_age <- (57-31)
```


```r
IQR_age
```

```
## [1] 26
```


```r
table(cdc$gender)
```

```
## 
##     m     f 
##  9569 10431
```


```r
table(cdc$gender)/20000
```

```
## 
##       m       f 
## 0.47845 0.52155
```


```r
table(cdc$exerany)/20000
```

```
## 
##      0      1 
## 0.2543 0.7457
```

**Answer**: There are 9569 males. The frequency distribution for `gender` and `exerany`, can be seen int the output above.


```r
summary(cdc$genhlth) / 20000
```

```
## excellent very good      good      fair      poor 
##   0.23285   0.34860   0.28375   0.10095   0.03385
```

**Answer**: the proportion of the sample reports being in excellent health = 0.23285 or 23%.

### **Exercise 3** ### 
What does the mosaic plot reveal about smoking habits and gender?


```r
gender_smoke <- table(cdc$gender,cdc$smoke100)
```


```r
gender_smoke
```

```
##    
##        0    1
##   m 4547 5022
##   f 6012 4419
```


```r
mosaicplot(gender_smoke) #  column labels: 0 and 1. 1 indicates a respondent has smoked at least 100 cigarettes.
```

![](OpenIntro_Lab_Chapter_1_files/figure-html/unnamed-chunk-18-1.png)<!-- -->

**Answer**: It seems that men smoke more often than women.
