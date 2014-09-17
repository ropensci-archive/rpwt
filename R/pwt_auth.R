#' Tests that a user can be authenticated
#' 
#' @examples
#' library('httr')
#' user <- "myrmecocystus@@gmail.com"
#' key <- getOption('pwtapikey')
#' pwt_auth(user, key)
#' pwt_auth(user, key, config=verbose())
pwt_auth <- function(user, key, ...){
  tmp <- pwt_GET(endpt="authenticate", list(username=user, api_key=key), ...)
  xpathSApply(tmp, "//requestId", xmlValue)
  toget <- c('requestId','returnCode','authentication_result')
  vals <- t(sapply(toget, function(z) xpathSApply(tmp, sprintf("//%s", z), xmlValue)))
  data.frame(vals, stringsAsFactors = FALSE)
}
