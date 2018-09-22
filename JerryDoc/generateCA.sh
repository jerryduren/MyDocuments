#!/bin/bash

if [ -z "$1" ]; then   # 第一个参数的长度为零，就是没有带参数
  echo "Usage: ./generateCRT.sh clientName"
  echo "example: ./generateCRT.sh nrf"
  echo "System will generate nrf.key and nrf.crt files"
  exit 1
fi

# 生成CA机构自己的私钥和根证书，这两个是用户向CA机构申请数字证书的输入
if [ ! -f "ca.key" ]; then    # CA的根证书不存在
  openssl genrsa -out ca.key 2048
  openssl req -x509 -new -nodes -key ca.key -subj "/CN=*.localdomain" -days 5000 -out ca.crt
  # openssl x509 -text -in ca.key -noout
fi

# GO语言认证的时候要求证书里面待扩展字段，所以在生成用户的证书时需要增加这个扩展字段
if [ ! -f "client.ext" ]; then
  touch client.ext
  echo extendedKeyUsage=clientAuth>client.ext
fi

# 生成用户的私钥
openssl genrsa -out $1.key 2048
# 生成证书请求，临时文件
openssl req -new -key $1.key -subj "/CN=*.localdomain" -out $1.csr
# 生成用户的数字证书，里面包含了公钥
# openssl x509 -req -in $1.csr -CA ca.crt -CAkey ca.key -CAcreateserial -extfile client.ext -out $1.crt -days 5000
openssl x509 -req -in $1.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out $1.crt -days 5000

# 删除临时文件
if [ -f "$1.csr" ]; then
  rm $1.csr
fi
if [ -f "ca.srl" ]; then
  rm ca.srl
fi
if [ -f "client.ext" ]; then
  rm client.ext
fi

more $1.key
openssl x509 -text -in $1.crt -noout