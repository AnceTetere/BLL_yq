library(XLConnect)

# No SMUD saņemtie dati BLL
base_path <- "C:/Users/atetere/Desktop/DS_dS_pSpDV_BLL/"

#1 Definē mainīgos: gadu un ceturksni
year <- readline(prompt = "Lūdzu ievadīt gadu: ")
Q <- as.numeric(readline(prompt = "Lūdzu ievadīt ceturksni: "))
path <- paste0(base_path, year, "Q", Q, "/")

#2 Ielādē datus
source(paste0(base_path, "r-kods\\1_scripts\\1_datu_ielāde.R"))
source(paste0(base_path, "r-kods\\1_scripts\\2_datu_sadale.R"))
source(paste0(base_path, "r-kods\\1_scripts\\3_tabulu_izstrāde.R"))

rm(i, kops, path, Q, tab_name, year, base_path, x, y, order_vec, k_fm)
