## Base model

# Simulation parameters
t = 500
dt = 0.1
steps = t / dt

euler_base = function(a, b, c, d, r, s, Kp, Kg, p0 = 0.5, g0 = 1) {
  #Matrix and initial
  ArmsRace = matrix(0, nrow = 3, ncol = steps + 1) #3 rows are for t,p,g, 
  # n+1 columns for including both endpoints of time (start at 0)
  ArmsRace[1, 1] = 0
  ArmsRace[2, 1] = p0 #p initial condition
  ArmsRace[3, 1] = g0 #g initial condition
  
  #Euler Method
  for (i in 1:steps) {
    t_i = ArmsRace[1, i]
    p_i = ArmsRace[2, i]
    g_i = ArmsRace[3, i]
    
    dp = a * g_i - b * p_i + r
    dg = c * p_i - d * g_i + s
    
    ArmsRace[1, i + 1] = t_i + dt
    ArmsRace[2, i + 1] = p_i + dt * dp
    ArmsRace[3, i + 1] = g_i + dt * dg
    
    # Prevent negative arms levels
    ArmsRace[2, i + 1] = max(0, ArmsRace[2, i + 1])
    ArmsRace[3, i + 1] = max(0, ArmsRace[3, i + 1])
  }
  return(ArmsRace)
}

vplot_base = function(pngname, a, b, c, d, r, s,
                          y1, y2, y3,
                          xlim_max = 2, ylim_max = 2, title = NULL) {
  # Initialize grid for vectors
  p_vals <- seq(0, xlim_max, length.out = 20)
  g_vals <- seq(0, ylim_max, length.out = 20)
  grid   <- expand.grid(p = p_vals, g = g_vals)
  
  # Compute derivatives at each grid point
  dp <- numeric(nrow(grid))
  dg <- numeric(nrow(grid))
  
  for (i in 1:nrow(grid)) {
    dp[i] <- a * grid$g[i] - b * grid$p[i] + r
    dg[i] <- c * grid$p[i] - d * grid$g[i] + s
  }
  
  magnitude <- sqrt(dp^2 + dg^2)
  nonzero   <- magnitude > 1e-6
  
  # Compute simulation paths
  euler1 = euler_base(a, b, c, d, r, s, p0=y1[1], g0=y1[2])
  euler2 = euler_base(a, b, c, d, r, s, p0=y2[1], g0=y2[2])
  euler3 = euler_base(a, b, c, d, r, s, p0=y3[1], g0=y3[2])
  
  main_title <- paste("a=",a,", b=",b,", c=",c,
                      ", d=",d,", r=",r,", s=",s)
  
  png(pngname, width=1000, height=1000) # Saves plot as a png
  par(cex=1.1, mar=c(5, 6, 4, 2), cex.main=2)
  plot(grid$p, grid$g, pch=20, col="lightgray",
       cex.main=2, cex.lab=5,
       main=main_title,
       xlab="p", ylab="g",
       xlim=c(0, xlim_max), ylim=c(0, ylim_max))
  
  #black dot represents simulation starting points
  #i.e. initial values
  points(y1[1], y1[2], col="black", cex=2, pch=16)
  #simulation path
  lines(euler1[2,], euler1[3,], col="red", lwd=5)
  
  points(y2[1], y2[2], col="black", cex=2, pch=16)
  lines(euler2[2,], euler2[3,], col="red", lwd=5)
  
  points(y3[1], y3[2], col="black", cex=2, pch=16)
  lines(euler3[2,], euler3[3,], col="red", lwd=5)
  
  #plot vectors
  arrows(grid$p[nonzero], grid$g[nonzero],
         grid$p[nonzero] + 0.15 * dp[nonzero],
         grid$g[nonzero] + 0.15 * dg[nonzero],
         length=0.15, col="blue")
  
  legend("topleft",
         legend=c("Instantaneous change", "Simulation start", "Simulation"),
         col=c("blue","black","red"),
         lty=c(1, NA, 1),
         pch=c(NA, 16, NA),
         lwd=c(2, NA, 2),
         cex=2)
  dev.off()
}

# Base model with no r,s: Disarm
vplot_base("Vecplot1_disarm.png",
               a=0.4, b=0.8, c=0.3, d=0.2,r=0, s=0,
               y1=c(0.3,1.4),y2=c(1.4,0.2),y3=c(1.6,0.5),
               xlim_max=2, ylim_max=2,
               title="a=0.4,b=0.8,c=0.3,d=0.2,r=0,s=0")

# Base model with no r,s: Race
vplot_base("Vecplot2_race.png",
               a=0.4, b=0.1, c=0.3, d=0.2,r=0, s=0,
               y1=c(0.3,1.4),y2=c(1.4,0.2),y3=c(1.6,0.5),
               xlim_max=2, ylim_max=2,
               title="a=0.4,b=0.8,c=0.3,d=0.2,r=0,s=0")

# Base model with no r,s: Stable
vplot_base("Vecplot3_stable.png",
               a=0.4, b=0.6, c=0.3, d=0.2,r=0, s=0,
               y1=c(0.3,1.4),y2=c(1.4,0.2),y3=c(1.6,0.5),
               xlim_max=2, ylim_max=2,
               title="a=0.4,b=0.6,c=0.3,d=0.2,r=0,s=0")

# Base model with r,s: Race
vplot_base("S3_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=0, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=0,s=20")

# Base model with r,s: one grows-one shrinks
vplot_base("S4_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=-20, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=-20,s=20")

# Base model with r,s: disarmament
vplot_base("S5_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=-20, s=-20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=-20,s=-20")

# bd = ac — arms race
vplot_base("S6_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=20, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=20,s=20")

## Model extension

# Simulation variables
t = 50
dt = 0.1
steps = t / dt

euler_logistic = function(a, b, c, d, r, s, Kp, Kg, p0 = 0.5, g0 = 1) {
  # Initialize values
  # Matrix: row 1 = time, row 2 = p, row 3 = g
  ArmsRace = matrix(0, nrow = 3, ncol = steps + 1)
  ArmsRace[1, 1] = 0
  ArmsRace[2, 1] = p0
  ArmsRace[3, 1] = g0
  
  # Euler method
  for (i in 1:steps) {
    t_i = ArmsRace[1, i]
    p_i = ArmsRace[2, i]
    g_i = ArmsRace[3, i]
    
    # Logistic fear adjustment
    dp = a * g_i * (1 - p_i / Kp) - b * p_i + r
    dg = c * p_i * (1 - g_i / Kg) - d * g_i + s
    
    ArmsRace[1, i + 1] = t_i + dt
    ArmsRace[2, i + 1] = p_i + dt * dp
    ArmsRace[3, i + 1] = g_i + dt * dg
    
    # Prevent negative arms levels
    ArmsRace[2, i + 1] = max(0, ArmsRace[2, i + 1])
    ArmsRace[3, i + 1] = max(0, ArmsRace[3, i + 1])
  }
  
  return(ArmsRace)
}

# Case 1
ArmsRace = euler_logistic(a = 0.25, b = 0.1, c = 0.25, d = 0.1,
                          r = -0.1, s = -0.1, Kp = 5, Kg = 5)

png("logistic_case1.png", width = 1000, height = 1000)
par(cex = 2.5)
plot(ArmsRace[1, ], ArmsRace[2, ], type = "l", col = "blue",
     xlab = "Time", ylab = "National Arms",
     main = "a = 0.25, b = 0.1, c = 0.25, d = 0.1, r = -0.1, s = -0.1, Kp = 5, Kg = 5",
     cex.main =1,
     ylim = range(c(ArmsRace[2, ], ArmsRace[3, ])), lwd = 10)
lines(ArmsRace[1, ], ArmsRace[3, ], col = "red", lwd = 10)
legend("topright", legend = c("Nation P", "Nation G"),
       col = c("blue", "red"), lwd = 10)
dev.off()

# Case 2
ArmsRace = euler_logistic(a = 0.25, b = 0.25, c = 0.25, d = 0.25,
                          r = -0.3, s = 0.3, Kp = 5, Kg = 5)

png("logistic_case2.png", width = 1000, height = 1000)
par(cex = 2.5)
plot(ArmsRace[1, ], ArmsRace[2, ], type = "l", col = "blue",
     xlab = "Time", ylab = "National Arms",
     main = "a=b=c=d=0.25, r=-0.3, s=0.3, Kp=5, Kg=5",
     cex.main =1,
     ylim = range(c(ArmsRace[2, ], ArmsRace[3, ])), lwd = 10)
lines(ArmsRace[1, ], ArmsRace[3, ], col = "red", lwd = 10)
legend("right", legend = c("Nation P", "Nation G"),
       col = c("blue", "red"), lwd = 10)
dev.off()

# Case 3
ArmsRace = euler_logistic(a = 0.1, b = 0.25, c = 0.1, d = 0.25,
                          r = 0.3, s = 0.3, Kp = 5, Kg = 5)

png("logistic_case3.png", width = 1000, height = 1000)
par(cex = 2.5)
plot(ArmsRace[1, ], ArmsRace[2, ], type = "l", col = "blue",
     xlab = "Time", ylab = "National Arms",
     main = "a=0.1, b=0.25, c=0.1, d=0.25, r=0.3, s=0.3, Kp=5, Kg=5",
     cex.main =1,
     ylim = range(c(ArmsRace[2, ], ArmsRace[3, ])), lwd = 10)
lines(ArmsRace[1, ], ArmsRace[3, ], col = "red", lwd = 10)
legend("right", legend = c("Nation P", "Nation G"),
       col = c("blue", "red"), lwd = 10)
dev.off()


## Results


#sensitivity a, 
ArmsRace = euler_logistic(a=0.5,b=0.2,
                          c=0.25,d=0.2,r=0,s=0,p0=0.8,g0=0.4,Kp=1,Kg=1)
png("sensitivity_a.png", width=1000, height=1000) 
par(cex=3.5)
plot(ArmsRace[1,], ArmsRace[2,], type = "l",col="blue",
     xlab="Time", ylab="National Arms",
     ylim=c(0,1),
     main ="c=0.25, b=d=0.2, r=s=0, Kp=Kg=1",
     cex.main=1,
     #ylim=range(c(ArmsRace[2,],ArmsRace[3,])),
     lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],col="red",lwd=10)
ArmsRace=euler_logistic(a=0.25,b=0.2,c=0.25,d=0.2,r=0,s=0,p0=0.8,g0=0.4,Kp=1,Kg=1)
lines(ArmsRace[1,],ArmsRace[2,],lty=3,col="blue",lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],lty=3,col="red",lwd=10)
legend("topright",legend=c("Nation P (a=0.5)",
                           "Nation G (a=0.5)","Nation P (a=0.25)",
                           "Nation G (a=0.25)"),
       col=c("blue","red"),lwd=10,lty=c(1,1,3,3),bg = "transparent")
dev.off()



#sensitivity b, 
ArmsRace = euler_logistic(a=0.25,b=0.4,c=0.25,d=0.2,r=0,
                          s=0,p0=0.8,g0=0.4,Kp=1,Kg=1)
png("sensitivity_b.png", width=1000, height=1000) # Saves plot as a png
par(cex=3.5)
plot(ArmsRace[1,], ArmsRace[2,], type = "l",col="blue",
     xlab="Time", ylab="National Arms",
     ylim=c(0,1),
     main ="a=c=0.25, d=0.2, r=s=0, Kp=Kg=1",
     cex.main=1,
     #ylim=range(c(ArmsRace[2,],ArmsRace[3,])),
     lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],col="red",lwd=10)
ArmsRace=euler_logistic(a=0.25,b=0.2,c=0.25,d=0.2,r=0,s=0,p0=0.8,g0=0.4,Kp=1,Kg=1)
lines(ArmsRace[1,],ArmsRace[2,],lty=3,col="blue",lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],lty=3,col="red",lwd=10)
legend("topright",legend=c("Nation P (b=0.4)",
                           "Nation G (b=0.4)","Nation P (b=0.2)","Nation G (b=0.2)"),
       col=c("blue","red"),lwd=10,lty=c(1,1,3,3),bg = "transparent")
dev.off()


#sensitivity r, 
ArmsRace = euler_logistic(a=0.25,b=0.2,c=0.25,d=0.2,r=0.1,s=0,p0=0.8,g0=0.4,Kp=1,Kg=1)
png("sensitivity_c.png", width=1000, height=1000) # Saves plot as a png
par(cex=3.5)
plot(ArmsRace[1,], ArmsRace[2,], type = "l",col="blue",
     xlab="Time", ylab="National Arms",
     ylim=c(0,1),
     main ="a=c=0.25, b=d=0.2, s=0, Kp=Kg=1",
     cex.main=1,
     #ylim=range(c(ArmsRace[2,],ArmsRace[3,])),
     lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],col="red",lwd=10)
ArmsRace=euler_logistic(a=0.25,b=0.2,c=0.25,d=0.2,r=0,
                        s=0,p0=0.8,g0=0.4,Kp=1,Kg=1)
lines(ArmsRace[1,],ArmsRace[2,],lty=3,col="blue",lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],lty=3,col="red",lwd=10)

legend("topright",
       legend=c("Nation P (r=0.1)",
                "Nation G (r=0.1)",
                "Nation P (r=0)",
                "Nation G (r=0)"),
       col=c("blue","red"),lwd=10,lty=c(1,1,3,3),bg = "transparent")
dev.off()


## Discussion


#USIRAN function changes value of r and a midday past certain t
euler_logistic_USIRAN = function(a, b, c, d, r, s, Kp, 
                                 Kg, p0 = 0.5, g0 = 1,a_new,r_new) {
  # Matrix: row 1 = time, row 2 = p, row 3 = g
  ArmsRace = matrix(0, nrow = 3, ncol = steps + 1)
  ArmsRace[1, 1] = 0
  ArmsRace[2, 1] = p0
  ArmsRace[3, 1] = g0
  
  for (i in 1:steps) {
    t_i = ArmsRace[1, i]
    p_i = ArmsRace[2, i]
    g_i = ArmsRace[3, i]
    
    
    if (i > 250) {
      a_use = a_new
      r_use = r_new
    } else {
      a_use = a
      r_use = r
    }
    
    
    # Logistic fear adjustment
    dp = a_use * g_i * (1 - p_i / Kp) - b * p_i + r_use
    dg = c * p_i * (1 - g_i / Kg) - d * g_i + s
    
    ArmsRace[1, i + 1] = t_i + dt
    ArmsRace[2, i + 1] = p_i + dt * dp
    ArmsRace[3, i + 1] = g_i + dt * dg
    
    # Prevent negative arms levels
    ArmsRace[2, i + 1] = max(0, ArmsRace[2, i + 1])
    ArmsRace[3, i + 1] = max(0, ArmsRace[3, i + 1])
  }
  
  return(ArmsRace)
}



#US vs IRAN illustration 
ArmsRace = euler_logistic_USIRAN(a=0.2,b=0.3,c=0.2,
                                 d=0.3,r=0,s=0,p0=0.2,g0=0.1,
                                 Kp=1,Kg=1,a_new=0.8,r_new=0.05)
png("US_Vs_IRAN.png", width=1000, height=1000) # Saves plot as a png
par(cex=3.5)
plot(ArmsRace[1,], ArmsRace[2,], type = "l",col="blue",
     xlab="Time", ylab="National Arms",
     ylim=c(0,1),
     main ="a=c=0.2, b=d=0.3, r=s=0, Kp=Kg=1",
     cex.main=1,
     #ylim=range(c(ArmsRace[2,],ArmsRace[3,])),
     lwd=10)
lines(ArmsRace[1,],ArmsRace[3,],col="red",lwd=10)

legend("topright",legend=c("US","IRAN"),
       col=c("blue","red"),
       lwd=10,lty=c(1,1),
       bg = "transparent")
dev.off()

