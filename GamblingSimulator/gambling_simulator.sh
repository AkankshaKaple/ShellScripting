echo "Welcome to my gambling simulator"

STAKE=100
BET=1
LOSS=0
AMOUNT_BET=1
amountLeft=$STAKE
Won=1

function makeBet() {
	local betStatus=$((RANDOM%2))
	if [ $Won -eq $betStatus ]
	then
		echo $AMOUNT_BET
	else
		echo -$AMOUNT_BET
	fi
}


function dailyBet() {
	local betAmount="$( makeBet )"
	amountLeft=$((  $amountLeft + $betAmount ))
}

dailyBet
