fun_saveDF <- function(z, kop, df, j) {
  
  DF_name <- paste0(kop, "_t", df)
  assign(DF_name, z)
  
  # Pāriet uz izstrādes mapi un saglabā tabulu.
  path <- paste0(base_path, year, "Q", Q, "\\2_izstrade\\")
  if(!dir.exists(path)) {dir.create(path)}
  
  write.table(z, file = paste0(path, tab_name, "_", DF_name, ".csv"), sep = ";", 
            col.names = TRUE, qmethod = "double", row.names = FALSE)
  
  rm(list = DF_name, DF_name, z, kop)
  return(paste0("Tabula Nr.", DF[j], " gatava.\n"))
}
