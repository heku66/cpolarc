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
COPY go.sh .
# 复制外部脚本到工作目录
# COPY cpolarc .

RUN set -ex \
    && chmod +x /cpolarc/cpolar \
    && chmod +x /cpolarc/go.sh

# EXPOSE 80
# RUN chmod +x chfs
CMD ["./cpolar start-all","-config=/cpolarc/cpolar.yml"]
