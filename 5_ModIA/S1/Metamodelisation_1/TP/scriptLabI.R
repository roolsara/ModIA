rm(list=ls()) # to clear the environment

#### loading some packages and functions ####
library("plot3D")
library("MASS")
source("kernFun.R")
library("manipulate")


#### Example with the Exp. kernel  ####
x <- seq(0, 1, 0.01) # regular grid
param <- c(1, 0.2) # covariance parameters
k1 <- expKern(x, x, param) # computing the covariance matrix using an exp. kernel
image2D(k1, theta = 0, xlab = "x", ylab = "y") # plotting the covariance matrix
# Q: what can you observe from the covariance matrix?
?mvrnorm # using the help from RStudio

## to complete  ##
## simulating some samples using the "mvrnorm" function
vect_mu <- rep(0, 101)
param2 <- c(1, 0.5) # covariance parameters
k2 <- Matern_5(x, x, param2)
samples <- mvrnorm(n = 1, mu = vect_mu, Sigma = k2)
matplot(x = x, y = samples, type = "l", lty = 1,
        xlab = "Index", ylab = "Valeur", main = "Simulation de 100 échantillons",
        lwd = 1.0)
par(mfrow = c(1, 1))  # Crée une grille de subplots 2x2

simulate_process <- function(param_value) {
  param2 <- c(1, param_value) # Utiliser la valeur du slider pour param2
  k2 <- Matern_5(x, x, param2)
  samples <- mvrnorm(n = 1, mu = vect_mu, Sigma = k2)
  
  # Tracer le graphique
  matplot(x = x, y = samples, type = "l", lty = 1,
          xlab = "Index", ylab = "Valeur", main = paste("Simulation avec theta =", param_value),
          lwd = 1.0)
}

# Interface interactive
manipulate(
  simulate_process(param_value),
  param_value = slider(0.1, 5, step = 0.1, initial = 0.5)
)

# Q: what can you observe from the samples?
# longueur de corrélation, plus le theta est grand plus les variables vont être corrélées. effet lissant. dilatation
# cst de lipschitz decroit si theta croit


# Simuler et tracer pour différents kernels
par(mfrow = c(2, 2))  # Crée une grille de subplots 2x2

param <- c(1, 0.5) # covariance parameters

# Kernel 1 : Matern_5
k2_1 <- Matern_5(x, x, param)
samples_1 <- mvrnorm(n = 1, mu = vect_mu, Sigma = k2_1)
matplot(x = x, y = samples_1, type = "l", lty = 1,
        xlab = "Index", ylab = "Valeur", main = "Kernel: Matern_5",
        lwd = 1.0)

# Kernel 2 : Matern_3
k2_2 <- Matern_3(x, x, param)
samples_2 <- mvrnorm(n = 1, mu = vect_mu, Sigma = k2_2)
matplot(x = x, y = samples_2, type = "l", lty = 1,
        xlab = "Index", ylab = "Valeur", main = "Kernel: Matern_3",
        lwd = 1.0)

# Kernel 3 : Exponentielle 
kernel_exponentiel <- expKern(x,x, param)
samples_3 <- mvrnorm(n = 1, mu = vect_mu, Sigma = kernel_exponentiel)
matplot(x = x, y = samples_3, type = "l", lty = 1,
        xlab = "Index", ylab = "Valeur", main = "Kernel: Exponentiel",
        lwd = 1.0)

# Kernel 4 : Squared exp.
kernel_sqexp <- sqexpKern(x,x, param)
samples_4 <- mvrnorm(n = 1, mu = vect_mu, Sigma = kernel_sqexp)
matplot(x = x, y = samples_4, type = "l", lty = 1,
        xlab = "Index", ylab = "Valeur", main = "Kernel: squared exp.",
        lwd = 1.0)

# la régularité est liée à la régularité du kernel en 0. pas C1 pour exp par exemple. lien entre le C du kernel et le C
# polynome = ajout de regularité

X <- seq(0, 1, 1/6) # regular grid
y <- X + sin(4*pi*X)
par(mfrow = c(1, 1))  # Crée une grille de subplots 2x2

matplot(x = X, y = y, type = "l", lty = 1, main = "f(x)", lwd = 1.0)

condMean <- function(x, X, Y, kern, param){
  return(kern(x,X, param)%*%solve(kern(X,X, param))%*%Y)
}

condCov <- function(x, x_p, X, kern, param){
  return(kern(x,x_p, param)-kern(x, X, param)%*%solve(kern(X,X, param))%*%kern(X, x_p, param))
}

param <- c(1, 0.5) # covariance parameters
x <- seq(0, 1, 1/100) # regular grid

condmean = condMean(x, X, y, Matern_5, param)
condcov = condCov(x, x, X, Matern_5, param)


plot(x = X, y = y, pch = 19, col = "blue")

lines(x = x, y = condmean, type = "l", lty = 1, lwd = 1.0, col = "red")
lines(x = x, y = condmean + 1.96*sqrt(diag(condcov)), type = "l", lty = 2, lwd = 1.0, col = "green")
lines(x = x, y = condmean - 1.96*sqrt(diag(condcov)), type = "l", lty = 2, lwd = 1.0, col = "green")

legend("topright", legend = c("y", "condmean", "borne_sup", "borne_inf"), col = c("blue", "red", "green", "green"), lty = 1, lwd = 1)


