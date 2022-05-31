# From_play_to_language
Data and scripts for Suarez-Rivera, C., Linn, E., &amp; Tamis-LeMonda, C. S. (2021). From Play to Language: Infants’ Actions on Objects Cascade to Word Learning. 
Welcome! This site contains data and scripts for the paper From Play to Language: Infants’ Actions on Objects Cascade to Word Learning. Please note that .R, .Mat (matlab) and .rb files were saved as .txt files.

The first folder in this repository contains: seven files, which were used to generate the final mother and infant naming variables used for analyses. Some of these files are csv files, some are Datavyu, Matlab, or R scripts. Together these files make up the “pipeline” to generate mother and infant naming of MCDI- subset objects variables. The ordering in the names represents the ordering of steps in the pipeline.

The second folder in this repository contains: sixteen files, which were used to generate the final infant object play variable used for analyses. Some of these files are csv files, some are Datavyu, Matlab, or R scripts. Together these files make up the “pipeline” to generate the variable of infant object interactions with MCDI-subset objects. The ordering in the names represents the ordering of steps in the pipeline. The pipeline for object interactions was much longer than the pipeline for infant and mother object naming.

The third folder in this repository contains: eight R files in .txt format that analyzed all the results in the paper. Files named with 01 through 06 are R scripts; the other two files are R functions. Please note that each R script lists the csv files that are imported to run the script and can be found on the eighth folder of the volume. 

The fourth folder in this repository contains: 31 csv files. All these files should be saved in the working directory so that the R scripts in the third folder run successfully. Each R script indicates the files that it imports. In general, files whose names begin with and without ‘forR_’ represent the data collected in the study (after it passed pipelines for infant/mother naming and infant object play) but in different ways (e.g., long vs wide format). The other files that do not begin with ‘forR’ were generated ‘byR’ and were then loaded again by the scripts. 

