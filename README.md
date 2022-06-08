# Automating Sweep Widths for Archaeological Surveys

This repository hosts a script used to estimate sweep widths for archaeological surveys.

The script was written by Yaron Milwid in 2016, with further updates in 2017. Steven Edwards updated the script to Python 3 in 2022.

The purpose of the script is to automate the estimation of sweep widths, which can subsequently be used for planning archaeological surveys and assessing their results.

# The Script

The script, SweepWidthParser.py, parses sweep width data and returns a probability of detection curve and sweep width values. Outputs include plots of the data and corresponding probability of detection curve. 

## Input Data

When running the script, users are asked to select a parent directory. Within the parent directory should be a sub-directory containing two files: 'master.csv' and 'Calibration Records.xlsx'.

'master.csv' contains the actual locations of synthetic archaeological artifacts used in sweep width calibration experiments. The 'master.csv' file should contain the following columns/variables: Artifact, Segment, Long Dist, L or R, Distance, Field, Overall Type, Number of Segments.

'Calibration Records.xlsx' contains the suspected locations of artifacts within the calibration experiments, as observed by surveyors during calibration runs. As a surveyor walks a transect during an experiement, they will indicate whether they have spotted an artifact, giving an estimated location and description of the artifact type. There can be multiple calibration record files included in the sub-directory. This file/these files should contain the following columns/variables: Artifact #, Direction #, Distance #, TDist #, Transect Length. Other columns can be included, but they will be ignored by the script. The order of columns for both files does not matter.

# Required Packages

The following packages are required to run SweepWidthParser.py:
  re
  tkinter
  os
  numpy
  scipy
  matplotlib
  openpyxl
  weakref

Many of these packages come pre-installed with Anaconda. If required, in the Anaconda Prompt, type 'conda install PACKAGE_NAME' to install a given package. 

# Running the Script

From the Anaconda Prompt (or Command Prompt/Terminal), deactivate the current environment (type conda deactivate). Now, activate the environment where you installed the above-listed packages (type conda activate ENVIRONMENT_NAME). Set the directory to the parent directory that contains the sub-directory with your master.csv and Calibration Records.xlsx files (type cd C:\Users\USER_NAME\PARENT_DIR\). Start a Python terminal (type python). Run the script (type SweepWidthParser.py after the >>>).

Alternatively, save the script to your parent directory and run it from a Jupyter Notebook (highly recommended). 
