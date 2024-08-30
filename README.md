# Upgrade Mainnet shido node to v2.0.0

This repository contains a script for upgrading a node on shido blockchain. 

## Installation

Prerequisites:

System Requirements:
    4 or more physical CPU cores.
    At least 200GB disk storage.
    At least 16GB of memory (RAM)
    At least 100mbps network bandwidth.


#### Clone this repo using:
```bash
git clone 'repourl'

```
## Run this script file for upgrade:

open a terminal window and run the following command.This command will create a upgrade version folder inside node directory
[Verify permission of that file]
```bash
./upgrade_shido_node.sh (it's for ubuntu os)
```

**NOTE:** The blockchain syncing is running in a background as a service you can print the logs and check the logs of the node with the following command.
```bash
journalctl -u shido -f (it's for ubuntu)
```


