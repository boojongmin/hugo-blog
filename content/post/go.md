---
title: "Go lang"
date: 2019-09-27T08:50:35+09:00
draft: true
---

# go란

# go 설치
[Getting Started](https://golang.org/doc/install)
[go Downloads](https://golang.org/dl/)
[linux go 1.13](https://dl.google.com/go/go1.13.linux-amd64.tar.gz)

```
$ wget https://dl.google.com/go/go1.13.linux-amd64.tar.gz
$ tar -C /usr/local -xzf go1.13.linux-amd64.tar.gz
$ go version
go version go1.13 linux/amd64
$ mkdir /root/go
$ echo "export GOPATH=/root/go" >> /etc/profile
$ echo "export GOROOT=/usr/local/go" >> /etc/profile
$ go env | grep -E "GOPATH|GOROOT"
GOPATH="/root/go"
GOROOT="/usr/local/go"
$ echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> /etc/profile
$ source /etc/profile
```

