#' Tests that a user can be authenticated
#' 
#' @export
#' @param ... Further args passed to \code{httr::GET} 
#' @examples \donttest{
#' pwt_journals()
#' pwt_journals(config=verbose())
#' }
pwt_journals <- function(...){
  tmp <- pwt_GET(endpt="list_journals", list(), ...)
  meta <- get_meta(tmp)
  jrnls <- xpathSApply(tmp, "//journals")
  out <- do.call(rbind, lapply(jrnls, xmlToDataFrame))
  data.frame(meta, out, stringsAsFactors = FALSE)
}
