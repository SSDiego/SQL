getwd()
setwd("F:/R Projects")
getwd()
dir()

#Teste Script 1

normalrandom <- function() {
      x <- rnorm(100)
      mean(x)
}

# Após criar eu devo copiar e colar no console. Ao fazer isso 
# a função passará a exitir. Ao salvar a função, ou o script
# passo a tera função no meu diretório e posso chamá-la

normalrandomseg <- function(x) {
      x + rnorm(length(x))
}
        
# Com essa segunda função eu devo determinar meu 'x'

# para chamar a função

source("scripttest.R")


# Mais
b <- 1:30
b

# Selecionar o código e apertar ctrl + enter executará o código.


# Fase 2
# types

c <- 1:6
class(c)
as.numeric(c)
as.character(c)
as.logical(c)


# Matrizes

m <- matrix(nrow=2, ncol=3)
m

m <- matrix(1:6, nrow=2, ncol=3)
m

# Criando uma matriz dado alguns valores

m <- 1:10
m

dim(m) <- c(2, 5)


# Outra forma

# cbind(x, y)
# rbind(x, y)

# Factors

a <- factor(c("yes", "yes", "no", "yes", "no"))
a
table(a)
unclass(a)

# Outra forma de escrever
a <- factor(c("yes", "yes", "no", "yes", "no"),
        levels = c("yes", "no"))

# Data Frame

d <- data.frame(foo = 1:4, bar = c(T, T, F, F))
d
nrow(d)
ncol(d)

# Os exercícios continuam no livro.











       
