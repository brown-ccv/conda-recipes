FROM centos:6
LABEL maintainer "Mark Howison <mhowison@brown.edu>"
LABEL repository mhowison
LABEL image conda-build
LABEL tag v3

RUN yum update -y
RUN yum install -y \
  patch \
  sudo \
  tree \
  unzip \
  wget \
  which \
  zip

RUN yum clean all

RUN useradd -m -d /home/conda -s /bin/bash conda
RUN echo "conda ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/conda \
 && chmod 0440 /etc/sudoers.d/conda

USER conda
ENV HOME /home/conda

RUN cd /home/conda \
 && wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
 && bash Miniconda2-latest-Linux-x86_64.sh -b \
 && rm Miniconda2-latest-Linux-x86_64.sh

ENV PATH /home/conda/miniconda2/bin:$PATH

RUN conda install -y conda-build anaconda-client git
RUN conda clean -ay
