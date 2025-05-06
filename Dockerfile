FROM jupyter/base-notebook

# 安装 Java 和 Git
USER root
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk git unzip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

USER ${NB_UID}
WORKDIR /home/jovyan

# 安装 IJava 内核
RUN git clone https://github.com/SpencerPark/IJava.git && \
    cd IJava && \
    sed -i 's#https://services.gradle.org/#https://mirrors.cloud.tencent.com/#' gradle/wrapper/gradle-wrapper.properties && \
    ./gradlew installKernel && \
    cd .. && rm -rf IJava

# 默认工作目录挂载 notebooks
WORKDIR /home/jovyan/work
