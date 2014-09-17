#' Tests that a user can be authenticated
#' 
#' @export
#' @param journal Journal abbreviation, see \code{pwt_journals} for options.
#' @param ... Further args passed to \code{httr::GET}
#' @examples
#' pwt_article_types()
#' pwt_article_types(config=verbose())
pwt_article_types <- function(journal='bdj', ...){
  tmp <- pwt_GET(endpt="list_journal_papertypes", list(journal_name=journal), ...)
  meta <- get_meta(tmp)
  res <- xpathSApply(tmp, "//papertypes")
  out <- do.call(rbind, lapply(res, xmlToDataFrame, stringsAsFactors=FALSE))
  cbind(meta, out, stringsAsFactors = FALSE)
}
