# Starp tabulām ir tādas, kas nes datus par katru mēnesi, un tās, kas nes datus pa ceturkšņiem.
# Sekojošais kods tās nošķir un izformē.

fun_formatDF <- function(z, df, order_vec) {
  
  #1 Pārsauc N aili
  colnames(z)[colnames(z) == "NOZ2"] <- "Nozares kods"
  
  #2 Nošķir tabulas, kas nes vērtības ik mēnesi, no tām, kas tās nes ik ceturksni,
  #  un atbilstoši izformē.
  if(df %in% c("120", "1722", "1792")) {
  for (m in 1:12) {colnames(z)[colnames(z) == paste0("G", m)] <- m}
    z <- z[match(order_vec, z$`Nozares kods`), c("Nozares kods",
                                                 "1", "2", "3", "4", "5", "6",
                                                 "7", "8", "9", "10", "11", "12", "Confidential")]
    rm(m)
} else {
  for (q in 1:4) {
    colnames(z)[colnames(z) == paste0("G", q)] <- paste0(q, ". ceturksnis")
  }
  colnames(z)[colnames(z) == "NOZ2"] <- "Nozares kods"
  colnames(z)[colnames(z) == "G5"] <- "No gada sākuma"
  colnames(z)[colnames(z) == "G6"] <- "2. cet. pret 1. cet."
  colnames(z)[colnames(z) == "G7"] <- "3. cet. pret 2. cet."
  colnames(z)[colnames(z) == "G8"] <- "4. cet. pret 3. cet."
  
  z <-
    z[match(order_vec, z$`Nozares kods`), c("Nozares kods", "1. ceturksnis", "2. ceturksnis", "3. ceturksnis",
                                            "4. ceturksnis", "No gada sākuma", "2. cet. pret 1. cet.", "3. cet. pret 2. cet.", 
                                            "4. cet. pret 3. cet.", "Confidential")]
  rm(q)
}

rm(df, order_vec)
return(z)
}
