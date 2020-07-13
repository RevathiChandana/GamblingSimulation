#! /bin/bash
echo "===========Gambling simulation Problem==========="
START_AMOUNT=100;
BET_AMOUNT=1;
declare -a winningDays;
declare -a lossingDays;
function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		totalAmount=$(($totalAmount+$BET_AMOUNT));
	else
		totalAmount=$(($totalAmount-$BET_AMOUNT));
	fi
}

COUNT=1;
function gameUnderCondition(){
	totalAmount=$START_AMOUNT;
	for (( day=1; day<=20; day++ ))
	do
		while [ $COUNT -gt 0 ]
		do
			gameCheck;
			if [[ $totalAmount -eq 0 ]]
			then
         	echo "the Person lost all the money and he quit the game"
				exit;
			elif [[ $totalAmount -eq $(($START_AMOUNT/2)) ]]
			then
				echo "starts with :$START_AMOUNT - day $day - total amount : $totalAmount"
				lossingDays[$day]=$day;
				break;
			elif [[ $totalAmount -eq $(($START_AMOUNT+$(($START_AMOUNT/2)))) ]]
			then
				echo "starts with :$START_AMOUNT - day $day - total amount : $totalAmount"
				winningDays[$day]=$day;
				break;
			fi
			((COUNT++))
		done
		START_AMOUNT=$totalAmount;
	done
}
gameUnderCondition
echo "list of winning days ${winningDays[@]}"
echo "list of loosing days ${lossingDays[@]}"

