#!/usr/bin/env bash
#
# listaUsuarios.sh - Extrai Usuários do /ect/passwd
#
# Instagram:   @seven.matt
# Autor:       Matheus Mamede
# Manutenção:  Matheus Mamede
#
# ----------------------------------------------------------------------------------------#
# Irá extrair usuários do /etc/passwd, havendo possibilidade de colocar em maiúsculo e em 
#ordem  alfabética.
# 
# Exemplos:
#   $ ./listaUsuarios.sh -s -m
#   Neste exemplo ficará em maiúsculo e em ordem alfabética.
# ----------------------------------------------------------------------------------------#
# Histórico:
#
#   v1.0 10/03/2021, Matheus Mamede:
#       - Início do programa
#       
# ----------------------------------------------------------------------------------------#
# Testado em:
#   bash 4.4.20
# ----------------------------------------------------------------------------------------#

# -------------------------------------- VARIÁVEIS --------------------------------------------------#
CHAVES_DEBUG=0
NIVEL_DEBUG=0
# ----------------------------------------------------------------------------------------#

# -------------------------------------- FUNÇÃO --------------------------------------------------#
Debugar (){
    [ $1 -le $NIVEL_DEBUG ] && echo "Debug $* -----"

}

Soma() {
  local total=0

    for i in $(seq 1 25); do
        Debugar 1 "Entrei no for com o valor: $1"
        total=$(($total+$i))
        Debugar 2 "Depois da soma: $total"
done 

}
# ----------------------------------------------------------------------------------------#

# -------------------------------------- EXECUÇÃO --------------------------------------------------#
case "$1" in
    -d) [ $2 ] && NIVEL_DEBUG=$2  ;;
     *) Soma                      ;;
esac

Soma
# ----------------------------------------------------------------------------------------#
