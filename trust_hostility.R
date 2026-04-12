t = 500
dt = 0.1
steps = t / dt

euler_no_trust = function(a, b, c, d, r, s, Kp, Kg, p0 = 0.5, g0 = 1) {
  ArmsRace = matrix(0, nrow = 3, ncol = steps + 1)
  ArmsRace[1, 1] = 0
  ArmsRace[2, 1] = p0
  ArmsRace[3, 1] = g0
  
  for (i in 1:steps) {
    t_i = ArmsRace[1, i]
    p_i = ArmsRace[2, i]
    g_i = ArmsRace[3, i]
    
    dp = a * g_i - b * p_i + r
    dg = c * p_i - d * g_i + s
    
    ArmsRace[1, i + 1] = t_i + dt
    ArmsRace[2, i + 1] = p_i + dt * dp
    ArmsRace[3, i + 1] = g_i + dt * dg
    
    ArmsRace[2, i + 1] = max(0, ArmsRace[2, i + 1])
    ArmsRace[3, i + 1] = max(0, ArmsRace[3, i + 1])
  }
  return(ArmsRace)
}

vplot_no_trust = function(pngname, a, b, c, d, r, s,
                          y1, y2, y3,
                          xlim_max = 2, ylim_max = 2, title = NULL) {
  p_vals <- seq(0, xlim_max, length.out = 20)
  g_vals <- seq(0, ylim_max, length.out = 20)
  grid   <- expand.grid(p = p_vals, g = g_vals)
  
  dp <- numeric(nrow(grid))
  dg <- numeric(nrow(grid))
  
  for (i in 1:nrow(grid)) {
    dp[i] <- a * grid$g[i] - b * grid$p[i] + r
    dg[i] <- c * grid$p[i] - d * grid$g[i] + s
  }
  
  magnitude <- sqrt(dp^2 + dg^2)
  nonzero   <- magnitude > 1e-6
  
  euler1 = euler_no_trust(a, b, c, d, r, s, p0=y1[1], g0=y1[2])
  euler2 = euler_no_trust(a, b, c, d, r, s, p0=y2[1], g0=y2[2])
  euler3 = euler_no_trust(a, b, c, d, r, s, p0=y3[1], g0=y3[2])
  
  main_title <- if (!is.null(title)) title else
    paste("a=",a,", b=",b,", c=",c,", d=",d,", r=",r,", s=",s,", Kp=",Kp,", Kg=",Kg)
  
  png(pngname, width=1000, height=1000)
  par(cex=1.1, mar=c(5, 6, 4, 2), cex.main=2)
  plot(grid$p, grid$g, pch=20, col="lightgray",
       cex.main=2, cex.lab=5,
       main=main_title,
       xlab="p", ylab="g",
       xlim=c(0, xlim_max), ylim=c(0, ylim_max))
  
  points(y1[1], y1[2], col="black", cex=2, pch=16)
  lines(euler1[2,], euler1[3,], col="red", lwd=5)
  
  points(y2[1], y2[2], col="black", cex=2, pch=16)
  lines(euler2[2,], euler2[3,], col="red", lwd=5)
  
  points(y3[1], y3[2], col="black", cex=2, pch=16)
  lines(euler3[2,], euler3[3,], col="red", lwd=5)
  
  arrows(grid$p[nonzero], grid$g[nonzero],
         grid$p[nonzero] + 0.15 * dp[nonzero],
         grid$g[nonzero] + 0.15 * dg[nonzero],
         length=0.15, col="blue")
  
  legend("topleft",
         legend=c("Instantaneous change", "Simulation start", "Simulation"),
         col=c("blue","black","red"),
         lty=c(1, NA, 1),
         pch=c(NA, 16, NA),
         lwd=c(1, NA, 2),
         cex=2)
  dev.off()
}


# S1: bd > ac — stable, converges to E*
vplot_no_trust("S1_bd_gt_ac.png",
               a=0.05, b=0.8, c=0.05, d=0.6,
               r=20, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.05,b=0.8,c=0.05,d=0.6,r=s=20")

# S2: bd < ac — saddle, trajectories diverge
vplot_no_trust("S2_bd_lt_ac.png",
               a=0.7, b=0.03, c=0.6, d=0.02,
               r=20, s=-20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.7,b=0.03,c=0.6,d=0.02,r=20,s=-20")

# S3: bd = ac — both diverge
vplot_no_trust("S3_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=0, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=0,s=20")

# S4: bd = ac — one grows-one shrinks
vplot_no_trust("S4_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=-20, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=-20,s=20")

# S5: bd = ac — disarmament
vplot_no_trust("S5_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=-20, s=-20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=-20,s=-20")

# S6: bd = ac — arms race
vplot_no_trust("S6_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=20, s=20,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=20,s=20")

# S7: bd = ac — never reach equ
vplot_no_trust("S7_bd_eq_ac.png",
               a=0.1, b=0.1, c=0.1, d=0.1,
               r=0, s=0,
               y1=c(40, 80),
               y2=c(100, 150),
               y3=c(200, 50),
               xlim_max=300, ylim_max=300,
               title="a=0.1,b=0.1,c=1,d=0.1,r=0,s=0")

