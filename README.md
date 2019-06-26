# Donkeycar in a Docker container on a Jetson Nano

## Pre-req
To run this container on Jetson Nano, you need to install `docker-compose`:
```
$ sudo apt update
$ sudo apt install docker-compose
```

Add yourself to the `docker` group:
```
$ sudo gpasswd -a $USER docker
# or
$ sudo usermod -aG docker $USER
```
and reboot (or logout/login) and test:
```
$ docker ps
```

## Clone the repo
```
$ git clone https://github.com/rusi/jetson-nano-docker-donkeycar.git
```

## Create a Car Application

To create a new `car`:
```
$ docker-compose run --rm jetson donkey createcar --path mycar
```
NOTE: the above command will create a car application in your HOME directory,
which is shared between your docker environment and your host / HOME directory.

## Configure your Car

Edit `myconfig.py`
```
$ nano ~/mycar/myconfig.py
```
for more info: http://docs.donkeycar.com/guide/create_application/

## Calibration
```
$ docker-compose run --rm jetson donkey calibrate --channel <your_steering_channel> --bus=1
$ docker-compose run --rm jetson donkey calibrate --channel <your_throttle_channel> --bus=1
```
for more info: http://docs.donkeycar.com/guide/calibrate/

## Run
```
$ docker-compose run --rm jetson python3 mycar/manage.py drive
```
or
```
$ docker-compose run --rm jetson
jetson@jetson$ cd ~/mycar
jetson@jetson$ python3 manage.py drive
```
