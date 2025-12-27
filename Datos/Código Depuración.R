# Si no tienes instalado tidyverse, descomenta la siguiente línea:
# install.packages("tidyverse")

library(tidyverse)

# Cargar los datos
ess_data <- read.csv("Datos/ESS Theme - Media use and trust.csv")

# 1. Definimos las listas de variables
vars_r5  <- c("netuse", "nwsppol", "nwsptot", "rdpol", "rdtot")
vars_r7  <- c("tvpol", "tvtot")
vars_r11 <- c("netusoft", "netustm", "nwspol", "pplfair", "pplhlp", "ppltrst")

# 2. Creamos la base depurada
base_depurada <- ess_data %>% 
  # PASO A: FILTRAR FILAS
  # Nota: Asegúrate si tu variable se llama "essround" o "ssround" en tu archivo original
  filter(essround %in% c(5, 7, 11)) %>% 
  
  # PASO B: SELECCIONAR COLUMNAS
  select(
    idno,      
    cntry,     
    essround,   
    all_of(vars_r5),
    all_of(vars_r7),
    all_of(vars_r11)
  )

# Verificamos que se vea bien
print(head(base_depurada))

# --- AQUÍ ESTÁ EL CÓDIGO PARA EXPORTAR ---

# Opción 1: Guardar como CSV (Recomendado para Excel/SPSS)

write.csv(base_depurada, "Datos/Base de datos depurada.csv", row.names = FALSE)

