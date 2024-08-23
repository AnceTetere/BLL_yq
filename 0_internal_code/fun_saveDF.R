fun_saveDF <- function(z, kop, DF, j) {
  
  DF_name <- paste0(kop, "_t", DF[j])
  assign(DF_name, z)
  
  p <- paste0(path, "1_starptabulas\\tabulas\\")
  if(!dir.exists(p)) {dir.create(p)}
  save(list = DF_name, file = paste0(p, tab_name, "_", DF_name, ".RData"))
  
  p <- paste0(path, "2_gala_tabulas\\")
  if(!dir.exists(p)) {dir.create(p)}
  write.table(z, file = paste0(p, tab_name, "_", DF_name, ".csv"), sep = ";", 
            col.names = FALSE, qmethod = "double", row.names = FALSE)
  
  rm(list = DF_name, DF_name, z, DF, kop, j)
  return(paste0("Gala tabulas saglabātas:\n", p, "\n"))
}
