# Dockerfile for Community 2019 edition (on debian)

FROM debian

ENV PATH=/opt/gnat/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# BOOTSTRAP MINIMAL INSTALLATION
RUN apt-get update && \
    apt-get install -y \
        curl \
        dbus \
        fontconfig \
        git \
        libc-dev \
        libx11-6 \
        libx11-xcb1 \
        make && \
\
    # GNAT INSTALLATION
    curl -sSf http://mirrors.cdn.adacore.com/art/5cdffc5409dcd015aaf82626 \
        --output /tmp/gnat-community-2019-x86_64-linux-bin && \
    git clone https://github.com/AdaCore/gnat_community_install_script && \
    cd gnat_community_install_script && \
    ./install_package.sh /tmp/gnat-community-2019-x86_64-linux-bin /opt/gnat && \
\
    # OTHER TOOLS INSTALLATION
    apt-get install -y \
        bash \
        git \
        mercurial \
        python-pip \ 
        subversion \
        unzip \
        wget && \
    apt-get clean && \
\
    # TESTSUITE INSTALLATION
    pip install e3-testsuite
