fnc_orderVec <- function(kps) {

if (kps == "k001") {
  order_vec <- readRDS(paste0(base_path, "r-kods/0_internal_code/templates_and_vectors/k001_n_order.rds"))
} else {
  order_vec <- readRDS(paste0(base_path, "r-kods//0_internal_code//templates_and_vectors//n_order_general.rds"))
}
  return(order_vec)
}
