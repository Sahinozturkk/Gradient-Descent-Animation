---
  title: "Gradient Descent Animation"
  author: "Sahin Ozturk"
  date: "2023-07-12"
  output: html_document
---
# Load necessary libraries
library(ggplot2)
library(gifski)

# Gradient descent animation function
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
    if (cost_history[j] - cost_history[j+1] < 10^-3){
      cat("Optimal point found at iteration", j, "\n")
      break()
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
  
  # Define iteration points for animation
  iters <- seq(1, num_iterations, length.out = 32)
  cols <- rev(terrain.colors(length(iters)))
  
  # Save frames for animation
  png_files <- sprintf("frame%03d.png", 1:length(iters))
  
  # Generate frames for animation
  for (i in 1:length(iters)) {
    png(png_files[i])  # Open PNG device for each frame
    plot(x, y, col = "grey80", main = 'Linear regression using Gradient Descent')
    text(x = -3, y = 10, paste("slope = ", round(theta_history[[iters[i]]][2], 3), sep = " "), adj = 0)
    text(x = -3, y = 8, paste("intercept = ", round(theta_history[[iters[i]]][1], 3), sep = " "), adj = 0)
    abline(coef = theta_history[[iters[i]]], col = cols[i], lwd = 2)
    dev.off()  # Close the PNG device
  }
  
  # Create GIF from saved PNG frames
  gifski(png_files, gif_file = "gradient_descent_animation.gif", delay = 0.4)
  
  # Clean up by removing the PNG files
  unlink(png_files)
}

# Run the function with iris data
set.seed(123)
x <- iris$Sepal.Length  # Independent variable
y <- iris$Petal.Length  # Dependent variable
gradient_descent_animation(x = x, y = y, alpha = 0.01, num_iterations = 1000)
