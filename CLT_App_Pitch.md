---
title: "Simulating the CLT and LLN"
author: "Julian Simington"
date: "2025-01-25"
output:
  ioslides_presentation:
    keep_md: true
---





## Description

This interactive web app allows users to visualize the Central Limit Theorem (CLT) and the Law of Large Numbers (LLN). The app contains the following features:
  
1. Simulates random samples from a continuous uniform distribution (min = 0 and max = 10).
2. Allows users to input the number of samples and the sample size.
3. Plots a histogram of the **sample means of each sample**.
4. Plots the theoretical mean and observed mean of the samples.
5. Displays a table containing theoretical and observed statistics.

## CLT and LLN

Summaries of the CLT and LLN:
  
* CLT-- The sample mean of independent, identically distributed random variables becomes approximately normally distributed when the sample size becomes sufficiently large.
* LLN-- The observed sample mean approaches the theoretical population mean as the sample size increases.
\  
  
The next slide displays a static plot from the app. In the interactive app users are instructed to input two parameters.  
  
Note that the purple line is the theoretical mean of the random samples, while the red line is the observed mean.

## Simulating the CLT and LLN
  
Below is a example histogram from the app with 5 samples of size 2. Users can modify these parameters at <https://jks85.shinyapps.io/shiny-clt/>.
  

![](CLT_App_Pitch_files/figure-html/interactive_plot-1.png)<!-- -->

## Goals of the App
Changing the input parameters lets users visualize 

* how the *number of samples* affects the *shape* of the histogram (CLT). 
* how the *sample size* affects the *difference* between the observed and theoretical means (LLN). 

Parameters default to small values to incentivize users to pick larger numbers. This should allowing them to observe the CLT and LLN visually. 

Thank you for your consideration.



