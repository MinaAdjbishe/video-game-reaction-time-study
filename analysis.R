# -----------------------------------------------------------
# The Impact of Video Game Experience on Response Time
# Go/No-Go Task Analysis Script
# -----------------------------------------------------------

# Load packages
library(tidyverse)
library(psych)       # for describeBy or describe_across
library(psyntur)     # for tukeyboxplot
library(moments)     # if I need skew/kurtosis
library(emmeans)     # for post-hoc if needed

# -----------------------------------------------------------
# Descriptive statistics
# -----------------------------------------------------------

describe_across(
  data = Final_Data,
  by = experience,
  variables = rt,
  functions = list(
    Mean = mean,
    SD = sd,
    med = median,
    iqr = IQR
  ),
  pivot = TRUE
)

# -----------------------------------------------------------
# Boxplot (Tukey style)
# -----------------------------------------------------------

tukeyboxplot(
  data = Final_Data,
  x = experience,
  y = rt,
  xlab = "Experience",
  ylab = "Reaction Time (ms)"
)

# -----------------------------------------------------------
# One-way ANOVA
# -----------------------------------------------------------

model <- aov(rt ~ experience, data = Final_Data)
summary(model)


# -----------------------------------------------------------
# End of script
# -----------------------------------------------------------
