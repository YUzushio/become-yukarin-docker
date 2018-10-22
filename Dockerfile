FROM nvidia/cuda:9.0-cudnn7-runtime
MAINTAINER YUzushio byr.wgp.jg.cg.1229+yuzushio@gmail.com
# Excutable at 2018.10.21

RUN apt-get update

# install gcc and g++ for compile cython library.
# install graphiz and libgl1-mesa-dev to draw network png file from dot file.
RUN apt-get install -y curl git unzip imagemagick bzip2 gcc g++ \
     graphviz libgl1-mesa-dev

# install pyenv
RUN git clone git://github.com/yyuu/pyenv.git .pyenv

WORKDIR /
ENV HOME  /

# install pyenv plugin to update itself
ENV PYENV_ROOT /.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN git clone git://github.com/yyuu/pyenv-update.git ~/.pyenv/plugins/pyenv-update

# update pyenv
RUN pyenv update

# install anaconda
RUN pyenv install anaconda3-5.1.0
RUN pyenv global anaconda3-5.1.0
RUN pyenv rehash

# update anaconda
RUN conda update -n base conda
RUN conda update --all

# install some packages
RUN conda install keras-gpu
RUN pip install tensorflow cupy-cuda90
RUN conda install chainer
RUN pip install chainerui librosa pysptk pyworld fastdtw

# install WORLD4py from git and run wheel
RUN git clone https://github.com/yamachu/WORLD4py.git
WORKDIR /WORLD4py
RUN python setup.py install

# install old versions numpy-cuda library from external repository.
# (This should be change to other official repositoory)
WORKDIR /
RUN git clone https://github.com/ptillet/isaac.git
WORKDIR isaac/python
RUN python setup.py build
RUN python setup.py install
RUN cp -rf /isaac/include/isaac/external/CUDA/ /usr/local/cuda/include/

# set cuda library env
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64:/usr/local/nvidia/lib64:/usr/lib/x86_64-linux-gnu:/usr/local/nvidia/lib


WORKDIR /
CMD ["/bin/bash"]
