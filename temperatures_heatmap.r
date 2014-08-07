#Jill Moore
#August 2014
#

#This script creates a heatmap displaying the average high temperatures for several cities in the US.  This script can be run as is to create a png which can beused directly or modified with program such as illustrator or inkscape

library(gplots)
library(RColorBrewer)

temps=read.table("Temperatures.tab", sep="\t", row.names=1, header=T)
temps=data.frame(t(temps))
temps=temps[order(temps$January),]
temps=data.matrix(t(temps))

colors=colorRampPalette(rev(brewer.pal(11, "Spectral")))(100)

lmat=rbind(c(4,3),c(1,2))

png("Temperatures.png",height=8, width=12, units="in", res=300)
heatmap.2(temps, trace="none", col=colors, dendogram=c("none"),density.info=c("none"), Rowv=NA, Colv=NA, lmat=lmat, lhei=c(1,4), lwid=c(0.5,0.1), margins=c(8,0))
dev.off()
