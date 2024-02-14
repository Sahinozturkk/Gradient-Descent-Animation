Gradient Descent Animation

```markdown
---
title: "Gradient Descent Animation"
author: "Sahin Ozturk"
date: "2023-07-12"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Gradient Descent Animation Function

```{r}
gradient_descent_animation <- function(x, y, alpha = 0.01, num_iterations = 1000) {
  df <- data.frame(y = y, x = x)
  
  # Initial theta values
  theta <- c(0, 0)
  
  # History of cost function
  cost_history <- numeric(num_iterations)
  
  # List to store history of theta values
  theta_history <- list()
  
  for (i in 1:num_iterations) {
    # Compute predictions
    y_pred <- theta[1] + theta[2] * x
    
    # Cost function
    cost <- mean((y_pred - y)^2)
    cost_history[i] <- cost
    
    # Compute gradients
    grad0 <- mean(y_pred - y)
    grad1 <- mean((y_pred - y) * x)
    
    # Update theta values
    theta[1] <- theta[1] - alpha * grad0
    theta[2] <- theta[2] - alpha * grad1
    
    # Store theta values
    theta_history[[i]] <- theta
  }
  
  # Print final theta values
  cat("Final Theta Values:", theta, "\n")
  
  # Find the elbow point of the cost
  for (j in 1:(length(cost_history)-1)) {
    if (cost_history[j]-cost_history[j+1] < 10^-3){
      cat("Optimal point found at iteration", j, "\n")
      break()
    }
    else {
      print("Optimal point not found")
    }
  }
  
  # Plot of the cost function
  plot(1:num_iterations, cost_history, type = "l", xlab = "Iteration", ylab = "Cost")
  abline(v=j)
  
  # Compute updated predictions
  df$y_pred <- theta[1] + theta[2] * df$x
  
  # Plot original data and predictions
  ggplot(data = df, aes(y = y, x = x)) +
    geom_point() +
    geom_line(aes(y = y_pred), color = "green")
  
  iters <- c((1:31)^2, 1000)
  cols <- rev(terrain.colors(num_iterations))
  
  png("frame%03d.png")
  par(ask = FALSE)
  
  # Generate frames for animation
  for (i in iters) {
    plot(x, y, col = "grey80", main = 'Linear regression using Gradient Descent')
    text(x = -3, y = 10, paste("slope = ", round(theta_history[[i]][2], 3), sep = " "), adj = 0)
    text(x = -3, y = 8, paste("intercept = ", round(theta_history[[i]][1], 3), sep = " "), adj = 0)
    abline(coef = theta_history[[i]], col = cols[i], lwd = 2)
  }
  
  dev.off()
  
  png_files <- sprintf("frame%03d.png", 1:32)
  gif_file <- gifski(png_files, delay = 0.4)
  unlink(png_files)
}
```

```{r}
# Now let's run this gradient descent function with some data

library(ggplot2)
library(gifski)
set.seed(123)
x <- runif(50, -5, 5)
y <- x + rnorm(50) + 3

gradient_descent_animation(x = iris$Petal.Width, y = iris$Petal.Length, alpha = 0.21, num_iterations = 1000)
```



