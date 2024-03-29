# Titan

My complete dev environment powered by [SaltStack](https://docs.saltstack.com/en/latest/contents.html). SaltStack is a very powerful configuration management tool similar to Ansible or Chef. This project came after several iterations of managing my dotfiles. Initially I was able to get by with just doing basic symlinking of folders. Over time though, I had more and more dependencies that became more complex to manage and install. The goal is to be able to provision a new machine with a few commands. Titan is my answer to this problem!

> Fair warning these dotfiles are optimized for me so make sure if you run any of these commands you are ready to accept the risk of losing your setup on your machine. You are probably better off just copying the actual config from any of my tools instead of running SaltStack commands listed here.

![Desktop](./desktop.png)

## Setup

Install dependencies

* git
* salt stack
* paru aur helper

Clone the repo to the proper place on file system. Salt stack sets up a local fileserver that will pull files from this location.

```bash
git clone https://github.com/skbolton/titan /srv/titan
```

## Running

Drop the `titan.conf` file in this repo into the `/etc/salt/minion.d/` directory to configure the minion.

Get just the nvim state
```bash
sudo salt-call state.sls nvim
```

To apply what salt stack calls the highstate (all the states).
```bash
sudo salt-call state.apply
```

