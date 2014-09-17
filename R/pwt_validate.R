#' Validate an XML document
#' 
#' @export
#' @param user Your PWT user name, probably your email address
#' @param key Your PWT api key. 
#' @param xml An xml string
#' @param ... Further args passed to \code{httr::GET}
#' @examples \donttest{
#' pwt_validate()
#' pwt_validate(config=verbose())
#' }
pwt_validate <- function(user, key, xml, ...){
#   tmp <- pwt_POST(endpt="validate_document", list(xml=xml), ...)
  message("not ready yet")
#   meta <- get_meta(tmp)
#   res <- xpathSApply(tmp, "//papertypes")
#   out <- do.call(rbind, lapply(res, xmlToDataFrame, stringsAsFactors=FALSE))
#   cbind(meta, out, stringsAsFactors = FALSE)
}
