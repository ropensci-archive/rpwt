#' Wrapper GET function
#' 
#' @importFrom httr GET
#' @importFrom XML xmlParse
#' @param endpt Endpoint to construct URL for.
#' @param args Named list of args passed to \code{query} parameter in \code{httr::GET} call
#' @param ... Further args passed to \code{httr::GET}
pwt_GET <- function(endpt, args, ...){
  endpt <- match.arg(endpt, c('authenticate','list_journals','list_journal_papertypes',
                    'validate_document','import_document'))
  url <- "http://pwt.pensoft.net/api.php"
  tt <- GET(url, query = c(args, action=endpt), ...)
  res <- content(tt, "text")
  XML::xmlParse(res)
}
