fun_DF <- function(x, k_fm, order_vec, kop) {
  
  DF <- c("120", "1722", "1792", "129", "1782", "1802", "1842")
  
  for (j in 1:length(DF)) {
    #1 No kopējās kopsavilkuma datnes atlasa tabulu, kas dalās mēnešos.
    y <- x[x$NTABL == DF[j],]
    
    #2 Atlasa dubultniekus no NACE
    y <- y[y$NOZ2 == unique(y$NOZ2),]
    
    #3 Savieno tabulu ar konfidencialitātes tabulu
    mergeDF <- merge(y, k_fm, by.x = "NOZ2", by.y = "NOZ2")
    
    #4 Uzreiz sakārto NACE kodus
    mergeDF <- mergeDF[match(order_vec, mergeDF$NOZ2),]
    rownames(mergeDF) <- NULL
    z <- mergeDF
    
    #5 Pārsauc ailes un izformē
    z <- fun_formatDF(z, DF[j], order_vec)
    
    #6 Saglabā
    cat(fun_saveDF(z, kop, DF, j))
  }
  rm(x, y, DF, k_fm, order_vec, j, m, q, mergeDF)
  return(paste0("Tabulas kopsavilkumam ", substr(kop, 3, 4), " gatavas.\n"))
}
