# Figure 1
macro <- read.csv("TFG_T1.csv", header = TRUE, sep = ";", dec = ",")

svg(file = "figura1.svg")
#jpeg(file = "figura1.jpg", width = 15, height = 20, units = "cm", res = 172)
par(mfrow = c(3, 1), mar=c(2,4,1,1), lab= c(11, 5, 7))
plotvar(macro$t, macro$Ct, "Crecimiento real")
legend("topright", pch = 20, col = c("darkgray", "darkgreen", "red", "blue"), legend = c("Franco", "UCD", "PSOE", "PP"))
plotvar(macro$t, macro$Ut, "Desempleo")
plotvar(macro$t, macro$It, "Inflación")
dev.off()


plotvar <- function(t, values, varname)
{
  col_gob = c(rep("darkgray", 11), rep("darkgreen", 7), rep("red",13), rep("blue", 8), rep("red", 8), rep("blue",3))
  
  franco =   mean(values[1:11])
  suarez =   mean(values[12:18])
  gonzalez = mean(values[19:31])
  aznar =    mean(values[32:39])
  zapatero = mean(values[40:47])
  rajoy =    mean(values[48:50])
  plot(t, values, type = "n", ylab = varname, xlim = c(1965, 2015))
  points(t, values, col = col_gob, pch = 15)
  
  lines(t[1:11], values[1:11], col = "darkgray")
  lines(t[1:11], rep(franco,11), col = "darkgray", lty = "dashed")
  
  lines(t[11:18], values[11:18], col = "darkgreen")
  lines(t[12:18], rep(suarez,7), col = "darkgreen", lty = "dashed")
  
  lines(t[18:31], values[18:31], col = "red")
  lines(t[19:31], rep(gonzalez,13), col = "red", lty = "dashed")
  
  lines(t[31:39], values[31:39], col = "blue")
  lines(t[32:39], rep(aznar,8), col = "blue", lty = "dashed")
  
  lines(t[39:47], values[39:47], col = "red")
  lines(t[40:47], rep(zapatero,8), col = "red", lty = "dashed")
  
  lines(t[47:50], values[47:50], col = "blue")
  lines(t[48:50], rep(rajoy,3), col = "blue", lty = "dashed")
  
}