#' Add MAKE CLEAN script
#'
#' Adds 95_make_clean.R to R/, and defines directories
#' to be purged. Currently defaults to purging results/
#' and data/.
#'
#' @param delete_folder_list vector of folders whose
#'   contents are to be deleted (recursively).
#' @return adds 95_make_clean.R to R/ if this doesn't
#'   already exist.
#' @import here
#' @export
add_make_clean <- function(delete_folder_list = c("results", "data")){

  if(file.exists(here::here("R", "95_make_clean.R"))){
    cat("R/95_make_clean.R already exists!\n")
  }else{
    file.create(here::here("R", "95_make_clean.R"))
    temp_dir_string <- "dirs_to_clean <- c("
    for(i1 in 1:length(delete_folder_list)){
      if(i1 > 1){
        temp_dir_string <- paste0(temp_dir_string, ", ")
      }
      temp_dir_string <-
        paste0(temp_dir_string, "\"", delete_folder_list[i1], "\"")
    }
    temp_dir_string <- paste0(temp_dir_string, ")")
    writeLines(
      c("library(here)",
        "",
        temp_dir_string,
        "",
        "for(i1 in 1:length(dirs_to_clean)){",
        "  temp_file_list <-",
        "    dir(here::here(dirs_to_clean[i1]), recursive = TRUE)",
        "  file.remove(here::here(dirs_to_clean[i1], temp_file_list))",
        "}"),
      con = here::here("R", "95_make_clean.R")
    )
  }

}
