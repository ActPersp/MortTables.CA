setClass(Class = "Mort.CIA9704", contains = "Table.SU")

setMethod(
   f = "LookUp",
   signature (tbl = "Mort.CIA9704", lookUpKey = "list"),
   definition = function(tbl, lookUpKey) {
      stopifnot(HasValue(lookUpKey$IssAge))
      if (lookUpKey$IssAge < Rgogo::GetMinSelAge(tbl)) {
         tbl <- eval(expr = parse(text = substr(GetId(tbl), 1, nchar(GetId(tbl)) - 1)))
         return(LookUp(tbl, lookUpKey))
      } else {
         callNextMethod()
      }
   }
)

setMethod(
   f = "LookUp",
   signature (tbl = "Mort.CIA9704", lookUpKey = "Cov"),
   definition = function(tbl, lookUpKey, len = NA_integer_) {
      if (GetIssAge(lookUpKey) < Rgogo::GetMinSelAge(tbl)) {
         tbl <- eval(expr = parse(text = substr(GetId(tbl), 1, nchar(GetId(tbl)) - 1)))
         return(LookUp(tbl, lookUpKey, len))
      } else {
         callNextMethod()
      }
   }
)
