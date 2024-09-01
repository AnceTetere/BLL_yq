#1 Palaist funkcijas
source(paste0(base_path, "r-kods/0_internal_code/ADV_functions/palaist_funkcijas.R"))

#2 Sekojošā iterācija ņem pa kps, un izmantojot iekšējo funkcionalitāti, apstrādā datus.
# Kods paziņo, kad tās ir gatavas, un notīra darbavirsmu aiz sevis.

for(i in 1:length(kp)) {

  x <- get(kp[i])
  rm(list = kp[i])

k_fm <- confidentialitiesDF(x)
order_vec <- fun_orderVec(kp[i])
fun_DF(x, k_fm, order_vec, kp[i])

k <- substr(kp[i], 3, 4)
ADV(k, year, Q)

}
