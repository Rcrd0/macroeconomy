#figure5.R

macro <- read.csv("TFG v0.4.csv", header = TRUE, sep = ";", dec = ",")
bde <- subset(macro[macro$BC == "BdE", ])
bce <- subset(macro[macro$BC == "BCE", ])
par(mfrow = c(1, 2), mar=c(4,4,1,1), lab= c(10, 6, 7))
s <- seq (from = -0.01, to = 0.3, by = 0.005)
col <- ifelse(s < 0 | s >= 0.03, "red", "darkgreen")
hist(bde$It, breaks = s, col = col, xlim = c(-0.01, 0.3), ylim = c(0,7), 
     main = "Inflación con el BdE", ylab = "Número de años", xlab = expression(I[t]))
abline(v = 0.00, col = "red", lty = "dashed")
abline(v = 0.03, col = "red", lty = "dashed")
avg <- round(mean(bde$It), 3)
text(0.15, 4, bquote(bar(I[t]) == .(avg)))

hist(bce$It, breaks = s, col = col, xlim = c(-0.01, 0.3), ylim = c(0,7),
main = "Inflación con el BCE", ylab = "Número de años", xlab = expression(I[t]))
abline(v = 0.00, col = "red", lty = "dashed")
abline(v = 0.03, col = "red", lty = "dashed")
avg <- round(mean(bce$It), 3)
text(0.15, 4, bquote(bar(I[t]) == .(avg)))

     
max(macro$It    )
par
seq 0:10
