#!/bin/bash
#Simple shell script that taps the screen to rename pokemon with their IV using the CalcyIV Android App

#-SETTINGS-#
#Set to 1 to enable appraising pokemon
#This is slower but will give a more accurate IV
appraise=1
#Set to 1 if you use autoscan in calcy
#This will skip the calcy button pressing step
autoscan=1

#-COORDINATES-#
#Menu button coordinates - only needed if you want to use appraise
menu_x=940
menu_y=2050
#Appraise button coordinates - only needed if you want to use appraise
appraise_x=935
appraise_y=1650
#Calcy button coordinates - not needed if you use autoscan
calcy_y=900
calcy_x=990
#Center of the calcy popup dialog coordinates
center_x=540
center_y=1350
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

#Counter - don't change this one
n=1


#Change 10 to be however many pokemon you want to scan/rename
while [ $n -le 10 ]
do

    if [ $appraise = 1 ]
    then
    echo "Opening Menu"
    adb shell input tap $menu_x $menu_y
    sleep .5
    
    echo "Tapping Appraise"
    adb shell input tap $appraise_x $appraise_y
    sleep .5
    
    echo "Skipping dialog 1"
    adb shell input tap $center_x $center_y
    sleep .5
    fi
    
    if [ $autoscan = 0 ]
    then
    echo "Tapping Calcy"
    adb shell input tap $calcy_x $calcy_y
    sleep .5
    
    echo "Dismissing Calcy"
    adb shell input tap $center_x $center_y
    sleep .5
    fi
    
    if [ $appraise = 1 ]
    then
    echo "Skipping dialog 2"
    adb shell input tap $center_x $center_y
    sleep 1
    fi
    
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
    sleep 1

    echo "----Next Pokemon----"
    adb shell input tap $next_x $next_y
    sleep 1

    #Increment counter
    n=$((n+1))
done

