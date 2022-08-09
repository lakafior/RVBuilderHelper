# RVBuilderHelper
Helper script to update ReVanced apk

# What it does
1. Checking installed packages and install if needed
2. Checking termux-storage and setup if needed
3. Download latest builder
4. Keep keyrings if there was already previous builder, to make update exsiting app possible

# How to run
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
