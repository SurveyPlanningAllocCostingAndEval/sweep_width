# Automating Sweep Widths for Archaeological Surveys

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.17801961.svg)](https://doi.org/10.5281/zenodo.17801961)

This repository hosts an R Notebook containing a simplified module for calculating effective sweep widths for archaeological surveys.

Based on an earlier Python 2 module developed by Yaron Milwid in 2016 (with further updates in 2017), this module represents an R-based adaptation written in a notebook-style format. 

The purpose of the module is to automate the estimation of effective sweep widths, which can subsequently be used for planning archaeological surveys and assessing their coverage.

## The Module

The module, "Sweep Width Calibration Module.Rmd", parses calibration survey data, calculates distance error estimates, determine positive and negative detections, and generates effective sweep width values. 

## Input Data

Two sample (synthetic) datasets are provided: master.csv and records.csv. The former represents the locations of seeded artifacts in a survey calibration field. The latter represents hypothetical detections by a surveyor. 

Users can supply their own data in .csv format, provided they retain the same variables. Use master.csv and records.csv as templates for structure calibration data. 

## Required Packages

This module was developed using R 4.3.1.

For the best experience using this module, the most recent version RStudio is strongly recommended. 

Additionally, the follow R packages are required to execute the provided code:

- readr
- dplyr
- ggplot2
- ggforce

Note: All required packages are installed (if necessary) and loaded at in the first cell of the notebook. 

## Running the Module

Open the .Rmd file in RStudio. Run each cell and follow any prompts (e.g., selecting the master.csv and records.csv files to load data). 
