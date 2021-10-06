FROM quay.io/hdc-workflows/ubuntu:20.04
LABEL MAINTAINER=sminot@fredhutch.org

# Install
#  - Python
#  - HDF5
#  - pandas
#  - requests
#  - numpy
#  - scipy
#  - statsmodels
#  - tables
#  - h5py
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && \
	apt install -y build-essential hdf5-tools libhdf5-dev libhdf5-serial-dev && \
	apt install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev wget libbz2-dev && \
	apt install -y python3 python3-pip tcl


ADD requirements.txt /usr/local/
RUN pip3 install pandas requests numpy h5py && \
	pip3 install -r /usr/local/requirements.txt && \
    HDF5_DIR=/usr/lib/x86_64-linux-gnu/hdf5/serial/ pip3 install tables
