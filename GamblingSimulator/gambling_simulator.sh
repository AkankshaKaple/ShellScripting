echo "Welcome to my gambling simulator"

STAKE=100
BET=1
LOSS=0
AMOUNT_BET=1
amountLeft=$STAKE
Won=1
MAX_AMOUNT=$(( ($STAKE*50)/100 ))
MIN_AMOUNT=-$MAX_AMOUNT
NUMBER_OF_DAYS=20

function makeBet() {
	betStatus=$((RANDOM%2))
	if [ $Won -eq $betStatus ]
	then
		echo $AMOUNT_BET
	else
		echo -$AMOUNT_BET
	fi
}


function updateAmount() {
	betAmount="$( makeBet )"
	amountLeft=$((  $amountLeft + $betAmount ))
	echo $amountLeft
}


function dailyBetting() {
	if [ $MAX_AMOUNT -eq $amountLeft -o $MIN_AMOUNT -eq $amountLeft ]
	then
		echo "Quit the game"
	else
		updateAmount
	fi
}


function bettingTwentyDays() {
	x=$NUMBER_OF_DAYS
	while [ $x -gt 0 ]
   do
      dailyBetting
		x=$(($x-1))
   done
}

function monthlyBetting() {
	for (( day=1; day <= $NUMBER_OF_DAYS; day++ ))
	do
   	dailyBetting
		BetResult=$(( $BetResult + $amountLeft ))
		amountLeft=0
	done
	echo $totalBetResult
}

bettingTwentyDays

