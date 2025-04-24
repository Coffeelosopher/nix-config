
# Nix Package manager Config and future Flake

## TODO
- [ ] write down ports to README, sort out xavers ports below
- [ ] update user.user.packages with config.userName handling for all users

# Xaver
## Important
- [ ] install script auf github? 
    - [ ] erweitern mit how to flake ?

## Projects
- [ ] NIXOS flakes for machine learning auto1111

## Extentions
- [ ] Script for pupulating the nix store with all system configs of the flake
    - [ ] serve and use own servers as substituter
    - [ ] maybe BB and blu1 ? or OC with cross compiling ? :D

- [ ] Flake Update script on remote server ?
## PORTS

##### XAVER PORTS NOT UP TO DATE ######
# Port List used by Services

## Global 0.0.0.0

22 SSH
9993 Zerotier

## Services GLOBAL LIST

80 nginx
443 nginx
3389 RDP
6666 Nix Serve
8384 syncthing webport
8443 LXD
9000 resilio Web UI
9091 transmission
19999 Netdata
53086 xmrig web access

### Seaweedfs

55000 seaweedfs master
55001-55099 seaweedfs volume
55100-55499 seaweedfs filer

# hub - 49.13.63.62

82 hbms nginx host
3004 hbms hedgedoc
3005 hbms gitea ssh
3006 hbms gitea web
3010 hbms vaultwarden web
3100 hbms matrix
3101 hbms matrix metric
3102 hbms matrix db admin
3103 hbms matrix synapse admin
3104 hbms matrix web element

3478 headscale relay

4000 zerotier-ui

4440 hbms-rundeck

7800 headscale
7808 headscale admin
7810 Authentik :9000

9009 croc-relay
