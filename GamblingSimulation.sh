#! /bin/bash
echo "===========Gambling simulation Problem==========="
START_AMOUNT=100;
BET_AMOUNT=1;

function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		totalAmount=$(($totalAmount+$BET_AMOUNT));
	else
		totalAmount=$(($totalAmount-$BET_AMOUNT));
	fi
}

COUNT=1;
AMOUNT=0;
NUM_OF_DAYS=20
function gameUnderCondition(){
	for (( day=0; day<NUM_OF_DAYS; day++ ))
	do
		totalAmount=$START_AMOUNT;
		while [ $COUNT -gt 0 ]
		do
			gameCheck;
			if [[ $totalAmount -eq $(($START_AMOUNT/2)) || $totalAmount -eq $(($START_AMOUNT+$(($START_AMOUNT/2)))) ]]
			then
				echo "total amount per day : $totalAmount"
				AMOUNT=$(($AMOUNT+$totalAmount));
				break;
			fi
			((COUNT++))
		done
	done
	if [ $AMOUNT -ge $(($START_AMOUNT*$day)) ]
	then
		echo "won the game"
	else
		echo "lost the game"
	fi
		echo "total amount for 20 days : $AMOUNT"
}
gameUnderCondition
