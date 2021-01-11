#!/bin/bash
#Simple shell script that taps the screen to rename pokemon with their IV using the CalcyIV Android App

#Calcy button coordinates
calcy_y=900
calcy_x=990
#Center of the calcy popup dialog coordinates
center_x=540
center_y=1300
#Pokemons name coordinates
name_x=550
name_y=1000
#Android keyboard backspace coordinates
backspace_x=980
backspace_y=1950
#Google keyboard paste coordinates
gboardClip_x=540
gboardClip_y=1520
#Ok button in pokemon go coordinates
pogoOK_x=540
pogoOK_y=1200
#Space below the AR button that moves to the next pokemon
next_x=1010
next_y=680
#Counter - don't change
n=1

#Change 10 to be however many pokemon you want to scan/rename
while [ $n -le 10 ]
do
    echo "Tapping Calcy"
    adb shell input tap $calcy_x $calcy_y
    sleep .5
    
    echo "Dismissing Calcy"
    adb shell input tap $center_x $center_y
    sleep .5

    echo "Tapping Name"
    adb shell input tap $name_x $name_y
    sleep .5

    echo "Holding Backspace"
    adb shell input swipe $backspace_x $backspace_y $backspace_x $backspace_y 1000
    
    echo "Pasting Name"
    adb shell input tap $gboardClip_x $gboardClip_y
    sleep .2

    echo "Closing Keyboard"
    adb shell input tap $pogoOK_x $pogoOK_y
    sleep .2

    echo "Saving Rename"
    adb shell input tap $pogoOK_x $pogoOK_y
    sleep .7

    echo "----Next Pokemon----"
    adb shell input tap $next_x $next_y
    sleep .5

    #Increment counter
    n=$((n+1))
done

