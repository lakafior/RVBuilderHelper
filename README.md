# RVBuilderHelper
Helper script to update ReVanced apk

# What it does
1. Checking installed packages and install if needed
2. Checking termux-storage and setup if needed
3. Download latest builder
4. Keep keyrings if there was already previous builder, to make update exsiting app possible


# How to run script 
## Main script let you choose during process if you want to use CLI or GUI version - thanks to [Lucky056](https://github.com/Lucky056)
1. Initial setup:
Run in Termux

```
wget https://raw.githubusercontent.com/lakafior/RVBuilderHelper/main/rev.sh

chmod a+x rev.sh

./rev.sh
```

2. For next run, just type

`
./rev.sh
`

## Only-CLI Version
### If you're always use CLI
1. Initial setup:
Run in Termux

```
wget https://raw.githubusercontent.com/lakafior/RVBuilderHelper/main/rv.sh

chmod a+x rv.sh

./rv.sh
```

2. For next run, just type

`
./rv.sh
`


## Only-GUI Version
### If you always use GUI
1. Initial setup:
Run in Termux

```
wget https://raw.githubusercontent.com/lakafior/RVBuilderHelper/main/rvgui.sh

chmod a+x rvgui.sh

./rvgui.sh
```

2. For next run, just type

`
./rvgui.sh
`
