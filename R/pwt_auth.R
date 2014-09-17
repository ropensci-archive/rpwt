#' Tests that a user can be authenticated
#' 
#' @export
#' @param user Your PWT user name, probably your email address
#' @param key Your PWT api key. 
#' @param ... Further args passed to \code{httr::GET}
#' @examples \donttest{
#' library('httr')
#' user <- "myrmecocystus@@gmail.com"
#' key <- getOption('pwtapikey')
#' pwt_auth(user, key)
#' pwt_auth(user, key, config=verbose())
#' }
pwt_auth <- function(user, key, ...){
  tmp <- pwt_GET(endpt="authenticate", list(username=user, api_key=key), ...)
  toget <- c('requestId','returnCode','authentication_result')
  vals <- t(sapply(toget, function(z) xpathSApply(tmp, sprintf("//%s", z), xmlValue)))
  data.frame(vals, stringsAsFactors = FALSE)
}
