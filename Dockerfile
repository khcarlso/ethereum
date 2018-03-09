### Image Container Ethereum 
### Dockerfile to create Ethereum working environment
### Kevin Carlson, khcarlso@gmail.com

FROM ubuntu

RUN apt-get update \
 && apt-get upgrade \
 && apt-get install -y vim software-properties-common \
 && add-apt-repository -y ppa:ethereum/ethereum \
 && apt-get update \
 && apt-get install -y ethereum \
 && mkdir /ethereum_config 

ADD genesis.json /ethereum_config/genesis.json 
RUN geth --datadir /.ethereum_private init /ethereum_config/genesis.json

# run geth as entrypoint
ENTRYPOINT ["geth", "--fast", "--cache", "512", "--ipcpath", "~/Library/Ethereum/geth.ipc", "--networkid", "1234", "--datadir", "~/.ethereum_private/", "console"]


