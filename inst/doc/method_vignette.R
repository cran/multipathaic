## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 5,
  echo = TRUE,
  results = 'hide',
  message = FALSE,
  warning = FALSE
)

## ----eval=FALSE, echo=TRUE----------------------------------------------------
# # Simple example to illustrate path exploration
# library(multipathaic)
# 
# # Generate toy data
# set.seed(42)
# n <- 100
# p <- 8
# X <- matrix(rnorm(n * p), n, p)
# colnames(X) <- paste0("x", 1:p)
# y <- X[,1] + 0.5*X[,2] + rnorm(n)
# 
# # Build paths
# forest <- build_paths(X, y, family = "gaussian", K = 4, delta = 2, L = 10)

## ----results='markup'---------------------------------------------------------
# In practice, you'd see output like:
cat("Step 1: 8 candidates → Keep 5 models within AIC* + 2\n")
cat("Step 2: 35 candidates → Keep 10 models within AIC* + 2\n")
cat("Step 3: 70 candidates → Keep 10 models within AIC* + 2\n")
cat("Step 4: 70 candidates → Keep 10 models within AIC* + 2\n")
cat("\nTotal unique models explored: 35\n")

## ----results='markup'---------------------------------------------------------
# Example stability scores
cat("Variable Stability Scores:\n")
cat("x2:  π = 0.94 (highly stable)\n")
cat("x5:  π = 0.86 (highly stable)\n")
cat("x1:  π = 0.72 (moderately stable)\n")
cat("x7:  π = 0.58 (marginally stable)\n")
cat("x3:  π = 0.34 (unstable)\n")
cat("x4:  π = 0.12 (unstable)\n")

## ----results='markup'---------------------------------------------------------
cat("PLAUSIBLE MODELS (Delta=2, tau=0.6):\n\n")
cat("Best AIC: 2847.32\n\n")

cat("Model 1: [x2, x5, x8, x1]  |  Size=4  |  AIC=2847.32  |  Avg_Stab=0.83\n")
cat("Model 2: [x2, x5, x8]      |  Size=3  |  AIC=2848.15  |  Avg_Stab=0.87\n")
cat("Model 3: [x2, x5, x1]      |  Size=3  |  AIC=2849.01  |  Avg_Stab=0.84\n\n")

cat("VARIABLE SUMMARY:\n\n")
cat("Variable | Inclusion% | Avg_Stability\n")
cat("---------|------------|---------------\n")
cat("x2       |    100%    |     0.94\n")
cat("x5       |    100%    |     0.86\n")
cat("x8       |     67%    |     0.82\n")
cat("x1       |     67%    |     0.72\n")

## ----eval=FALSE---------------------------------------------------------------
# result <- multipath_aic(
#   X = X_train,
#   y = y_train,
#   family = "gaussian",
# 
#   # Path building parameters
#   K = 10,
#   eps = 1e-6,
#   delta = 2,
#   L = 50,
# 
#   # Stability parameters
#   B = 100,
#   resample_fraction = 0.8,
# 
#   # Filtering parameters
#   Delta = 2,
#   tau = 0.6,
# 
#   verbose = TRUE
# )

## ----results='markup'---------------------------------------------------------
cat("result$forest              # All explored models from build_paths()\n")
cat("result$stability           # Variable stability scores from stability()\n")
cat("result$plausible_models    # Filtered plausible models\n")
cat("  ├─ $plausible_models     # Data frame of models passing filters\n")
cat("  ├─ $best_aic             # Lowest AIC value\n")
cat("  └─ $summary              # Variable inclusion summary\n")

