#!/bin/bash
check(){
    if [ -e "$1" ] 
    then
        return 0
    fi
    return 1
}

copiar(){
    echo "Escriba el nombre del fichero a copiar:"
    read desde
    if check $desde 
    then
        echo "Escriba el nombre para la copia"
        read hasta
        confirma="S"
        if check $hasta 
        then 
            echo "Ya existe $hasta, desea sobreescribirlo? (S/N)"
            read confirma
        fi
        if [ $confirma = "S" -o $confirma = "s" ]
        then
            echo "Haciendo la copia de $desde a $hasta"
            cp $desde $hasta
        fi
    else
        echo "el fichero $desde no existe"
    fi
}


editar(){
    echo "Escriba el nombre del fichero a editar:"
    read desde
    if check $desde 
    then
        vi $desde
    else
        echo "el fichero $desde no existe"
    fi
}

mostrar(){
    echo "Escriba el nombre del fichero a mostrar:"
    read desde
    if check $desde 
    then
        echo
        cat $desde
    else
        echo "el fichero $desde no existe"
    fi
}

ciclo(){
    until [ $comando -eq 5 ]
    do
        clear
        echo "Elija un comando:"  
        echo "1.- listar el directorio actual"
        echo "2.- copiar archivos"
        echo "3.- Editar un archivo"
        echo "4.- Mostrar un archivo"
        echo "5.- Salir de este controlador"
        read comando
        case $comando 
        in
            1) ls;;
            2) copiar;;
            3) editar;;
            4) mostrar;;
            5) echo "Gracias y hasta la vista";;
            *) echo "$comando no es una opcion valida";;
        esac
        if [ $comando -ne 5 ]
        then
            echo
            echo "OK <enter>"
            read lucas
        fi
    done
}

ciclo
