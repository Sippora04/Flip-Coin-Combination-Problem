#!/bin/bash -x
echo "Welcome to Flip Coin Combination Problem"

declare -A Dict

function FlipCoinFunction()
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
   perCal ${!Dict[@]}
}

function perCal()
{
   var=${@}
   echo "Winner is "
   for key in $var
    do
      var1=${Dict[$key]}
      echo "$key    $(( ($var1 * 100 ) / $flip ))%"
    done | sort -k2 -nr | head -1
}
read -p "Enter for : 1.Singlet 2.Doublet 3.Triplet " coin
read -p "Enter How Many Times to Flip " flip

case $coin in
1) FlipCoinFunction 1 $flip   ;;
2) FlipCoinFunction 2 $flip   ;;
3) FlipCoinFunction 3 $flip   ;;
*) echo "Incorrect Option"    ;;
esac

