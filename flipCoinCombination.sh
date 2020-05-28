echo "Welcome Flip Coin Combination Problem"

echo "Enter a number how many time to flip"
read number
declare -A Singlet

echo "----SingletCombination-----"

Singlet[Heads]=0;
Singlet[Tails]=0;

for (( i=0; i<$number; i++ ))

do
        random=$(( $RANDOM%2 ))
        if [ $random -eq 1 ]
        then
                 Singlet[Heads]=$(((${Singlet[Heads]})+1));
        else
                 Singlet[Tails]=$(((${Singlet[Tails]})+1));
        fi
done

count=1;
for key in ${!Singlet[@]}
do
        Singlet[$key]=$(( (${Singlet[$key]} * 100) / $number));
        arr[count++]=${Singlet[$key]}
        echo $key:${Singlet[$key]}
done
for (( i = 1; i < 3 ; i++ ))
do
   for (( j = $i; j < 3; j++ ))
   	do
      	if [ ${arr[$i]} -gt ${arr[$j]} ]
	 			then
           		temp=${arr[$i]}
           		arr[$i]=${arr[$j]}
           		arr[$j]=$temp
     		fi
   	done
done

echo ${arr[@]}

max=${arr[2]}

for key in ${!Singlet[@]}
	do
		if [ ${Singlet[$key]} -eq $max ]
			then
				echo "Winner is $key : ${Singlet[$key]} %"
				break
		fi
	done


echo "----DoubletCombination----"

declare -A Doublet

Doublet[HH]=0;
Doublet[TH]=0
Doublet[HT]=0;
Doublet[TT]=0;

for (( i=0; i<$number; i++ ))
do
        random=$(( $RANDOM%4 ))
        if [ $random -eq 0 ]
        	then
         	Doublet[HH]=$(((${Doublet[HH]})+1));
        		elif [ $random -eq 1 ]
        			then
               	 Doublet[HT]=$(((${Doublet[HT]})+1));
        					elif [ $random -eq 2 ]
        						then
                				Doublet[TH]=$(((${Doublet[TH]})+1));
        							else
                 					Doublet[TT]=$(((${Doublet[TT]})+1));
        	fi
done

count=1;
for key in ${!Doublet[@]}
do
        Doublet[$key]=$(( (${Doublet[$key]} * 100) / $number));
        arr[count++]=${Doublet[$key]}
        echo "$key:${Doublet[$key]}"
done

for (( i = 1; i < 5 ; i++ ))
	do
   	for (( j = $i; j < 5; j++ ))
   		do
      		if [ ${arr[$i]} -gt ${arr[$j]} ]
				 then
           		temp=${arr[$i]}
           		arr[$i]=${arr[$j]}
           		arr[$j]=$temp
     			fi
   	done
done

echo ${arr[@]}
max=${arr[4]}

for key in ${!Doublet[@]}
	do
		if [ ${Doublet[$key]} -eq $max ]
			then
				echo "Winner is $key : ${Doublet[$key]} %"
				break
		fi
done
