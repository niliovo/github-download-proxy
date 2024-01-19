# Github-Download-Proxy

- [中文](./README.md)
- [ENGLISH](./README-EN.md)

- [Github](https://github.com/niliovo/github-download-proxy)
- [Docker Hub](https://hub.docker.com/r/niliaerith/github-download-proxy)

## 项目说明

Github文件下载加速的Docker镜像，将前后端打包，无需单独部署前端页面

***本项目基于下列项目，如有侵权，请联系删除***

- [hunshcn/gh-proxy](https://github.com/hunshcn/gh-proxy)

### 支持平台

- x86_64
- arm64
- x86_32(未测试)
- arm32(未测试)

> 提示：多平台镜像为QEMU模拟不同平台编译，可能存在问题，如果镜像不可用，请尝试自行编译

## 使用说明

### Docker Compose

```
  github-download-proxy:
    image: niliaerith/github-download-proxy:latest
    container_name: github-download-proxy
    hostname: github-download-proxy
    restart: always
    network_mode: bridge
    ports:
      - "8080:80"
    environment:
      TZ: "Asia/Shanghai"
      HOST: "0.0.0.0"
      PORT: "80"
```

### Docker Cli

```
docker run -itd --name github-download-proxy --hostname github-download-proxy --restart always --net bridge -p 8080:80 -e TZ="Asia/Shanghai" -e HOST="0.0.0.0" -e PORT="80" niliaerith/github-download-proxy:latest
```

### 自行编译

```
git clone https://github.com/niliovo/github-download-proxy.git
cd github-download-proxy
docker build -t github-download-proxy .
# 将上述镜像 'niliaerith/github-download-proxy' 替换为 'github-download-proxy'
```

### 变量

- TZ: 容器时区，默认`Asia/Shanghai`
- HOST: 容器监听地址，默认`0.0.0.0`
- PORT: 容器监听端口，默认`80`

## 感谢

- [hunshcn/gh-proxy](https://github.com/hunshcn/gh-proxy)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)

## STAR 历史

<a href="https://star-history.com/#niliovo/github-download-proxy&Date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=niliovo/github-download-proxy&type=Date&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=niliovo/github-download-proxy&type=Date" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=niliovo/github-download-proxy&type=Date" />
  </picture>
</a>
