* Encoding: UTF-8.
Descriptive statistics for participants characteristics


FREQUENCIES VARIABLES=sex
  /ORDER=ANALYSIS.


FREQUENCIES VARIABLES=age yearsofeducation waisinformation waispicturecompletion ghq
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


Five trials sum for TOL indicators:


COMPUTE time1tolextramoves=time1tolextramovestrial1+time1tolextramovestrial2+time1tolextramovestrial3+time1tolextramovestrial6+time1tolextramovestrial7.
EXECUTE.

VARIABLE LABELS time1tolextramoves 'Time 1, TOL, Extra Moves'.


COMPUTE time1tolinitialthinkingtime=time1tolinitialthinkingtimetrial1+time1tolinitialthinkingtimetrial2+time1tolinitialthinkingtimetrial3+time1tolinitialthinkingtimetrial6+time1tolinitialthinkingtimetrial7.
EXECUTE.

VARIABLE LABELS time1tolinitialthinkingtime 'Time 1, TOL, Initial Thinking Time'.


COMPUTE time1tolexecutiontime=time1tolexecutiontimetrial1+time1tolexecutiontimetrial2+time1tolexecutiontimetrial3+time1tolexecutiontimetrial6+time1tolexecutiontimetrial7.
EXECUTE.

VARIABLE LABELS time1tolexecutiontime 'Time 1, TOL, Execution Time'.


Descriptive statistics for TOL and GNG:


FREQUENCIES VARIABLES=time1tolextramoves time1tolinitialthinkingtime time1tolexecutiontime time1gngnogoerrors time1gngreactiontimeforgoresponses
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolextramoves time1tolinitialthinkingtime time1tolexecutiontime time1gngnogoerrors time1gngreactiontimeforgoresponses
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformacja zmiennych TOL i GNG:


COMPUTE time1tolextramovestransformed=((time1tolextramoves+1)**-0.5-1)/-0.5.

VARIABLE LABELS time1tolextramovestransformed 'Time 1, TOL, Extra Moves, Transformed'.


COMPUTE time1tolinitialthinkingtimetransformed=((time1tolinitialthinkingtime+1)**-1-1)/-1.

VARIABLE LABELS time1tolinitialthinkingtimetransformed 'Time 1, TOL, Initial Thinking Time, Transformed'.


COMPUTE time1tolexecutiontimetransformed=((time1tolexecutiontime+1)**-1-1)/-1.

VARIABLE LABELS time1tolexecutiontimetransformed 'Time 1, TOL, Execution Time, Transformed'.


COMPUTE time1gngnogoerrorstransformed=((time1gngnogoerrors+1)**-0.1-1)/-0.1.

VARIABLE LABELS time1gngnogoerrorstransformed 'Time 1, GNG, No Go Errors, Transformed'.


COMPUTE time1gngreactiontimeforgoresponsestransformed=((time1gngreactiontimeforgoresponses+1)**-1-1)/-1.

VARIABLE LABELS time1gngreactiontimeforgoresponsestransformed 'Time 1, GNG, Reaction Time for Go Responses, Transformed'.


FREQUENCIES VARIABLES=time1tolextramovestransformed time1tolinitialthinkingtimetransformed time1tolexecutiontimetransformed time1gngnogoerrorstransformed time1gngreactiontimeforgoresponsestransformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolextramovestransformed time1tolinitialthinkingtimetransformed time1tolexecutiontimetransformed time1gngnogoerrorstransformed time1gngreactiontimeforgoresponsestransformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Factor analysis for TOL and GNG:


FACTOR
  /VARIABLES time1tolextramovestransformed time1tolinitialthinkingtimetransformed time1tolexecutiontimetransformed time1gngnogoerrorstransformed time1gngreactiontimeforgoresponsestransformed
  /MISSING LISTWISE 
  /ANALYSIS time1tolextramovestransformed time1tolinitialthinkingtimetransformed time1tolexecutiontimetransformed time1gngnogoerrorstransformed time1gngreactiontimeforgoresponsestransformed
  /PRINT UNIVARIATE INITIAL CORRELATION SIG DET KMO EXTRACTION ROTATION
  /FORMAT BLANK(.40)
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.


Descriptive statistics for extra moves in each TOL trial:


FREQUENCIES VARIABLES=time1tolextramovestrial1 time1tolextramovestrial2 time1tolextramovestrial3 time1tolextramovestrial6 time1tolextramovestrial7
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolextramovestrial1 time1tolextramovestrial2 time1tolextramovestrial3 time1tolextramovestrial6 time1tolextramovestrial7
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformation for extra moves in each TOL trial:


COMPUTE time1tolextramovestrial1transformed=((time1tolextramovestrial1+1)**-1-1)/-1.

VARIABLE LABELS time1tolextramovestrial1transformed 'Time 1, TOL, Extra Moves, Trial 1, Transformed'.


COMPUTE time1tolextramovestrial2transformed=((time1tolextramovestrial2+1)**-1-1)/-1.

VARIABLE LABELS time1tolextramovestrial2transformed 'Time 1, TOL, Extra Moves, Trial 2, Transformed'.


COMPUTE time1tolextramovestrial3transformed=((time1tolextramovestrial3+1)**-1-1)/-1.

VARIABLE LABELS time1tolextramovestrial3transformed 'Time 1, TOL, Extra Moves, Trial 3, Transformed'.


COMPUTE time1tolextramovestrial6transformed=((time1tolextramovestrial6+1)**-1-1)/-1.

VARIABLE LABELS time1tolextramovestrial6transformed 'Time 1, TOL, Extra Moves, Trial 6, Transformed'.


COMPUTE time1tolextramovestrial7transformed=((time1tolextramovestrial7+1)**-1-1)/-1.

VARIABLE LABELS time1tolextramovestrial7transformed 'Time 1, TOL, Extra Moves, Trial 7, Transformed'.


FREQUENCIES VARIABLES=time1tolextramovestrial1transformed time1tolextramovestrial2transformed time1tolextramovestrial3transformed time1tolextramovestrial6transformed time1tolextramovestrial7transformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolextramovestrial1transformed time1tolextramovestrial2transformed time1tolextramovestrial3transformed time1tolextramovestrial6transformed time1tolextramovestrial7transformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Descriptive statistics for initial thinking time in each TOL trial:


FREQUENCIES VARIABLES=time1tolinitialthinkingtimetrial1 time1tolinitialthinkingtimetrial2 time1tolinitialthinkingtimetrial3 time1tolinitialthinkingtimetrial6 time1tolinitialthinkingtimetrial7
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolinitialthinkingtimetrial1 time1tolinitialthinkingtimetrial2 time1tolinitialthinkingtimetrial3 time1tolinitialthinkingtimetrial6 time1tolinitialthinkingtimetrial7
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformation for initial thinking time in each TOL trial:


COMPUTE time1tolinitialthinkingtimetrial1transformed=((time1tolinitialthinkingtimetrial1+1)**-0.5-1)/-0.5.

VARIABLE LABELS time1tolinitialthinkingtimetrial1transformed 'Time 1, TOL, Initial Thinking Time, Trial 1, Transformed'.


COMPUTE time1tolinitialthinkingtimetrial2transformed=((time1tolinitialthinkingtimetrial2+1)**-0.5-1)/-0.5.

VARIABLE LABELS time1tolinitialthinkingtimetrial2transformed 'Time 1, TOL, Initial Thinking Time, Trial 2, Transformed'.


COMPUTE time1tolinitialthinkingtimetrial3transformed=((time1tolinitialthinkingtimetrial3+1)**-0.5-1)/-0.5.

VARIABLE LABELS time1tolinitialthinkingtimetrial3transformed 'Time 1, TOL, Initial Thinking Time, Trial 3, Transformed'.


COMPUTE time1tolinitialthinkingtimetrial6transformed=((time1tolinitialthinkingtimetrial6+1)**-0.5-1)/-0.5.

VARIABLE LABELS time1tolinitialthinkingtimetrial6transformed 'Time 1, TOL, Initial Thinking Time, Trial 6, Transformed'.


COMPUTE time1tolinitialthinkingtimetrial7transformed=((time1tolinitialthinkingtimetrial7+1)**-0.5-1)/-0.5.

VARIABLE LABELS time1tolinitialthinkingtimetrial7transformed 'Time 1, TOL, Initial Thinking Time, Trial 7, Transformed'.


FREQUENCIES VARIABLES=time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Descriptive statistics for execution time in each TOL trial:


FREQUENCIES VARIABLES=time1tolexecutiontimetrial1 time1tolexecutiontimetrial2 time1tolexecutiontimetrial3 time1tolexecutiontimetrial6 time1tolexecutiontimetrial7
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolexecutiontimetrial1 time1tolexecutiontimetrial2 time1tolexecutiontimetrial3 time1tolexecutiontimetrial6 time1tolexecutiontimetrial7
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformation for execution time in each TOL trial:


COMPUTE time1tolexecutiontimetrial1transformed=((time1tolexecutiontimetrial1+1)**-0.1-1)/-0.1.

VARIABLE LABELS time1tolexecutiontimetrial1transformed 'Time 1, TOL, Execution Time, Trial 1, Transformed'.


COMPUTE time1tolexecutiontimetrial2transformed=((time1tolexecutiontimetrial2+1)**-0.1-1)/-0.1.

VARIABLE LABELS time1tolexecutiontimetrial2transformed 'Time 1, TOL, Execution Time, Trial 2, Transformed'.


COMPUTE time1tolexecutiontimetrial3transformed=((time1tolexecutiontimetrial3+1)**-0.1-1)/-0.1.

VARIABLE LABELS time1tolexecutiontimetrial3transformed 'Time 1, TOL, Execution Time, Trial 3, Transformed'.


COMPUTE time1tolexecutiontimetrial6transformed=((time1tolexecutiontimetrial6+1)**-0.1-1)/-0.1.

VARIABLE LABELS time1tolexecutiontimetrial6transformed 'Time 1, TOL, Execution Time, Trial 6, Transformed'.


COMPUTE time1tolexecutiontimetrial7transformed=((time1tolexecutiontimetrial7+1)**-0.1-1)/-0.1.

VARIABLE LABELS time1tolexecutiontimetrial7transformed 'Time 1, TOL, Execution Time, Trial 7, Transformed'.


FREQUENCIES VARIABLES=time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Factor analysis for indicators in each TOL trial:


FACTOR
  /VARIALBES time1tolextramovestrial1transformed time1tolextramovestrial2transformed time1tolextramovestrial3transformed time1tolextramovestrial6transformed time1tolextramovestrial7transformed 
  time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed 
  time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed
  /ANALYSIS time1tolextramovestrial1transformed time1tolextramovestrial2transformed time1tolextramovestrial3transformed time1tolextramovestrial6transformed time1tolextramovestrial7transformed 
  time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed 
  time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed
  /PRINT UNIVARIATE INITIAL CORRELATION SIG DET KMO EXTRACTION ROTATION
  /FORMAT BLANK(.40)
  /PLOT EIGEN
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.


Anova for extra moves in each TOL trial:


GLM time1tolextramovestrial1transformed time1tolextramovestrial2transformed time1tolextramovestrial3transformed time1tolextramovestrial6transformed time1tolextramovestrial7transformed
  /WSFACTOR=extramoves 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(extramoves) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /EMMEANS=TABLES(extramoves) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ OPOWER PARAMETER 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=extramoves.


Anova for initial thinking time in each TOL trial:


GLM time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed
  /WSFACTOR=initialthinkingtime 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(initialthinkingtime) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /EMMEANS=TABLES(initialthinkingtime) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ OPOWER PARAMETER
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=initialthinkingtime.


Anova for execution time in each TOL trial:


GLM time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed
  /WSFACTOR=executiontime 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(executiontime) TYPE=BAR ERRORBAR=NO MEANREFERENCE=NO
  /EMMEANS=TABLES(executiontime) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ OPOWER PARAMETER
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=executiontime.


Correlations for TOL and GNG indicators:


CORRELATIONS
  /VARIABLES=time1tolextramovestransformed time1tolinitialthinkingtimetransformed time1tolexecutiontimetransformed time1gngnogoerrorstransformed time1gngreactiontimeforgoresponsestransformed
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
