#! /bin/bash
echo "===========Gambling simulation Problem==========="
startAmount=100;
betAmount=1;
declare -a winningDays;
declare -a lossingDays;
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
totalAmount=100;
function gameUnderCondition(){
for (( day=1; day<=20; day++ ))
do
	echo "day $day the person start with $startAmount"
	while [ $count -gt 0 ]
	do
		gameCheck;
		if [[ $totalAmount -eq 0 ]]
		then
         echo "the Person lost all the money and he quit the game"
			exit;
		elif [[ $totalAmount -eq $(($startAmount/2)) ]]
		then
			echo "day $day	total amount : $totalAmount"
			lossingDays[$day]=$day;
			break;
		elif [[ $totalAmount -eq $(($startAmount+$(($startAmount/2)))) ]]
		then
			echo "day $day	total amount : $totalAmount"
			winningDays[$day]=$day;
			break;
		fi
		((count++))
	done
	startAmount=$totalAmount;
done
}
gameUnderCondition
echo "list of winning days ${winningDays[@]}"
echo "list of loosing days ${lossingDays[@]}"


