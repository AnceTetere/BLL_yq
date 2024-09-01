fnc_DF <- function(x, k_fm, order_vec, kop) {
  
  DF <- c("120", "129", "1722", "1782", "1792", "1802", "1842")
  
  for (j in 1:length(DF)) {
    #1 No kopējās kps datnes atlasa nT, kas dalās mēnešos.
    y <- x[x$nT == DF[j],]
    
    #2 Atlasa dubultniekus no N
    ## (Un nemāžojies - šo nevar izdarīt kps līmenī; tur N kodi katrai nT atkārtojas.)
    y <- y[y$NOZ2 == unique(y$NOZ2),]
    
    #3 Savieno nT ar konfidencialitātes nT
    mergeDF <- merge(y, k_fm, by.x = "NOZ2", by.y = "NOZ2")
    
    #4 Uzreiz sakārto N kodus
    mergeDF <- mergeDF[match(order_vec, mergeDF$NOZ2),]
    rownames(mergeDF) <- NULL
    z <- mergeDF
    
    #5 Pārsauc ailes un izformē
    z <- fnc_formatDF(z, DF[j], order_vec)
    
    #6 Saglabā
    cat(fnc_saveDF(z, kop, DF[j], j))
  }
  rm(x, y, DF, k_fm, order_vec, j, mergeDF)
  return(paste0("nT kpsm ", substr(kop, 3, 4), " gatavas.\n"))
}
