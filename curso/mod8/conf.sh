#!/usr/bin/env bash
#
# extrai_titulos.sh - Extrai titulos do blog
#
# Instagram:   @seven.matt
# Autor:       Matheus Mamede
# Manutenção:  Matheus Mamede
#
# ----------------------------------------------------------------------------------------#
# Este programa irá extrair titulos do blog LXER, colocar em um arquivo de texto e ler 
#monstrando cores na tela.
# 
# Exemplos:
#   $ ./extrai_titulos.sh
#   Neste exemplo o programa vai extrair titulos e mostrar na tela.
# ----------------------------------------------------------------------------------------#
# Histórico:
#
#   v1.0 15/03/2021, Matheus Mamede:
#       - Início do programa
#       
# ----------------------------------------------------------------------------------------#
# Testado em:
#   bash 4.4.20
# ----------------------------------------------------------------------------------------#

# -------------------------------------- VARIÁVEIS --------------------------------------------------#
ARQUIVO_DE_CONFIGURACAO="configuracao.cf"
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"
# ----------------------------------------------------------------------------------------#

# -------------------------------------- TESTES -----------------------------------------------------#
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Não temos acesso a leitura" && exit 1

# ----------------------------------------------------------------------------------------#

# -------------------------------------- FUNÇÕES --------------------------------------------------#
DefinirParametros () {
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2)"

    case "$parametro" in
        USAR_CORES)      USAR_CORES="$valor"            ;;
        USAR_MAIUSCULAS) USAR_MAIUSCULAS="$valor"       ;;
    esac
}
# ----------------------------------------------------------------------------------------#

# -------------------------------------- EXECUÇÃO ---------------------------------------------------#
while read -r linha
do 
    [ "$(echo $linha | cut -c1)" = "#" ] && continue
    [ ! "$linha" ] && continue 
    DefinirParametros "$linha"
done < "$ARQUIVO_DE_CONFIGURACAO"

[ "$USAR_MAIUSCOLAS" = 1 ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z])"
[ "$USAR_CORES" = 1 ] && MENSAGEM="$(echo -e ${VERDE} $MENSAGEM)"

echo "$MENSAGEM"
# ----------------------------------------------------------------------------------------#
