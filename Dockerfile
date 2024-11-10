# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /root
# 安装 wget 和 unzip 工具
# RUN apk --no-cache add wget unzip
mkdir ./cpolarc

WORKDIR /root/cpolarc
COPY cpolar .
COPY cpolay.yml .
# 复制外部脚本到工作目录
# COPY cpolarc .

RUN chmod +x cpolar

EXPOSE 80
# RUN chmod +x chfs
CMD ["./cpolar start-all","-config=./cpolar.yml"]
