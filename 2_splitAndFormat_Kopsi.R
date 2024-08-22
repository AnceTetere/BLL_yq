#Sadali datni pa sektoriem .
#Sektoru N komplekti atšķiras.

#setwd(path)
#load(paste0("1_SMUD\\", tab_name, ".RData"))

#1 Sadala kopss
x <- get(tab_name)
rm(list = tab_name)

x$SV <- as.factor(x$SV)
levels(x$SV)

x_split <- split(x, x$SV)
names(x_split) <- paste0("k", names(x_split))
kops <- readRDS(paste0(base_path, "r-kods\\templates_and_vectors\\kops_vec.rds"))

list2env(x_split, envir = .GlobalEnv)
rm(x_split, x)

#2 Saglabā orģinālo dalījumu pie SMUD datiem
kDir <- paste0(base_path, year, "Q", Q, "\\1_SMUD\\kopss\\")
if(!dir.exists(kDir)) {dir.create(kDir)}
for(i in 1:length(kops)) {
  save(list = kops[i], file = paste0(kDir, tab_name, "_", kops[i], ".RData"))
}

#3 Izformē katrā kopsā N komplektu un saglabā izformētos kopss starptabulās.

if(!dir.exists("1_starptabulas")) {dir.create("1_starptabulas")}
if(!dir.exists("1_starptabulas\\kopsi")) {dir.create("1_starptabulas\\kopsi")}

for (i in 1:length(kops)) {
  x <- get(kops[i])
  
  if (kops[i] == "k001"){
    nace15 <- c("TOTAL", "A", "B", "C", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18", "C19", "C20", "C21", "C22", "C23", "C24", "C25", "C26", "C27", "C28", "C29", "C30", "C31", "C32", "C33", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S")
  } else {
      nace15 <- c("TOTAL", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S")
      }
  
  x <- rbind(x[x$NNACE == "15" & x$NOZ2 %in% nace15,], 
             x[x$NNACE == "3" & x$NOZ2 == "B-E",])
  
  x <- x[ , !(colnames(x) %in% c("SV", "NNACE"))] 
  
  assign(kops[i], x)
  save(list = kops[i], file = paste0("1_starptabulas\\kopsi\\", tab_name, "_", kops[i], ".RData"))
  rm(x, list = kops[i])
}
rm(i, nace15)
