###############################################################
#  Sweep Width Estimation
#  -------------------------------------------------------
#  This script fits a Gaussian-type detection function:
#
#       p(x) = b * exp(-k * x^2)
#
#  to calibration data consisting of observed detection
#  probabilities at different distances from a transect line.
#
#  The calibration dataset included below represents actual
#  field data collected during the 2012–2013 sweep-width
#  experiments of the Wadi Qusaybah Project.
#
#  Sweep width W is computed using:
#       W = b * sqrt(pi / k)
###############################################################

library(minpack.lm)
library(ggplot2)

x <- c(1,1,2,2,2,2,3,3,3,3,3,3,3,3,4,6,6,7,7,7,8,9,9,10,10,10,10,
       11,11,11,11,11,11,12,13,13,13,14,14,14,15,15,15,16,16,16)

y <- c(.48,.04,.26,.41,.33,.59,.52,.11,.04,.19,.33,.04,.63,.26,
       .11,.04,.11,.04,.04,0,.04,0,.04,0,.04,0,0,0,0,0,.04,0,0,0,
       0,0,0,0,0,0,0,0,.11,0,0,0)

start_values <- list(b = 0.5, k = 0.05)

fit <- nlsLM(
  y ~ b * exp(-k * x^2),
  start = start_values,
  control = nls.lm.control(maxiter = 1000)
)

summary(fit)

b_hat <- coef(fit)["b"]
k_hat <- coef(fit)["k"]

pred_df <- data.frame(x = seq(min(x), max(x), length.out = 200))
pred_df$y_pred <- predict(fit, newdata = pred_df)

ggplot() +
  geom_point(aes(x, y), size = 2, color = "black") +
  geom_line(data = pred_df, aes(x, y_pred),
            color = "blue", size = 1.1) +
  labs(
    title = "Fitted Detection Function",
    subtitle = expression(p(x) == b %.% e^{-k * x^2}),
    x = "Distance from transect (m)",
    y = "Detection probability p(x)"
  ) +
  theme_minimal(base_size = 14)

W <- b_hat * sqrt(pi / k_hat)
cat("Sweep width (W):", W, "\n")

x_pred <- seq(0, max(x) + 2, length.out = 300)
y_pred <- b_hat * exp(-k_hat * x_pred^2)
shade_df <- data.frame(x = x_pred, y = y_pred)

ggplot() +
  geom_area(data = shade_df,
            aes(x = x, y = y),
            fill = "skyblue", alpha = 0.4) +
  geom_line(data = shade_df,
            aes(x = x, y = y),
            color = "blue", size = 1.1) +
  geom_point(aes(x, y), size = 2, color = "black") +
  annotate("text",
           x = max(x_pred) * 0.6,
           y = max(y_pred) * 0.8,
           label = paste0("W = ", round(W, 2)),
           color = "blue", size = 5) +
  labs(
    title = "Detection Function and Sweep Width",
    subtitle = expression(p(x) == b %.% e^{-k * x^2}),
    x = "Distance from transect (m)",
    y = "Detection probability p(x)"
  ) +
  theme_minimal(base_size = 14)
