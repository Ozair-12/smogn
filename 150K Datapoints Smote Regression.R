shp <- readOGR(dsn='/home/ozair/RWorkingDirectory/0_50centimeters_T_full_group_v1.shp')
data150K <- shp@data[1:150000,]

rel <- matrix(0, ncol = 3, nrow = 0)
rel <- rbind(rel, c(0., 0.1, 0))
rel <- rbind(rel, c(0.5, 1, 0))
rel <- rbind(rel, c(1, 1, 0))
rel <- rbind(rel, c(1.5, 1, 0))
rel <- rbind(rel, c(2, 1, 0))
rel <- rbind(rel, c(3, 1, 0))
rel <- rbind(rel, c(4, 1, 0))
rel <- rbind(rel, c(5, 1, 0))
rel <- rbind(rel, c(6, 1, 0))
rel <- rbind(rel, c(7, 1, 0))
rel <- rbind(rel, c(8, 1, 0))
rel <- rbind(rel, c(9, 1, 0))
rel <- rbind(rel, c(10, 1, 0))

smoteBalan150.shp <- SmoteRegress(con~., data150K, rel=rel, dist = "HEOM", C.perc = "balance")
dim(smoteBalan150.shp)

Bal <- data.frame(smoteBalan150.shp)

smoteExt150.shp <- SmoteRegress(con~., data150K, rel=rel, dist = "HEOM", C.perc = "extreme")

Ext <- data.frame(smoteExt150.shp)

ggplot(Ext, aes(x=con)) +
  geom_histogram(data = Bal, fill ="red", alpha = 0.1)+ 
  geom_histogram(data = Ext, fill = "blue", alpha = 0.1)+ 
  geom_histogram(data = data150K, fill = "green", alpha =0.5) + xlim(-0.5,7) + geom_histogram(bins=40)

  