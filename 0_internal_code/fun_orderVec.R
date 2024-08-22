fun_orderVec <- function(kops) {

if (kops[i] == "k001") {
    order_vec <- readRDS(paste0(base_path, "r-kods//0_internal_code//templates_and_vectors//k001n_order.rds"))
  } else {
    order_vec <- readRDS(paste0(base_path, "r-kods//0_internal_code//templates_and_vectors//n_order_general.rds"))
  }
  return(order_vec)
} 
