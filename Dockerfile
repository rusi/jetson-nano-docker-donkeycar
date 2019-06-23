FROM rusi/jetson-nano-tf-keras-pytorch

USER root

## donkey car
RUN pip3 install Adafruit_PCA9685
# RUN pip3 install tornado==4.5.3

RUN git clone https://github.com/autorope/donkeycar /opt/donkeycar
RUN cd /opt/donkeycar \
	&& git checkout master \
	&& pip install -e .[nano] \
	&& chown jetson:jetson -R /opt/donkeycar

USER jetson
