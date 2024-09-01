# Izstrādā nT, kas dalās ceturkšņos
quarter_df <- function(x, DF, k_fm, order_vec, kop) {

for (j in 1:length(DF)) {
  #1 Funkcija fnc_DF apstrādā nT un savieno to ar konfidencialitātes aprēķinu vērtībām.
  z <- fnc_DF(x, DF[j], k_fm, order_vec)
  
  #2 Pārsauc agregātus un izformē
  colnames(z)[colnames(z) == "NOZ2"] <- "N kods"
  colnames(z)[colnames(z) == "G5"] <- "No gada sākuma"
  colnames(z)[colnames(z) == "G6"] <- "2. cet. pret 1. cet."
  colnames(z)[colnames(z) == "G7"] <- "3. cet. pret 2. cet."
  colnames(z)[colnames(z) == "G8"] <- "4. cet. pret 3. cet."
  
  for (q in 1:4) {
    colnames(z)[colnames(z) == paste0("G", q)] <- paste0(q, ". ceturksnis")
    #z[z$Confidential < 4 & z$Confidential > 0, paste0(q, ". ceturksnis")] <- "Conf"
  }
  
  #3 Saglabā
  cat(fnc_saveDF(z, kop, DF, j))
  
}
  rm(x, DF, k_fm, order_vec, j, m)
  return(paste0("Ceturkšņa nT kps ", substr(kop, 3, 4), " gatavas.\n"))
}
