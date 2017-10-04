# docker-waves-node

Run a [Waves](https://github.com/wavesplatform/Waves) node within a Docker container.

#### Requirements
- A Linux host
- A [Docker](https://docs.docker.com/engine/installation/) install

#### Quick setup

> _Disclaimer: Make sure to properly protect your wallet and other sensitive data. None of the authors, contributors, administrators, or anyone else connected with this repository, in any way whatsoever, can be responsible for your use of this project._

1. Clone or download the current repository

2. Launch a terminal on the project's folder, and build the Docker image: 
```
docker build -t naei/docker-waves-node .
```

3. Open the [waves.conf](./conf/waves.conf) file and [configure it](https://github.com/wavesplatform/Waves/wiki/Waves-Node-configuration-file) if necessary. However, do not change the files directories or the Docker volumes might not work properly.

4. Run the node within a Docker container:
```
docker run -it \
-p 6863:6863 -p 6869:6869 -p 6886:6886 \
-v <PARENT_FOLDER>/docker-waves-node/data:/root/waves/data \
-v <PARENT_FOLDER>/docker-waves-node/conf:/root/waves/conf \
-v <PARENT_FOLDER>/docker-waves-node/wallet:/root/waves/wallet \
naei/docker-waves-node bash
```
Don't forget to replace the _<PARENT_FOLDER>_ by the path of the foder you cloned your project into.
Once the container launched, if the data didn't exist, the blockchain files will be linked to the **_data_** folder, and your wallet file to the **_wallet_** folder.
