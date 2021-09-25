#!/bin/bash

lp2=1
while [ $lp2 -eq 1 ]
do
    # Skynet decides will it cheat or not
    SN_ch="cheat"
    if [ $(expr $RANDOM % 100) -gt 16 ]; then
        # Skynet doesn't want to cheat, so it makes a choice
        SN_ch=$(expr $RANDOM % 3)
        if   [ $SN_ch -eq 0 ]; then
            SN_ch="rock"
        elif [ $SN_ch -eq 1 ]; then
            SN_ch="paper"
        elif [ $SN_ch -eq 2 ]; then
            SN_ch="scissors"
        fi
    fi

    echo -e "Skynet:\n -- Make a choice, human: rock, paper, scissors"

    # user makes a choice
    lp1=1
    while [ $lp1 -eq 1 ]
    do
        echo -n "        Your choice: "
        read UR_ch
        lp1=0
        if   [ "$UR_ch" = "" ]; then
            echo -e "\nEnter something!"
            lp1=1
            continue
        elif [ "$UR_ch" = "1" ] || [ "$UR_ch" = "rock" ] ||
                 [ "$UR_ch" = "r" ] || [ "$UR_ch" = "камень" ] ||
                 [ "$UR_ch" = "к" ]
        then
            UR_ch="rock"
        elif [ "$UR_ch" = "2" ] || [ "$UR_ch" = "paper" ] ||
                 [ "$UR_ch" = "p" ] || [ "$UR_ch" = "бумага" ] ||
                 [ "$UR_ch" = "б" ]
        then
            UR_ch="paper"
        elif [ "$UR_ch" = "3" ] || [ "$UR_ch" = "scissors" ] ||
                 [ "$UR_ch" = "s" ] || [ "$UR_ch" = "ножницы" ] ||
                 [ "$UR_ch" = "н" ]
        then
            UR_ch="scissors"
        elif [ "$UR_ch" = "otpustite" ]
        then
            lp2=0
            break
        else
            echo -e "\nWrong choice, enter smth else (or enter \"otpustite\" to end game)"
            lp1=1
        fi
    done

    # if user wants to come back to Bash
    if [ $lp2 -eq 0 ]; then
        break
    fi

    # if Skynet decided to cheat, so it cheats
    SN_ct="fair"
    if [ "$SN_ch" = "cheat" ]; then
        SN_ct="cheat"
        if   [ "$UR_ch" = "rock" ]; then
            SN_ch="paper"
        elif [ "$UR_ch" = "paper" ]; then
            SN_ch="scissors"
        elif [ "$UR_ch" = "scissors" ]; then
            SN_ch="rock"
        fi
    fi

    # compare and show results
    echo -e "\n  "$UR_ch" (your) vs "$SN_ch" (Skynet's)"
    echo -n "    "
    if   [ "$SN_ch" = "$UR_ch" ];
    then
        echo "That's a draw! So, friendship wins!"
    elif [[ "$SN_ch" = "rock"  &&  "$UR_ch" = "scissors" ]] ||
             [[ "$SN_ch" = "scissors" &&  "$UR_ch" = "paper" ]] ||
             [[ "$SN_ch" = "paper" && "$UR_ch" = "rock" ]]
    then
        echo "Skynet wins!"
    elif [[ "$UR_ch" = "rock" && "$SN_ch" = "scissors" ]] ||
             [[ "$UR_ch" = "scissors" && "$SN_ch" = "paper" ]] ||
             [[ "$UR_ch" = "paper" && "$SN_ch" = "rock" ]]
    then
        echo "You win!"
    fi

    # notify user about Skynet playing this round
    if   [ "$SN_ct" = "cheat" ]; then
        echo "        (Skynet cheated)"
    elif [ "$SN_ct" = "fair" ]; then
        echo "        (Skynet played fair enough)"
    fi

    echo -ne "        \"Enter\" to continue"
    read temp
    echo
done

echo -e "\n        Goodbye!\n"
