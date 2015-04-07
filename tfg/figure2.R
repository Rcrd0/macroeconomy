#figure2.R
macro <- read.csv("TFG_T1.csv", header = TRUE, sep = ";", dec = ",")
col_gob <- c(rep("darkgray", 11), rep("darkgreen", 7), rep("red",13), rep("blue", 8), rep("red", 8), rep("blue",3))
pch_gob <- ifelse(macro$BC == "BCE", 15, 17)

#win.metafile(filename = "Figure2.emf", width = 18, height = 6)
#text(0.10, -0.09, expression(R ^2))

svg(file = "figura2.svg", width = 8, height = 3)

par(mfrow = c(1, 3), mar=c(4,4,2,1), lab= c(11, 5, 7))
plot(macro$Ut, macro$V_It, pch =  pch_gob, col = col_gob, xlim = c(0, 0.26), ylim = c(-0.1, 0.07), main = "Curva de Phillips", xlab = "Desempleo", ylab ="Variación de inflación")

mod <- lm(macro$V_It ~ macro$Ut)
abline(mod, lwd = 2, col = rgb(0,0,0, 0.5))
text(0.10, -0.07, paste("Y = ", round(mod$coefficients[1], digits = 4), " ", round(mod$coefficients[2], digits = 4), "X",  sep =""), pos = 4)
text(0.10, -0.09, expression(R ^2), pos = 4)
text(0.12, -0.09, paste ("= ", round(summary(mod)$r.squared, 3), sep = ""), pos = 4)

bde <- subset(macro[macro$BC == "BdE", ])
plot(bde$Ut, bde$V_It, col =  col_gob[1:34], pch = 17, xlim = c(0, 0.26), ylim = c(-0.1, 0.07), main = "Curva de Phillips Peseta", xlab = "Desempleo", ylab ="Variación de inflación")
mod <- lm(bde$V_It ~ bde$Ut), lwd = 2, col = rgb(0,0,0, 0.5))
abline(mod, lwd = 2, col = rgb(0,0,0, 0.5))
text(0.10, -0.07, paste("Y = ", round(mod$coefficients[1], digits = 4), " ", round(mod$coefficients[2], digits = 4), "X",  sep =""), pos = 4)
text(0.10, -0.09, expression(R ^2), pos = 4)
text(0.12, -0.09, paste ("= ", round(summary(mod)$r.squared, 3), sep = ""), pos = 4)

legend("topright", 
       pch = c(17, 17, 17, 17), 
       col = c("darkgray", "darkgreen", "red", "blue"), 
       legend = c("Franco", "UCD", "PSOE Bde", "PP BdE"))


bce <- subset(macro[macro$BC == "BCE", ])
plot(bce$Ut, bce$V_It, col =  col_gob[35:50], pch = 15, xlim = c(0, 0.26), ylim = c(-0.1, 0.07), main = "Curva de Phillips Euro", xlab = "Desempleo", ylab ="Variación de inflación")
mod <- lm(bde$V_It ~ bde$Ut)
abline(mod, lwd = 2, col = rgb(0,0,0, 0.5))
text(0.10, -0.07, paste("Y = ", round(mod$coefficients[1], digits = 4), " ", round(mod$coefficients[2], digits = 4), "X",  sep =""), pos = 4)
text(0.10, -0.09, expression(R ^2), pos = 4)
text(0.12, -0.09, paste ("= ", round(summary(mod)$r.squared, 3), sep = ""), pos = 4)

legend("topright", 
       pch = c(15, 15), 
       col = c("blue", "red"), 
       legend = c("PP BCE", "PSOE BCE"))

dev.off()

