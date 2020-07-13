#! /bin/bash
echo "===========Gambling simulation Problem==========="
START_AMOUNT=100;
BET_AMOUNT=1;

function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		echo "won the game."
		totalAmount=$(($totalAmount+$BET_AMOUNT));
		echo "Total amount : $totalAmount "
	else
		echo "lose the game."
		totalAmount=$(($totalAmount-$BET_AMOUNT));
		echo "Total amount : $totalAmount "
	fi
}

count=1;
function gameUnderCondition(){
	total_Amount=$START_AMOUNT;
	while [ $count -gt 0 ]
	do
		gameCheck;
		if [[ $totalAmount -eq $(($START_AMOUNT/2)) || $totalAmount -eq $(($START_AMOUNT+$(($START_AMOUNT/2)))) ]]
		then
			echo "total amount : $totalAmount"
			exit;
		fi
		((count++))
	done
}
gameUnderCondition
