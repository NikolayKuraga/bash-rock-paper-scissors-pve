#!/bin/bash

lp2=1
while [ $lp2 -eq 1 ]
do
    # Skynet makes choice
    SN_ch=$(expr $RANDOM % 3)
    if   [ $SN_ch -eq 0 ]; then
        SN_ch="rock"
    elif [ $SN_ch -eq 1 ]; then
        SN_ch="paper"
    elif [ $SN_ch -eq 2 ]; then
        SN_ch="scissors"
    fi
    echo -e "Skynet:\n -- Make a chice, human: rock, paper, scissors"

    # user makes choice
    lp1=1
    while [ $lp1 -eq 1 ]
    do
        echo -n "        Your choice: "
        read UR_ch
        lp1=0
        if   [ $UR_ch = 1 ] || [ $UR_ch = rock ]     || [ $UR_ch = r ] ||
                 [ $UR_ch = камень ]  || [ $UR_ch = к ]
        then
            UR_ch=rock
        elif [ $UR_ch = 2 ] || [ $UR_ch = paper ]    || [ $UR_ch = p ] ||
                 [ $UR_ch = бумага ]  || [ $UR_ch = б ]
        then
            UR_ch=paper
        elif [ $UR_ch = 3 ] || [ $UR_ch = scissors ] || [ $UR_ch = s ] ||
                 [ $UR_ch = ножницы ] || [ $UR_ch = н ]
        then
            UR_ch=scissors
        elif [ $UR_ch = otpustite ]
        then
            echo -e "\n        Goodbye!\n"
            lp2=0
            break
        else
            echo -e "\nWrong choice, enter smth else (or enter \"otpustite\" to end game)"
            lp1=1
        fi
    done

    if [ $lp2 -eq 0 ]; then
        break
    fi

# compare and show results
    echo -e "\n  "$UR_ch" (your) vs "$SN_ch" (Skynet's)"
    echo -n "    "
    if   [ $SN_ch = $UR_ch ]; then
        echo "That's a draw! So, friendship wins!"
    elif [[ $SN_ch = rock  &&  $UR_ch = scissors ]] ||
             [[ $SN_ch = scissors &&  $UR_ch = paper ]] ||
             [[ $SN_ch = paper && $UR_ch = rock ]]
    then
        echo "Skynet wins!"
    elif [[ $UR_ch = rock && $SN_ch = scissors ]] ||
             [[ $UR_ch = scissors && $SN_ch = paper ]] ||
             [[ $UR_ch = paper && $SN_ch = rock ]]
    then
        echo "You win!"
    fi

    echo -ne "        \"Enter\" to continue"
    read temp
    echo
done
