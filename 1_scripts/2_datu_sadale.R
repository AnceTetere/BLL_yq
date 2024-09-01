# Sekojošais kods sadala datni pa sektoriem.
# Sektoru N komplekti atšķiras.

#1 Sadala kps
x <- get(tab_name)
rm(list = tab_name)

x$SV <- as.factor(x$SV)
levels(x$SV)

x_split <- split(x, x$SV)
names(x_split) <- paste0("k", names(x_split))
kp <- readRDS(paste0(base_path, "r-kods/0_internal_code/templates_and_vectors/kps_vec.rds"))

list2env(x_split, envir = .GlobalEnv)
rm(x_split, x)

#2 Saglabā orģinālo dalījumu pie SMUD datiem
#kDir <- paste0(base_path, year, "Q", Q, "\\1_SMUD\\kps\\")
#if(!dir.exists(kDir)) {dir.create(kDir)}
#for(i in 1:length(kp)) {
#  save(list = kp[i], file = paste0(kDir, tab_name, "_", kp[i], ".RData"))
#}

#3 Izformē katrā kps N komplektu un saglabā izformētos kpss starptabulu mapē.
#if(!dir.exists("1_starptabulas")) {dir.create("1_starptabulas")}
#if(!dir.exists("1_starptabulas\\kps")) {dir.create("1_starptabulas\\kps")}

for (i in 1:length(kp)) {
  x <- get(kp[i])
  
  if (kp[i] == "k001"){
    n15 <- c("TOTAL", "A", "B", "C", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18", "C19", "C20", "C21", "C22", "C23", "C24", "C25", "C26", "C27", "C28", "C29", "C30", "C31", "C32", "C33", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S")
  } else {
    n15 <- c("TOTAL", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S")
  }
  
  x <- rbind(x[x$NN == "15" & x$NOZARE2 %in% n15,], 
             x[x$NN == "3" & x$NOZARE2 == "B-E",])
  
  x <- x[ , !(colnames(x) %in% c("SV", "NN"))] 
  
  assign(kp[i], x)
#  save(list = kp[i], file = paste0("1_starptabulas\\kps\\", tab_name, "_", kp[i], ".RData"))
#  rm(x, list = kp[i])
}
rm(x, i, n15)
