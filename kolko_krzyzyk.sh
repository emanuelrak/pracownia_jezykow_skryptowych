#!/bin/bash

PLANSZA=("*" "*" "*" "*" "*" "*" "*" "*" "*")
KONIEC=0

function wyswietl_plansze {
	clear
	echo "   1 2 3"
	echo "A  ${PLANSZA[0]} ${PLANSZA[1]} ${PLANSZA[2]}"
	echo "B  ${PLANSZA[3]} ${PLANSZA[4]} ${PLANSZA[5]}"
	echo "C  ${PLANSZA[6]} ${PLANSZA[7]} ${PLANSZA[8]}"
}

function wybor {
	echo "Kolumna:"
	read COL
	echo "Wiersz:"
	read ROW
	
	if [ $ROW == "A" ]
	then
	COL=$COL-1
	fi
	
	if [ $ROW == "B" ]
	then
	COL=$COL+2
	fi

	if [ $ROW == "C" ]
	then
	COL=$COL+5
	fi
	
	
	if [ $GRACZ == "X" ]
	then
	PLANSZA[$COL]="X"
	else
	PLANSZA[$COL]="O"
	fi
}

function gracz {
	echo "Wybierz czym grasz [O lub X]"
	read GRACZ
	if [ $GRACZ == "X" ]
	then
	GRACZ_AI="O"
	else
	GRACZ_AI="X"
	fi
}

function komputer {
	AI=0
	while [ ${PLANSZA[AI]} == $GRACZ ] || [ ${PLANSZA[AI]} == $GRACZ_AI ]
	do
	AI=$((0+$RANDOM % 8))
	done
	
	PLANSZA[$AI]=$GRACZ_AI
}

function sprawdz1 {
  sprawdz2 0 1 2
  sprawdz2 3 4 5
  sprawdz2 6 7 8
  sprawdz2 0 3 6
  sprawdz2 1 4 7
  sprawdz2 2 5 8
  sprawdz2 0 4 8
  sprawdz2 2 4 6
}

function sprawdz2() {
 if [ "${PLANSZA[$1]}" != "*" ] && [ "${PLANSZA[$1]}" == "${PLANSZA[$2]}" ] && [ "${PLANSZA[$2]}" == "${PLANSZA[$3]}" ]
 then
 KONIEC=1
 echo "Wygrał ${PLANSZA[$1]}"
 fi
}

gracz
while [ $KONIEC == 0 ]
do
wyswietl_plansze
wybor
wyswietl_plansze
sprawdz1
komputer
wyswietl_plansze
sprawdz1
done
