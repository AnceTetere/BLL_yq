fun_DF <- function(x, k_fm, order_vec, kop) {
  
  DF <- c("120", "1722", "1792", "129", "1782", "1802", "1842")
  
  for (j in 1:length(DF)) {
    #1 No kopējās kopsi datnes atlasa tabulu.
    y <- x[x$NTABL == DF[j],]
    
    #2 Atlasa dubultniekus no N
    y <- y[y$NOZ2 == unique(y$NOZ2),]
    
    #3 Savieno tabulu ar konfidencialitātes aprēķiniem
    mergeDF <- merge(y, k_fm, by.x = "NOZ2", by.y = "NOZ2")
    
    #4 Uzreiz sakārto N kodus
    mergeDF <- mergeDF[match(order_vec, mergeDF$NOZ2),]
    rownames(mergeDF) <- NULL
    z <- mergeDF
    
    #5 Pārsauc ailes un izformē
    colnames(z)[colnames(z) == "NOZ2"] <- "Nozares kods"
    
	# Nošķir tabulas, kas dalās mēnešos no tām ,kas dalās ceturkšņos
	if(df %in% c("120", "1722", "1792")) {
      for (m in 1:12) {
        colnames(z)[colnames(z) == paste0("G", m)] <- m
        z <- z[match(order_vec, z$`Nozares kods`), c("Nozares kods",
                                                     "1", "2", "3", "4", "5", "6",
                                                     "7", "8", "9", "10", "11", "12")]
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
                                                  "4. cet. pret 3. cet.")]
      }
    }
    
    #3 Saglabā
    cat(fun_saveDF(z, kop, DF, j))
  }
  rm(x, y, DF, k_fm, order_vec, j, m, q, mergeDF)
  return(paste0("Tabulas kopsi ", substr(kop, 3, 4), " gatavas.\n"))
}
