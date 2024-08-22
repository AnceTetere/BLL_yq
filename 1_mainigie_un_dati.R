# Saņemtie dati BLL
base_path <- "..\\DS_ds_sectorsBLL\\"

#1 Definē mainīgos: gadu un ceturksni
year <- readline(prompt = "Lūdzu ievadīt gadu:")
Q <- as.numeric(readline(prompt = "Lūdzu ievadīt ceturksni:"))

#2 Ielādē pilnu saņemto datni
library(XLConnect)

tab_name <- paste0("BLL_", substr(year,  3, 4), "c", Q)
wb <- loadWorkbook(paste0(base_path, year, "Q", Q, "\\1_SMUD\\", tab_name, ".xlsx"),
                   create = FALSE,
                   password = NULL)
worksheet <- readWorksheet(wb, sheet = 1)

#3 Pāriet uz izstrādes mapi
path <- paste0(base_path, year, "Q", Q, "\\2_izstrade\\")
if(!dir.exists(path)) {dir.create(path)}
setwd(path)         


#4 Izveido apakštabulu ar sekojošiem atribūtiem
ws <- worksheet[ , c("SV", "DAT", "nT", "NNACE", "NOZ2", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12"), drop = FALSE]
assign(tab_name, ws)
rm(worksheet, ws, wb)

#5 Saglabā
save(list = tab_name, file = paste0(base_path, year, "Q", Q, "\\1_SMUD\\", tab_name, ".RData"))
