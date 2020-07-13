#! /bin/bash
echo "===========Gambling simulation Problem==========="
START_AMOUNT=100;
BET_AMOUNT=1;
function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		echo "won the game."
		START_AMOUNT=$(($START_AMOUNT+$BET_AMOUNT));
		echo "Total amount : $START_AMOUNT "
	else
		echo "lose the game."
		START_AMOUNT=$(($START_AMOUNT-$BET_AMOUNT));
		echo "Total amount : $START_AMOUNT "
	fi
}
gameCheck
