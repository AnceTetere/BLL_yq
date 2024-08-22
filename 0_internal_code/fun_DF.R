fun_DF <- function(x, DF, j, k_fm) {
  
  #1 No kopējās kopss atlasa tabulu, kas dalās mēnešos.
  y <- x[x$NTABL == DF[j],]
  
  #2 Atlasa dubultniekus no N
  y <- y[y$NOZ2 == unique(y$NOZ2),]
  
  #3 Savieno tabulu ar konfidencialitātes tabulu
  mergeDF <- merge(y, k_fm, by.x = "NOZ2", by.y = "NOZ2")
  
  #4 Uzreiz sakārto N kodus
  if (kops[i] == "k001") {
    order_vec <- readRDS(paste0(base_path, "r-kods//0_internal_code//templates_and_vectors//k001n_order.rds"))
  } else {
    order_vec <- readRDS(paste0(base_path, "r-kods//0_internal_code//templates_and_vectors//n_order_general.rds"))
  }
  
  mergeDF <- mergeDF[match(order_vec, mergeDF$NOZ2),]
  rownames(mergeDF) <- NULL
  z <- mergeDF
  rm(mergeDF, k_fm, y, DF, j, order_vec)
  
  return(z)
  }
