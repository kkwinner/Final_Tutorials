#download the file
download.file(url = "http://libguides.colostate.edu/ld.php?content_id=27156359",
              destfile = "ex1.csv", 
              method="libcurl")

#Load the data from the file into an R variable
height<-read.csv("ex1.csv", row.names="Country")

#Now let's plot the data:

counts<-t(as.matrix(height)) #converts the variable height to a format that
#can be plotted
counts<-counts-145            #transforms the data so it looks like the excel plot
barplot(counts,               #the height of the bar
        beside = TRUE,        #put cols next to eachother
        main="Height by country in males and females",  #plot title
        xlab="Country",         #X axis label
        ylab="Height (cm)",     #Y axis label
        col=c("blue", "red"),   #bar colors
        offset=145,             #shifts the axis to make it look like excel
        ylim=c(145,190),        #y axis limits
        las=1)                  #horizontal text
axis(side=2,                    #marks on the left of axis
     at=c(145,150,155,160,165,170,175,180,185),  #where you want ticks
     las=1) #horizontal text

legend(x=0, y=190, #coordinates of where you want the legend to go 
       legend=c("Males", "Females"), #legend text label
       col=c("blue", "red"),         #colors 
       pch=15)                       #shape of legend