install.packages('doParallel')
library(doParallel)
system.time(foreach(i=1:10000) %do% sum(tanh(1:i)))
