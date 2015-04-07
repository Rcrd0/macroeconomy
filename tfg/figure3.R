#figure2.R
#svg(file = "figura3.svg", width = 12, height = 4)

macro <- read.csv("TFG v0.4.csv", header = TRUE, sep = ";", dec = ",")
bde <- subset(macro[macro$BC == "BdE", ])


par(mfrow = c(1, 2), mar=c(4,4,2,1), lab= c(11, 5, 7))
boxplot(bde$It ~ bde$Derecha, data = bde, ylab = "Inflación", pch = 20,
        names = c("PSOE (13)", "UCD (7)", "PP (2)", "Dictad (11)"),
        col = c("red", "darkgreen", "blue", "darkgray"))

avg <- round(mean(bde$It[bde$Gobierno == "PSOE"]), 2)
text(1, avg+0.08, bquote(bar(I[t]) == .(avg)))

avg <- round(mean(bde$It[bde$Gobierno == "UCD"]), 2)
text(2, avg+0.08, bquote(bar(I[t]) == .(avg)))

avg <- round(mean(bde$It[bde$Gobierno == "PP"]), 2)
text(3, avg+0.08, bquote(bar(I[t]) == .(avg)))

avg <- round(mean(bde$It[bde$Gobierno == "Dictadura"]), 2)
text(4, avg+0.08, bquote(bar(I[t]) == .(avg)))


boxplot(bde$V_It ~ bde$Derecha, data = bde, ylab = "Aumento de Inflación", pch = 20,
        names = c("PSOE (13)", "UCD (7)", "PP (2)", "Dictad (11)"),
        col = c("red", "darkgreen", "blue", "darkgray"))

avg <- round(mean(bde$V_It[bde$Gobierno == "PSOE"]), 2)
text(1, avg-0.05, bquote(bar(Delta * I[t]) == .(avg)))

avg <- round(mean(bde$V_It[bde$Gobierno == "UCD"]), 2)
text(2, avg-0.05, bquote(bar(Delta * I[t]) == .(avg)))

avg <- round(mean(bde$V_It[bde$Gobierno == "PP"]), 2)
text(3, avg-0.05, bquote(bar(Delta * I[t]) == .(avg)))

avg <- round(mean(bde$V_It[bde$Gobierno == "Dictadura"]), 2)
text(4, avg-0.05, bquote(bar(Delta * I[t]) == .(avg)))



#dev.off()
