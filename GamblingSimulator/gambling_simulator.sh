echo "Welcome to my gambling simulator"

STAKE=100
BET=1
LOSS=0
AMOUNT_BET=1
amountLeft=$STAKE
Won=1
MAX_AMOUNT=$(( ($STAKE*50)/100 ))
MIN_AMOUNT=-$MAX_AMOUNT

function makeBet() {
	local betStatus=$((RANDOM%2))
	if [ $Won -eq $betStatus ]
	then
		echo $AMOUNT_BET
	else
		echo -$AMOUNT_BET
	fi
}


function updateAmount() {
	local betAmount="$( makeBet )"
	amountLeft=$((  $amountLeft + $betAmount ))
}


function dailyBetting() {
	if [ $MAX_AMOUNT -eq $amountLeft -o $MIN_AMOUNT -eq $amountLeft ]
	then
		echo "Quit the game"
	else
		updateAmount
	fi
}

dailyBetting



