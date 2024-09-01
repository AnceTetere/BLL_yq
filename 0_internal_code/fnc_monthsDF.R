#Izstrādā nT, kas dalās mēnešos
months_df <- function(x, DF, k_fm, order_vec, kop) {
  
  for (j in 1:length(DF)) {
    #1 Funkcija fnc_DF apstrādā nT un savieno to ar konfidencialitātes aprēķinu vērtībām.
    z <- fnc_DF(x, DF[j], k_fm, order_vec)
    
    #2 Pārsauc agregātus un izformē
    colnames(z)[colnames(z) == "NOZ2"] <- "N kods"
    
    for (m in 1:12) {
      colnames(z)[colnames(z) == paste0("G", m)] <- m
      #z[as.numeric(z$Confidential) < 4 & as.numeric(z$Confidential) > 0, as.character(m)] <- "Conf"
    }
    
    z <- z[match(order_vec, z$`N kods`), c("N kods",
                                                 "1", "2", "3", "4", "5", "6",
                                                 "7", "8", "9", "10", "11", "12")]
    
    #3 Saglabā
    cat(fnc_DF(z, kop, DF, j))
    
  }
  rm(x, DF, k_fm, order_vec, j, m)
  return(paste0("Mēnešu nT kopsavilkumam ", substr(kop, 3, 4), " gatavas.\n"))
}
