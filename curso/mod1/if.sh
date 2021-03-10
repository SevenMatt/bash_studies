#!/usr/bin/env bash

VAR    = ""
VAR2   = ""

if [[ "$VAR" = "$VAR2" ]]; then
    echo "São Iguais."
fi

if [[ "$VAR" = "$VAR2" ]]
 then
    echo "São Iguais."
fi

if test "$VAR" = "$VAR2"
then
    echo "São Iguais."
fi

if [ "VAR" = "VAR2" ]
then
    echo "São Iguais."
fi

[ "$VAR" = "$VAR2" ] || echo "São Iguais."