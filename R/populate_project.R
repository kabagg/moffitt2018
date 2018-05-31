#' Populate R Project with Common Folders
#'
#' Before we begin, we want to make sure the folders
#' we plan to use will be present and consistently
#' named.
#'
#' @param folder_list vector of folder names to create.
#'   Defaults to R/, data/, and results/.
#' @return the folders in folder list should be added
#'   to the working project if these don't already exist.
#' @examples
#' populate_project()
#' @import here
#' @export
populate_project <- function(folder_list = c("R", "data", "results")){
  for(i1 in 1:length(folder_list)){
    if (!dir.exists(here::here(folder_list[i1]))) {
      cat("creating ", folder_list[i1], "/ directory\n")
      dir.create(here::here(folder_list[i1]))
    }
  }
}
