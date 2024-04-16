Automating this tutorial
[https://docs.solanalabs.com/cli/install#use-solanas-install-tool](https://docs.solanalabs.com/operations/setup-a-validator)

```js
git clone https://github.com/nikossoftwaredev/solana-rpc-setup.git
```

```js
cd solana-rpc-setup
```

```js
find ../solana-rpc-setup -type f -name "*.sh" -exec chmod +x {} +
```

```js
sudo ./install.sh
```

```js
git fetch && git reset --hard origin/main && find ../solana-rpc-setup -type f -name "*.sh" -exec chmod +x {} +
```

sudo journalctl --vacuum-time=1s
