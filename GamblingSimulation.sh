#! /bin/bash
echo "===========Gambling simulation Problem==========="
startAmount=100;
betAmount=1;
function gameCheck(){
	if [ $(($RANDOM%2)) -eq 1 ]
	then
		echo "won the game."
		startAmount=$(($startAmount+$betAmount));
		echo "Total amount : $startAmount "
	else
		echo "lose the game."
		startAmount=$(($startAmount-$betAmount));
		echo "Total amount : $startAmount "
	fi
}
gameCheck
