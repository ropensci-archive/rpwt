#' Tests that a user can be authenticated
#' 
#' @examples
#' library('httr')
#' user <- "myrmecocystus@gmail.com"
#' key <- 'afed2e05c0e27c2935d23f89df8a781b'
#' pwt_auth(user, key)
pwt_auth <- function(user, key, ...){
  pwt_GET(endpt="authenticate", list(username=user, api_key=key), ...)
}
