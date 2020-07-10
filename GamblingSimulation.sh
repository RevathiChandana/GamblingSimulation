#! /bin/bash
echo "===========Gambling simulation Problem==========="
startAmount=100;
betAmount=1;

function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		#echo "won the game."
		totalAmount=$(($totalAmount+$betAmount));
		#echo "Total amount : $totalAmount "
	else
		#echo "lose the game."
		totalAmount=$(($totalAmount-$betAmount));
		#echo "Total amount : $totalAmount "
	fi
}

count=1;
amount=0;
function gameUnderCondition(){
for (( i=0; i<20; i++ ))
do
	totalAmount=100;
	while [ $count -gt 0 ]
	do
		gameCheck;
		if [[ $totalAmount -eq $(($startAmount/2)) || $totalAmount -eq $(($startAmount+$((startAmount/2)))) ]]
		then
			echo "total amount per day : $totalAmount"
			amount=$(($amount+$totalAmount));
			break;
		fi
		((count++))
	done
done
	echo "total amount for 20 days : $amount"
}
gameUnderCondition
