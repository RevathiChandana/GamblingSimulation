#! /bin/bash
echo "===========Gambling simulation Problem==========="
startAmount=100;
betAmount=1;
totalAmount=100;

function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		echo "won the game."
		totalAmount=$(($totalAmount+$betAmount));
		echo "Total amount : $totalAmount "
	else
		echo "lose the game."
		totalAmount=$(($totalAmount-$betAmount));
		echo "Total amount : $totalAmount "
	fi
}

count=1;
function gameUnderCondition(){
	while [ $count -gt 0 ]
	do
		gameCheck;
		if [[ $totalAmount -eq $(($startAmount/2)) || $totalAmount -eq $(($startAmount+$((startAmount/2)))) ]]
		then
			echo "total amount : $totalAmount"
			exit;
		fi
		((count++))
	done
}
gameUnderCondition
