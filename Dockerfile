# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /
# 安装 wget 和 unzip 工具
# RUN apk --no-cache add wget unzip
RUN set -ex mkdir ./cpolarc

WORKDIR /cpolarc
COPY cpolar .
COPY cpolar.yml .
# 复制外部脚本到工作目录
# COPY cpolarc .

RUN set -ex \
    && chmod +x /cpolarc/cpolar

# EXPOSE 80
CMD ["./cpolar","start-all -config=/cpolarc/cpolar.yml"]
