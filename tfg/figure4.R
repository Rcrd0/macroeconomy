#figure 4
#demo(plotmath)
macro <- read.csv("TFG v0.4.csv", header = TRUE, sep = ";", dec = ",")
partid <- subset(macro[19:32, ])

# names (partid)
#elect <- subset(macro[macro$A.Electoral == "Si", ])
#prelect <- subset(macro[macro$A.Pre.Elect == "Si", ])

# svg(file = "figura4.svg", width = 12, height = 4)

partid$Lev <- factor(as.character(partid$Prox.Elect))
par(mfrow = c(1, 2), mar=c(4,4,1,2), lab= c(11, 5, 7))

boxplot(partid$It ~ partid$Lev, data = partid, xlab = "Años hasta las próximas elecciones", ylab = "Inflación", pch = 20, col = "ivory")
avg <- round(mean(partid$It[partid$Prox.Elect == 0]), 2)
text(1, avg+0.006, bquote(bar(I[t]) == .(avg)))

avg <- round(mean(partid$It[partid$Prox.Elect == 1]), 2)
text(2, avg+0.006, bquote(bar(I[t]) == .(avg)))

avg <- round(mean(partid$It[partid$Prox.Elect == 2]), 2)
text(3, avg+0.006, bquote(bar(I[t]) == .(avg)))

avg <- round(mean(partid$It[partid$Prox.Elect == 3]), 2)
text(4, avg+0.006, bquote(bar(I[t]) == .(avg)))



boxplot(partid$V_It ~ partid$Lev, data = partid, xlab = "Años hasta las próximas elecciones", ylab = "Incremento de Inflación", pch = 20, col = "ivory")
avg <- round(mean(partid$V_It[partid$Prox.Elect == 0]), 2)
text(1, avg+0.003, bquote(bar(Delta * I[t]) == .(avg)))

avg <- round(mean(partid$V_It[partid$Prox.Elect == 1]), 2)
text(2, avg+0.003, bquote(bar(Delta * I[t]) == .(avg)))

avg <- round(mean(partid$V_It[partid$Prox.Elect == 2]), 2)
text(3, avg+0.003, bquote(bar(Delta * I[t]) == .(avg)))

avg <- round(mean(partid$V_It[partid$Prox.Elect == 3]), 2)
text(4, avg+0.003, bquote(bar(Delta * I[t]) == .(avg)))

