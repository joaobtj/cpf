
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cpf

O pacote `cpf` traz funções para validar o número do CPF brasileiro.

<!-- badges: start -->
<!-- badges: end -->

## Instalação

Obtenha o pacote no GitHub:

``` r
#install.packages("devtools")
devtools::install_github("joaobtj/cpf")
```

## Exemplo

O número do CPF deve ser fornecido como um string com 11 dígitos.

``` r
library(cpf)
valida_cpf("52998224725")
#> [1] TRUE
```

Retorna TRUE para um número válido.
