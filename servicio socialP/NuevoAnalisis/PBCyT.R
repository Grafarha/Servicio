#librerias 
library(readxl)
library(readr)

#ruta del diectorio que vamos a usar 
setwd("~/GitHub/Servicio/servicio socialP/NuevoAnalisis")

#ruta del directorio donde estan los datos 
BDD1 <- read_csv("~/GitHub/Servicio/servicio socialP/NuevoAnalisis/BDD1.csv")
BDD2 <- read_csv("~/GitHub/Servicio/servicio socialP/NuevoAnalisis/BDD2.csv")

#renombramos las tablas de datos 
data1 <- BDD1; data2 <- BDD2; misdatos <- rbind(data1,data2); summary(misdatos)

#renombraremos los nombres de las carreras 
misdatos$Nombre_Carrera <- factor(misdatos$Nombre_Carrera,
                                  levels = c('Ingeniería en Sistemas Electrónicos y de Telecomunicaciones',
                                             'Arte y Patrimonio Cultural','Ciencia Política y Administración Urbana',
                                             'Ciencias Ambientales y Cambio Climático','Ciencias Genómicas',
                                             'Ciencias Sociales','Comunicación y Cultura',
                                             'Creación Literaria','Derecho','Filosofía e Historia de las Ideas',
                                             'Historia y Sociedad Contemporánea','Ingeniería de Software',
                                             'Ingeniería en Sistemas de Transporte Urbano',
                                             'Ingeniería en Sistemas Electrónicos Industriales',
                                             'Ingeniería en Sistemas Energéticos',
                                             'Modelación Matemática','Nutrición y Salud',
                                             'Promoción de la Salud','Protección Civil y Gestión de Riesgos'),
                                  labels = c('ISET','AyPC','CPyAU','CAyCC','GENOMICAS','CiSOC','COMYCULT',
                                             'CREACION','DERECHO','FEHDI','HISTYSOCCON','SOFTWARE','ISTU',
                                             'ISEI','ISENER','MODELACION','NUTRICION','PROMOCION','PROTECCION'))

#tomaremos de la fila de carreras, las carreras que son de ciencia y tecnologia 
BDD_CyT <- misdatos %>% filter(misdatos$Nombre_Carrera=='ISET' | misdatos$Nombre_Carrera=='GENOMICAS' |
                                 misdatos$Nombre_Carrera=='SOFTWARE' | misdatos$Nombre_Carrera=='ISTU' |
                                 misdatos$Nombre_Carrera=='ISEI' | misdatos$Nombre_Carrera=='ISENER' |
                                 misdatos$Nombre_Carrera=='MODELACION')
misdatosbck <- misdatos; misdatos <- BDD_CyT; #View(misdatos); 
summary(misdatos)

#acada numero que aparece le espesificaremos de que generacion es 
misdatos$GEN <- factor(misdatos$GEN,
                       levels = c('01','02','03','04','05','06','07','08','09','10','11','12',
                                  '13','14','15','16','17','18','19','20','21'),
                       labels = c('01','02','03','04','05','06','07','08','09','10','11','12',
                                  '13','14','15','16','17','18','19','20','21'))
summary(misdatos$GEN)

