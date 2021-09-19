FROM centos:7

USER root

WORKDIR /work

# Install CentOS 7 packages  
RUN yum -y update
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install centos-release-scl

# Install g++ version 7 as version 11 not working for now
RUN yum -y install devtoolset-7-gcc*
SHELL [ "/usr/bin/scl", "enable", "devtoolset-7"]

# Install python 3.8
RUN yum -y install wget make gcc openssl-devel bzip2-devel
RUN cd /tmp/ \
       wget https://www.python.org/ftp/python/3.8.7/Python-3.8.7.tgz \
       tar xzf Python-3.8.7.tgz \
       cd Python-3.8.7 \
       ./configure --enable-optimizations \
       sudo make altinstall \
       sudo ln -sfn /usr/local/bin/python3.8 /usr/bin/python3.8 \
       sudo ln -sfn /usr/local/bin/pip3.8 /usr/bin/pip3.8 \
       python3.8 -V
RUN alias python='/usr/bin/python3.8' \
    alias python3='/usr/bin/python3.8' \
    . ~/.bashrc
 

# Install packages needed for ROOT
RUN yum -y install python3-pip root which python3-root python3-devel
RUN yum -y install root-tmva root-tmva-python root-minuit2 python3-jupyroot

# Install curl
RUN yum -y install curl libcurl libcurl-devel

# Install C++ packages :
RUN yum -y install make boost-devel gsl-devel binutils-devel 
#RUN yum -y install gcc-c++ gcc-gfortran

# Install and setup cmake3 as default version of cmake.
RUN yum -y install cmake3 
RUN ln -sf /usr/bin/cmake3 /usr/bin/cmake

# Install and upgrade some python packages
RUN pip3 install --upgrade wheel
#RUN pip3 install --upgrade jupyter
RUN pip3 install  numpy scipy matplotlib 
RUN pip3 install  jupyterlab
RUN pip3 install  iminuit pandas sympy terminado urllib3 pycurl tables
RUN pip3 install  rootpy rootkernel root-numpy uproot

# Wrap it up.
RUN yum clean all

# Run jupyter when this docker container is started.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root"]


