library(dplyr)
library(readxl)

Archivo2021<-read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vRE4a_Z6cvVLrc46w4L2GFhF_zEp3crU8NCEnoKx_dqIH5fqPthQd4ZXyhhEElRcmrnBR_tPMEZV2iQ/pub?gid=0&single=true&output=csv", encoding = "UTF-8")

names(Archivo2021)[7] <- "FECHA.FINAL"
names(Archivo2021)[8] <- "TOTAL"
names(Archivo2021)[9] <- "CUOTA"
names(Archivo2021)[11] <- "TOTAL.ENTREGADO.EN.DIVIDENDOS"

#agregar la variable sectores 
sectores2022<-read.csv("https://docs.google.com/spreadsheets/d/e/2PACX-1vSuC1u7x6hNZtlMC1At-KuGXM3vMrRE4V5miGW6NNl0OPKyLgCPGKYj7_BhCOdYtS3nXDH_cX2KVsRe/pub?gid=0&single=true&output=csv", encoding = "UTF-8")
Archivo2022<-merge(x=Archivo2021, y= sectores2022, all.y = TRUE)

Archivo2022$FECHA.ASAMBLEA <- as.Date(Archivo2022$FECHA.ASAMBLEA) #Convertir tipo de dato a fecha. 
Archivo2022$FECHA.INICIAL <- as.Date(Archivo2022$FECHA.INICIAL) #Convertir tipo de dato a fecha.
Archivo2022$FECHA.FINAL <- as.Date(Archivo2022$FECHA.FINAL) #Convertir tipo de dato a fecha.
Archivo2022$CUOTA <- as.numeric(Archivo2022$CUOTA) #Convertir tipo de dato a numérico.