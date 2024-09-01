confidentialitiesDF <- function(k) {
  
  #1 Izveido konfidencialitātes tabulu, kas pēc savienošanas veidos atribūtu.
  k <- x[x$NTABL == "21s",]
  
  #2 Izņem dubultniekus, ja tādi ir.
  k <- k[k$NOZ2 == unique(k$NOZ2), ]
  
  #3 Sekojošais kods veic pārbaudes un izveido konfidencionalitātes tabulu k_fm pievienošanai.
  #3.1 Pārbauda, vai datnē norādītais gads sakrīt ar gadu, par kuru tiek būvēta šī tabula.
  #    Tad, nolasot atribūta datuma daļu, atrod mēnesi un aili, 
  #    no kuras vērtības tiks izmantotas konfidencialitātes noteikšanai.
  if(unique(substr(k$DAT, 3, 4)) == substr(year, 3, 4)) {
    aileConf <- 
      switch(
        unique(substr(k$DAT, 1, 2)),
        "03" = paste0("G", unique(substr(k$DAT, 2, 2))),
        "06" = paste0("G", unique(substr(k$DAT, 2, 2))),
        "09" = paste0("G", unique(substr(k$DAT, 2, 2))),
        "12" = paste0("G", unique(substr(k$DAT, 1, 2))),
      )
  } else {
    print("Gadi tabulās nesakrīt.")
  }
  
  #3.2 Datu rāmis ar vērtībām konfidencialitātes aprēķiniem. 
  k_fm <- k[ , c("NOZ2", aileConf)] #k_fm: konfidencialitātes for merge
  k_fm[ ,aileConf] <- as.integer(round(k_fm[ , aileConf], 0))
  colnames(k_fm)[colnames(k_fm) == aileConf] <- "Confidential"
  
  #4 Konfidencialitātes ailē izveido agregātu B-E, kas nes pakārtoto N vērtību summu.
  if(sum(k_fm$NOZ2 %in% 'B-E') == 0) {
    vertibaBE <- k_fm$Confidential[k_fm$NOZ2 == "B"] + k_fm$Confidential[k_fm$NOZ2 == "C"] + k_fm$Confidential[k_fm$NOZ2 == "D"] + k_fm$Confidential[k_fm$NOZ2 == "E"]
    k_fm <- rbind(k_fm, c('B-E', vertibaBE))
    rm(vertibaBE)
  }
  
  rownames(k_fm) <- NULL
  rm(k, aileConf)
  
  return(k_fm)
}
