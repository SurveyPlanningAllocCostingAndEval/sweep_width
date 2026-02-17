# Automating Sweep Widths for Archaeological Surveys

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.10798637.svg)](https://doi.org/10.5281/zenodo.10798637)

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

Note: The notebook verifies required packages are installed and loads them in the first code cell. If any are missing, it stops with a message showing what to install.

## Running the Module

Open the .Rmd file in RStudio and either run chunks interactively or knit to HTML.

- By default, the notebook looks for `master.csv` and `records.csv` in the same folder as the Rmd (i.e., the repository root).
- If your files are elsewhere, update the YAML parameters at the top of the Rmd (`params: master_csv:` and `params: records_csv:`) to point to your CSVs.

This approach avoids Windows-only file picker functions so the notebook can run on Windows, macOS, and Linux.
