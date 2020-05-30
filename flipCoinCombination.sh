echo "Welcome to Flip Coin Combination Problem"

declare -A Dict

function getFlipCoin()
{
	flip=$2
	coin=$1
	for (( i=0;i<$flip;i++ ))
		do
			combination=""
			for ((j=0;j<$coin;j++))
				do
					random=$((RANDOM%2))
					if (( $random == 0 ))
						then
							combination=$combination"H"
					else
							combination=$combination"T"
					fi
			done
			Dict[$combination]=$((${Dict[$combination]}+1))
			echo $combination : ${Dict[$combination]}
	done
	getWinnerPercentage
}

function getWinnerPercentage()
{
	echo "Winner is "
	for key in ${!Dict[@]}
	do
		var1=${Dict[$key]}
		echo "$key    $(( ($var1 * 100 ) / $numOfFlip ))%"
	done | sort -k2 -nr | head -1
}

function main ()
{
	read -p "Enter for : 1.Singlet 2.Doublet 3.Triplet " numOfCoin
	read -p "Enter How Many Times to Flip " numOfFlip

	case $numOfCoin in
	1)	getFlipCoin	1	$numOfFlip	;;
	2) getFlipCoin	2	$numOfFlip	;;
	3) getFlipCoin	3	$numOfFlip	;;
	*)	echo "Incorrect Option"		;;
	esac
}

main
