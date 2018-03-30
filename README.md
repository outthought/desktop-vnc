# Cisco UCSM via VNC

Run process to connect to Cisco UCSM in the datacenter.
This involves javaws (icedtea-web), a VNC server, and the xfce desktop environment.


## Prerequisites

- docker on your laptop.
- Any vnc viewer. (OS X has one named "Screen Share").


## Build

Build from upstream project to set the connection to UCSM to launch https://ucs-sg1.mps.spscommerce.net/ucsm/ucsm.jnlp
```
docker build . --tag ucs
```

## Run

Run on `localhost:5901.`
```
docker run --rm -it -p 5901:5901 -p 6901:6901 ucs
```


## Connect and Login

Connect VNC viewer to `localhost:5901`, or the html 5 vnc client on `http://localhost:6901`. 

At this point, UCSM asks us to agree to every bad security thing it needs.

Connect with your AD credentials.


## Clean Up

`Ctrl-c` on the terminal running docker.


## Issues

### Route Grossness

Docker may choose the bridge network `172.17.0.0/24` when installed. This is not routable on our network. Neither is `192.168.1.0/24`.

Try to create a network as follows and use it, or modify your main network for docker.
```
docker network create my120 --ip-range 192.168.120.0/24 --gateway 192.168.120.1 --subnet 192.168.120.0/24
```
Use network `my120` as follows.
```
docker run --rm -it --network my120 -p 5901:5901 -p 6901:6901 ucs
```
