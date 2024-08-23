months_df <- function(x, DF, k_fm) {

  for (j in 1:length(DF)) {
    #1 Funkcija fun_DF apstrādā tabulu un savieno to ar konfidencialitātes aprēķinu vērtībām.
    z <- fun_DF(x, DF, j, k_fm)
    #2 Pārsauc ailes un izformē
    colnames(z)[colnames(z) == "NOZ2"] <- "Nozares kods"
    
    for (m in 1:12) {
      colnames(z)[colnames(z) == paste0("G", m)] <- m
    }
    
    z <- z[match(order_vec, z$`Nozares kods`), c("Nozares kods",
                                                 "1", "2", "3", "4", "5", "6",
                                                 "7", "8", "9", "10", "11", "12")]
    rm(order_vec, m)
    
    #3 Saglabā
    cat(fun_saveDF(z, kop, DF, j))
    
  }
  return(paste0("Mēnešu tabulas kopsavilkumam ", substr(kops[i], 3, 4), " gatavas.\n"))
}
