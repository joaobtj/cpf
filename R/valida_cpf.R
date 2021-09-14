#' Valida CPF
#'
#' Retorna "TRUE" para um numero de CPF valido
#'
#' @param x String com o numero do CPF com 11 digitos
#' @importFrom magrittr %>%
#' @export
#' @examples
#' valida_cpf("52998224725")
valida_cpf <- function(x = "52998224725") {

  # verif1: o resultado da operacao deve ser igual ao primeiro digito verificador
  d1 <-
    x %>%
    stringr::str_sub(10, 10) %>%
    as.numeric()

  verif1 <-
    stringr::str_sub(x, 1, 9) %>%
    stringr::str_split("") %>%
    unlist() %>%
    as.numeric() %>%
    magrittr::multiply_by(10:2) %>%
    sum() %>%
    magrittr::multiply_by(10) %>%
    magrittr::mod(11) %>%
    {
      if (magrittr::equals(., 10)) magrittr::subtract(., 10) else .
    } %>%
    magrittr::equals(d1)

  # verif2: o resultado da operacao deve ser igual ao segundo digito verificador
  d2 <-
    x %>%
    stringr::str_sub(11, 11) %>%
    as.numeric()

  verif2 <- stringr::str_sub(x, 1, 10) %>%
    stringr::str_split("") %>%
    unlist() %>%
    as.numeric() %>%
    magrittr::multiply_by(11:2) %>%
    sum() %>%
    magrittr::multiply_by(10) %>%
    magrittr::mod(11) %>%
    {
      if (magrittr::equals(., 10)) magrittr::subtract(., 10) else .
    } %>%
    magrittr::equals(d2)

  return(all(verif1, verif2))
}
