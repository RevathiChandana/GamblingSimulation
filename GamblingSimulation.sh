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
totalAmount=$START_AMOUNT;
LUCKY_DAY=0;
UNLUCKY_DAY=0;
highAmount=$START_AMOUNT;
lowAmount=$START_AMOUNT;
NUM_OF_DAYS=20;
function gameUnderCondition(){
	for (( day=1; day<=NUM_OF_DAYS; day++ ))
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
			((count++))
		done
		if [ $highAmount -lt $totalAmount ]
		then
			LUCKY_DAY=$day;
			highAmount=$totalAmount;
		elif [ $lowAmount -gt $totalAmount ]
		then
			lowAmount=$totalAmount;
			UNLUCKY_DAY=$day;
		fi
		START_AMOUNT=$totalAmount;
	done
}
gameUnderCondition
echo "list of winning days ${winningDays[@]}"
echo "list of loosing days ${lossingDays[@]}"
echo "luckiestday : $LUCKY_DAY and amount : $highAmount"
echo "unLuckiestDay : $UNLUCKY_DAY and amount :$lowAmount"

