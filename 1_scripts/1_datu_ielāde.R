#1 Ielādē pilnu no SMUD datni
tab_name <- paste0("BLL_", substr(year,  3, 4), "c", Q)
wb <- loadWorkbook(paste0(path, "/1_SMUD/", tab_name, ".xlsx"),
                   create = FALSE,
                   password = NULL)
worksheet <- readWorksheet(wb, sheet = 1)

#2 Izveido apakštabulu ar sekojošiem atribūtiem
ws <- worksheet[ , c("SV", "DAT", "tT", "N", "NOZ2", "G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12"), drop = FALSE]
assign(tab_name, ws)
rm(worksheet, ws, wb)

# Saglabā
#save(list = tab_name, file = paste0(base_path, year, "Q", Q, "\\1_SMUD\\", tab_name, ".RData"))
