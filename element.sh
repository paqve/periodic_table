#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else 
#echo -e"The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
  if [[ $1 =~ [0-9]+ ]] 
  then 
  GET_DATA=$($PSQL "SELECT * FROM properties full join elements using(atomic_number) WHERE atomic_number=$1 ")
  else
  GET_DATA=$($PSQL "SELECT * FROM properties full join elements using(atomic_number) WHERE  symbol='$1' or name='$1' ")
  fi


fi