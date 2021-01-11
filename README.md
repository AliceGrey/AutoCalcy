# AutoCalcy
Automate renaming pokemon in pokemon go with CalcyIV

Inspired by [pokegeniename](https://github.com/jonyee/pokegeniename)

## Requirements ##

* Linux
* Android device with adb enabled and working
* CalcyIV
* PokemonGO

## How to Use ##

### Warning ###

**This script sends touch events to your phone. If a popup appears, your phone lags, you get a text, etc, it will do unintended things. Please keep an eye on your phone while it is running.**

1. Download the shell script

2. Enable coordinates via adb
```
adb shell content insert --uri content://settings/system --bind name:s:pointer_location --bind value:i:1
```

3. Read through the script and update the coordinates for your phone. 

*If you're feeling generous, open an issue on github with the coordinates for your phone.*

4. Run the shell script and CTRL+C to stop if it starts tapping incorrextly.


