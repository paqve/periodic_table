#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else 
  if [[ $1 =~ [0-9]+ ]] 
  then 
  GET_DATA=$($PSQL "SELECT * FROM properties full join elements using(atomic_number) WHERE atomic_number=$1 ")
  else
  GET_DATA=$($PSQL "SELECT * FROM properties full join elements using(atomic_number) WHERE  symbol='$1' or name='$1' ")
  fi
  echo "$GET_DATA "| while read ATOMIC_NUMBER BAR TYPE BAR ATOMIC_MASS BAR MELTING_P BAR BOILING_P BAR NO BAR SYMBOL BAR NAME
    do
    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_P celsius and a boiling point of $BOILING_P celsius."
    done
fi