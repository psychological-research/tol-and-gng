* Encoding: UTF-8.
Descriptive statistics for participants characteristics:


FREQUENCIES VARIABLES=age yearsofeducation waisinformation waispicturecompletion ghq
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


NPAR TESTS
  /CHISQUARE=sex
  /EXPECTED=EQUAL
  /STATISTICS DESCRIPTIVES
  /MISSING ANALYSIS.


Five trials sum for TOL indicators:


COMPUTE time1tolextramoves=time1tolextramovestrial1+time1tolextramovestrial2+time1tolextramovestrial3+time1tolextramovestrial6+time1tolextramovestrial7.
EXECUTE.

VARIABLE LABELS time1tolextramoves 'Time 1, TOL, Extra Moves'.

COMPUTE time2tolextramoves=time2tolextramovestrial1+time2tolextramovestrial2+time2tolextramovestrial3+time2tolextramovestrial6+time2tolextramovestrial7.
EXECUTE.

VARIABLE LABELS time2tolextramoves 'Time 2, TOL, Extra Moves'.


COMPUTE time1tolinitialthinkingtime=time1tolinitialthinkingtimetrial1+time1tolinitialthinkingtimetrial2+time1tolinitialthinkingtimetrial3+time1tolinitialthinkingtimetrial6+time1tolinitialthinkingtimetrial7.
EXECUTE.

VARIABLE LABELS time1tolinitialthinkingtime 'Time 1, TOL, Initial Thinking Time'.

COMPUTE time2tolinitialthinkingtime=time2tolinitialthinkingtimetrial1+time2tolinitialthinkingtimetrial2+time2tolinitialthinkingtimetrial3+time2tolinitialthinkingtimetrial6+time2tolinitialthinkingtimetrial7.
EXECUTE.

VARIABLE LABELS time2tolinitialthinkingtime 'Time 2, TOL, Initial Thinking Time'.


COMPUTE time1tolexecutiontime=time1tolexecutiontimetrial1+time1tolexecutiontimetrial2+time1tolexecutiontimetrial3+time1tolexecutiontimetrial6+time1tolexecutiontimetrial7.
EXECUTE.

VARIABLE LABELS time1tolexecutiontime 'Time 1, TOL, Execution Time'.

COMPUTE time2tolexecutiontime=time2tolexecutiontimetrial1+time2tolexecutiontimetrial2+time2tolexecutiontimetrial3+time2tolexecutiontimetrial6+time2tolexecutiontimetrial7.
EXECUTE.

VARIABLE LABELS time2tolexecutiontime 'Time 2, TOL, Execution Time'.


COMPUTE time1tolfulltime=time1tolfulltimetrial1+time1tolfulltimetrial2+time1tolfulltimetrial3+time1tolfulltimetrial6+time1tolfulltimetrial7.
EXECUTE.

VARIABLE LABELS time1tolfulltime 'Time 1, TOL, Full Time'.

COMPUTE time2tolfulltime=time2tolfulltimetrial1+time2tolfulltimetrial2+time2tolfulltimetrial3+time2tolfulltimetrial6+time2tolfulltimetrial7.
EXECUTE.

VARIABLE LABELS time2tolfulltime 'Time 2, TOL, Full Time'.


Descriptive statistics for TOL and GNG:


FREQUENCIES VARIABLES=time1tolextramoves time1tolinitialthinkingtime time1tolexecutiontime time1tolfulltime time2tolextramoves time2tolinitialthinkingtime time2tolexecutiontime time2tolfulltime 
  time1gngnogoerrors time1gngreactiontimeforgoresponses time2gngnogoerrors time2gngreactiontimeforgoresponses
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolextramoves time1tolinitialthinkingtime time1tolexecutiontime time1tolfulltime time2tolextramoves time2tolinitialthinkingtime time2tolexecutiontime time2tolfulltime 
  time1gngnogoerrors time1gngreactiontimeforgoresponses time2gngnogoerrors time2gngreactiontimeforgoresponses
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformation for TOL and GNG:


COMPUTE time1tolextramovestransformed=((time1tolextramoves+1)**-0.15-1)/-0.15.

VARIABLE LABELS time1tolextramovestransformed 'Time 1, TOL, Extra Moves, Transformed'.

COMPUTE time2tolextramovestransformed=((time2tolextramoves+1)**-0.15-1)/-0.15.

VARIABLE LABELS time2tolextramovestransformed 'Time 2, TOL, Extra Moves, Transformed'.


COMPUTE time1gngnogoerrorstransformed=((time1gngnogoerrors+1)**-0.11-1)/-0.11.

VARIABLE LABELS time1gngnogoerrorstransformed 'Time 1, GNG, No Go Errors, Transformed'.

COMPUTE time2gngnogoerrorstransformed=((time2gngnogoerrors+1)**-0.11-1)/-0.11.

VARIABLE LABELS time2gngnogoerrorstransformed 'Time 2, GNG, No Go Errors, Transformed'.


FREQUENCIES VARIABLES=time1tolextramovestransformed time2tolextramovestransformed time1gngnogoerrorstransformed time2gngnogoerrorstransformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolextramovestransformed time2tolextramovestransformed time1gngnogoerrorstransformed time2gngnogoerrorstransformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Reliability for TOL:

 
BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolextramovestransformed time2tolextramovestransformed
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
T-TEST PAIRS=time1tolextramovestransformed WITH time2tolextramovestransformed (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolextramovestransformed time2tolextramovestransformed 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
CORRELATIONS
  /VARIABLES=time1tolextramovestransformed time2tolextramovestransformed
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=time1tolextramovestransformed time2tolextramovestransformed
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.


BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolinitialthinkingtime time2tolinitialthinkingtime
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
T-TEST PAIRS=time1tolinitialthinkingtime WITH time2tolinitialthinkingtime (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolinitialthinkingtime time2tolinitialthinkingtime 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
CORRELATIONS
  /VARIABLES=time1tolinitialthinkingtime time2tolinitialthinkingtime
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=time1tolinitialthinkingtime time2tolinitialthinkingtime
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.


BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolexecutiontime time2tolexecutiontime
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
T-TEST PAIRS=time1tolexecutiontime WITH time2tolexecutiontime (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolexecutiontime time2tolexecutiontime 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
CORRELATIONS
  /VARIABLES=time1tolexecutiontime time2tolexecutiontime
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=time1tolexecutiontime time2tolexecutiontime
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.


BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolfulltime time2tolfulltime
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
T-TEST PAIRS=time1tolfulltime WITH time2tolfulltime (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1tolfulltime time2tolfulltime 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
CORRELATIONS
  /VARIABLES=time1tolfulltime time2tolfulltime
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=time1tolfulltime time2tolfulltime
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.


Reliability for GNG:


BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1gngnogoerrorstransformed time2gngnogoerrorstransformed
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
T-TEST PAIRS=time1gngnogoerrorstransformed WITH time2gngnogoerrorstransformed (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1gngnogoerrorstransformed time2gngnogoerrorstransformed 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
CORRELATIONS
  /VARIABLES=time1gngnogoerrorstransformed time2gngnogoerrorstransformed
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=time1gngnogoerrorstransformed time2gngnogoerrorstransformed
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.


BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1gngreactiontimeforgoresponses time2gngreactiontimeforgoresponses
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
T-TEST PAIRS=time1gngreactiontimeforgoresponses WITH time2gngreactiontimeforgoresponses (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES INPUT=time1gngreactiontimeforgoresponses time2gngreactiontimeforgoresponses 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=1000
  /MISSING USERMISSING=EXCLUDE.
CORRELATIONS
  /VARIABLES=time1gngreactiontimeforgoresponses time2gngreactiontimeforgoresponses
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

RELIABILITY
  /VARIABLES=time1gngreactiontimeforgoresponses time2gngreactiontimeforgoresponses
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA
  /ICC=MODEL(MIXED) TYPE(CONSISTENCY) CIN=95 TESTVAL=0.


RCI calucation (see: "Calculator for standard error of the difference by Iverson" in Excel):


COMPUTE tolextramovesrci=((time2tolextramovestransformed-time1tolextramovestransformed)+0.18)/1.33.
EXECUTE.

VARIABLE LABELS tolextramovesrci 'TOL, Extra Moves, RCI'.


COMPUTE tolinitialthinkingtimerci=((time2tolinitialthinkingtime-time1tolinitialthinkingtime)+11.51)/7.56.
EXECUTE.

VARIABLE LABELS tolinitialthinkingtimerci 'TOL, Initial Thinking Time, RCI'.


COMPUTE tolexecutiontimerci=((time2tolexecutiontime-time1tolexecutiontime)-0.05)/14.16.
EXECUTE.

VARIABLE LABELS tolexecutiontimerci 'TOL, Execution Time, RCI'.


COMPUTE tolfulltimerci=((time2tolfulltime-time1tolfulltime)+11.46)/18.42.
EXECUTE.

VARIABLE LABELS tolfulltimerci 'TOL, Full Time, RCI'.


COMPUTE gngnogoerrorsrci=((time2gngnogoerrorstransformed-time1gngnogoerrorstransformed)-0.14)/0.73.
EXECUTE.

VARIABLE LABELS gngnogoerrorsrci 'GNG, No Go Errors, RCI'.


COMPUTE gngreactiontimeforgoresponsesrci=((time2gngreactiontimeforgoresponses-time1gngreactiontimeforgoresponses)+16.16)/78.32.
EXECUTE.

VARIABLE LABELS gngreactiontimeforgoresponsesrci 'GNG, Reaction Time for Go Responses, RCI'.


Descriptive statistics for TOL Initial Thinking Time:


FREQUENCIES VARIABLES=time1tolinitialthinkingtimetrial1 time1tolinitialthinkingtimetrial2 time1tolinitialthinkingtimetrial3 time1tolinitialthinkingtimetrial6 time1tolinitialthinkingtimetrial7 
  time2tolinitialthinkingtimetrial1 time2tolinitialthinkingtimetrial2 time2tolinitialthinkingtimetrial3 time2tolinitialthinkingtimetrial6 time2tolinitialthinkingtimetrial7 
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolinitialthinkingtimetrial1 time1tolinitialthinkingtimetrial2 time1tolinitialthinkingtimetrial3 time1tolinitialthinkingtimetrial6 time1tolinitialthinkingtimetrial7 
  time2tolinitialthinkingtimetrial1 time2tolinitialthinkingtimetrial2 time2tolinitialthinkingtimetrial3 time2tolinitialthinkingtimetrial6 time2tolinitialthinkingtimetrial7 
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformation for TOL Initial Thinking Time:


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


COMPUTE time2tolinitialthinkingtimetrial1transformed=((time2tolinitialthinkingtimetrial1+1)**-0.5-1)/-0.5.

VARIABLE LABELS time2tolinitialthinkingtimetrial1transformed 'Time 2, TOL, Initial Thinking Time, Trial 1, Transformed'.

COMPUTE time2tolinitialthinkingtimetrial2transformed=((time2tolinitialthinkingtimetrial2+1)**-0.5-1)/-0.5.

VARIABLE LABELS time2tolinitialthinkingtimetrial2transformed 'Time 2, TOL, Initial Thinking Time, Trial 2, Transformed'.

COMPUTE time2tolinitialthinkingtimetrial3transformed=((time2tolinitialthinkingtimetrial3+1)**-0.5-1)/-0.5.

VARIABLE LABELS time2tolinitialthinkingtimetrial3transformed 'Time 2, TOL, Initial Thinking Time, Trial 3, Transformed'.

COMPUTE time2tolinitialthinkingtimetrial6transformed=((time2tolinitialthinkingtimetrial6+1)**-0.5-1)/-0.5.

VARIABLE LABELS time2tolinitialthinkingtimetrial6transformed 'Time 2, TOL, Initial Thinking Time, Trial 6, Transformed'.

COMPUTE time2tolinitialthinkingtimetrial7transformed=((time2tolinitialthinkingtimetrial7+1)**-0.5-1)/-0.5.

VARIABLE LABELS time2tolinitialthinkingtimetrial7transformed 'Time 2, TOL, Initial Thinking Time, Trial 7, Transformed'.


FREQUENCIES VARIABLES=time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed 
  time2tolinitialthinkingtimetrial1transformed time2tolinitialthinkingtimetrial2transformed time2tolinitialthinkingtimetrial3transformed time2tolinitialthinkingtimetrial6transformed time2tolinitialthinkingtimetrial7transformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed 
  time2tolinitialthinkingtimetrial1transformed time2tolinitialthinkingtimetrial2transformed time2tolinitialthinkingtimetrial3transformed time2tolinitialthinkingtimetrial6transformed time2tolinitialthinkingtimetrial7transformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Descriptive statistics for TOL Execution Time:


FREQUENCIES VARIABLES=time1tolexecutiontimetrial1 time1tolexecutiontimetrial2 time1tolexecutiontimetrial3 time1tolexecutiontimetrial6 time1tolexecutiontimetrial7 
  time2tolexecutiontimetrial1 time2tolexecutiontimetrial2 time2tolexecutiontimetrial3 time2tolexecutiontimetrial6 time2tolexecutiontimetrial7
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolexecutiontimetrial1 time1tolexecutiontimetrial2 time1tolexecutiontimetrial3 time1tolexecutiontimetrial6 time1tolexecutiontimetrial7 
  time2tolexecutiontimetrial1 time2tolexecutiontimetrial2 time2tolexecutiontimetrial3 time2tolexecutiontimetrial6 time2tolexecutiontimetrial7
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Transformation for TOL Execution Time:


COMPUTE time1tolexecutiontimetrial1transformed=((time1tolexecutiontimetrial1+1)**-1-1)/-1.

VARIABLE LABELS time1tolexecutiontimetrial1transformed 'Time 1, TOL, Execution Time, Trial 1, Transformed'.

COMPUTE time1tolexecutiontimetrial2transformed=((time1tolexecutiontimetrial2+1)**-1-1)/-1.

VARIABLE LABELS time1tolexecutiontimetrial2transformed 'Time 1, TOL, Execution Time, Trial 2, Transformed'.

COMPUTE time1tolexecutiontimetrial3transformed=((time1tolexecutiontimetrial3+1)**-1-1)/-1.

VARIABLE LABELS time1tolexecutiontimetrial3transformed 'Time 1, TOL, Execution Time, Trial 3, Transformed'.

COMPUTE time1tolexecutiontimetrial6transformed=((time1tolexecutiontimetrial6+1)**-1-1)/-1.

VARIABLE LABELS time1tolexecutiontimetrial6transformed 'Time 1, TOL, Execution Time, Trial 6, Transformed'.

COMPUTE time1tolexecutiontimetrial7transformed=((time1tolexecutiontimetrial7+1)**-1-1)/-1.

VARIABLE LABELS time1tolexecutiontimetrial7transformed 'Time 1, TOL, Execution Time, Trial 7, Transformed'.


COMPUTE time2tolexecutiontimetrial1transformed=((time2tolexecutiontimetrial1+1)**-1-1)/-1.

VARIABLE LABELS time2tolexecutiontimetrial1transformed 'Time 2, TOL, Execution Time, Trial 1, Transformed'.

COMPUTE time2tolexecutiontimetrial2transformed=((time2tolexecutiontimetrial2+1)**-1-1)/-1.

VARIABLE LABELS time2tolexecutiontimetrial2transformed 'Time 2, TOL, Execution Time, Trial 2, Transformed'.

COMPUTE time2tolexecutiontimetrial3transformed=((time2tolexecutiontimetrial3+1)**-1-1)/-1.

VARIABLE LABELS time2tolexecutiontimetrial3transformed 'Time 2, TOL, Execution Time, Trial 3, Transformed'.

COMPUTE time2tolexecutiontimetrial6transformed=((time2tolexecutiontimetrial6+1)**-1-1)/-1.

VARIABLE LABELS time2tolexecutiontimetrial6transformed 'Time 2, TOL, Execution Time, Trial 6, Transformed'.

COMPUTE time2tolexecutiontimetrial7transformed=((time2tolexecutiontimetrial7+1)**-1-1)/-1.

VARIABLE LABELS time2tolexecutiontimetrial7transformed 'Time 2, TOL, Execution Time, Trial 7, Transformed'.


FREQUENCIES VARIABLES=time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed 
  time2tolexecutiontimetrial1transformed time2tolexecutiontimetrial2transformed time2tolexecutiontimetrial3transformed time2tolexecutiontimetrial6transformed time2tolexecutiontimetrial7transformed
  /FORMAT=NOTABLE
  /STATISTICS=STDDEV MINIMUM MAXIMUM SEMEAN MEAN SKEWNESS SESKEW KURTOSIS SEKURT
  /ORDER=ANALYSIS.


EXAMINE VARIABLES=time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed 
  time2tolexecutiontimetrial1transformed time2tolexecutiontimetrial2transformed time2tolexecutiontimetrial3transformed time2tolexecutiontimetrial6transformed time2tolexecutiontimetrial7transformed
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


Anova for TOL Initial Thinking Time:


GLM 
time1tolinitialthinkingtimetrial1transformed time1tolinitialthinkingtimetrial2transformed time1tolinitialthinkingtimetrial3transformed time1tolinitialthinkingtimetrial6transformed time1tolinitialthinkingtimetrial7transformed 
  time2tolinitialthinkingtimetrial1transformed time2tolinitialthinkingtimetrial2transformed time2tolinitialthinkingtimetrial3transformed time2tolinitialthinkingtimetrial6transformed time2tolinitialthinkingtimetrial7transformed
  /WSFACTOR=abc 2 Polynomial def 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(def*abc) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(def) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(abc) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(def*abc) 
  /EMMEANS=TABLES(def)
  /EMMEANS=TABLES(abc)
  /EMMEANS=TABLES(def*abc) COMPARE(abc) ADJ(BONFERRONI)
  /EMMEANS=TABLES(def*abc) COMPARE(def) ADJ(BONFERRONI) 
  /PRINT=DESCRIPTIVE ETASQ OPOWER TEST
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=def abc def*abc.


Anova for TOL Execution Time:


GLM 
time1tolexecutiontimetrial1transformed time1tolexecutiontimetrial2transformed time1tolexecutiontimetrial3transformed time1tolexecutiontimetrial6transformed time1tolexecutiontimetrial7transformed 
  time2tolexecutiontimetrial1transformed time2tolexecutiontimetrial2transformed time2tolexecutiontimetrial3transformed time2tolexecutiontimetrial6transformed time2tolexecutiontimetrial7transformed
  /WSFACTOR=abc 2 Polynomial def 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(def*abc) TYPE=LINE ERRORBAR=NO MEANREFERENCE=NO YAXIS=AUTO
  /EMMEANS=TABLES(def) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(abc) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(def*abc) 
  /EMMEANS=TABLES(def)
  /EMMEANS=TABLES(abc)
  /EMMEANS=TABLES(def*abc) COMPARE(abc) ADJ(BONFERRONI)
  /EMMEANS=TABLES(def*abc) COMPARE(def) ADJ(BONFERRONI) 
  /PRINT=DESCRIPTIVE ETASQ OPOWER TEST
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=def abc def*abc.
