##Time Series Analysis
#Simulating Time Series

#AR(3)
AR3 <- function(t = 100, mu = 0, sigma2 = 1, phi_1 = 0, phi_2 = 0, phi_3 = 0){
  
  eps <- c(rnorm(t, mu, sigma2))
  Yt <- c(0, 0, 0)
  
  for(i in 4:t){
    Yt[i] <- Yt[i-1]*phi_1 + Yt[i-2]*phi_2 + Yt[i-3]*phi_3 + eps[i-3]
  }
  
  return(Yt)
}

x <- AR3( t = 100, phi_1 = 0.05, phi_2 = 0.02, phi_3 = 0.001)
plot(as.ts(x))
