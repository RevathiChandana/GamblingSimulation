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
				echo "day $day	-	start amount : $START_AMOUNT-	50%Lost	-	total amount : $totalAmount"
				lossingDays[$day]=$day;
				break;
			elif [[ $totalAmount -eq $(($START_AMOUNT+$(($START_AMOUNT/2)))) ]]
			then
				echo "day $day	-	start amount : $START_AMOUNT-	50%profit-	total amount : $totalAmount"
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
	echo "list of winning days ${winningDays[@]}"
	echo "list of loosing days ${lossingDays[@]}"
	echo "luckiestday : $LUCKY_DAY and amount : $highAmount"
	echo "unLuckiestDay : $UNLUCKY_DAY and amount :$lowAmount"
}
gameUnderCondition
function toContinue(){
	if [ $totalAmount -ge 100 ]
	then
		echo "won the game"
		echo "he starts with 100 and at end of the month he has $totalAmount"
		read -p "if the person like to continue for next month press 1 or press 0	" ans
		case $ans in
			1)	echo "he want to start again";START_AMOUNT=100;totalAmount=100;
				gameUnderCondition;
				toContinue;;
			0)	exit;;
			*) echo "u have entered wrong "
		esac
	else
		echo "lost the game";
		echo "he starts with 100 and at the end of the month he has $totalAmount ";
	fi
}
toContinue
