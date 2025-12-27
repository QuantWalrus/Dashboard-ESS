# Si no tienes instalado tidyverse, descomenta la siguiente línea:
# install.packages("tidyverse")

library(tidyverse)

# Cargar los datos
ess_data <- read.csv("Datos/ESS Theme - Media use and trust.csv")

# 1. Definimos las listas de variables
vars_r5    <- c("netuse", "nwsppol", "nwsptot", "rdpol", "rdtot")
vars_r7    <- c("tvpol", "tvtot")
vars_r11   <- c("netusoft", "netustm", "nwspol", "pplfair", "pplhlp", "ppltrst")
vars_pesos <- c("dweight", "pspwght", "pweight", "anweight")

# 2. Creamos la base depurada
base_depurada <- ess_data %>% 
  # PASO A: FILTRAR FILAS
  filter(essround %in% c(5, 7, 11)) %>% 
  
  # PASO B: SELECCIONAR COLUMNAS
  select(
    idno,       
    cntry,      
    essround,
    all_of(vars_pesos), # <--- AQUÍ AGREGAMOS LOS PESOS
    all_of(vars_r5),
    all_of(vars_r7),
    all_of(vars_r11)
  )

# Verificamos que se vea bien (deberías ver las columnas de pesos ahora)
print(head(base_depurada))

# --- AQUÍ ESTÁ EL CÓDIGO PARA EXPORTAR ---

# Guardamos el archivo actualizado
write.csv(base_depurada, "Datos/Base de datos depurada.csv", row.names = FALSE)
