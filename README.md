Automating this tutorial
[https://docs.solanalabs.com/cli/install#use-solanas-install-tool](https://docs.solanalabs.com/operations/setup-a-validator)

## Solana Rpc Installer

### Clone Repo

```js
git clone https://github.com/nikossoftwaredev/solana-rpc-setup.git && cd solana-rpc-setup
```

### Give execution rights

```js
find ../solana-rpc-setup -type f -name "*.sh" -exec chmod +x {} +
```

### Install solana and tune-system

```js
sudo ./install.sh
```

### start validator

```js
sudo ./start.sh
```

### Extra

sudo systemctl daemon-reload
sudo systemctl disable solana-validator.service
sudo systemctl stop solana-validator.service

git fetch && git reset --hard origin/main && find ../solana-rpc-setup -type f -name "\*.sh" -exec chmod +x {} +

sudo journalctl --vacuum-time=20m

sudo journalctl -u solana-validator.service -f
