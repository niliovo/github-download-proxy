# Github-Download-Proxy

- [中文](./README.md)
- [ENGLISH](./README-EN.md)

- [Github](https://github.com/niliovo/github-download-proxy)
- [Docker Hub](https://hub.docker.com/r/niliaerith/github-download-proxy)

## Project Introduction

Github file download accelerated Docker image, the front and back end packaging, no need to deploy a separate front-end page

***This project is based on the following items, if there is infringement, please contact to delete***

- [hunshcn/gh-proxy](https://github.com/hunshcn/gh-proxy)

### Support Platform

- x86_64
- arm64
- x86_32(untested)
- arm32(untested)

> Tip: Multi-platform image simulates different platform compilations for QEMU, there may be problems, if the image is not available, try compiling it yourself

## Usage Introduction

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

### Self Compilation

```
git clone https://github.com/niliovo/github-download-proxy.git
cd github-download-proxy
docker build -t github-download-proxy .
# Replace the above image 'niliaerith/github-download-proxy' with 'github-download-proxy'
```

### variable

- TZ: Container time zone,default is `Asia/Shanghai`
- HOST: Container listening address,default is `0.0.0.0`
- PORT: Container listening port,default is `80`

## Thanks

- [hunshcn/gh-proxy](https://github.com/hunshcn/gh-proxy)
- [GitHub](https://github.com/)
- [Docker Hub](https://hub.docker.com/)

## Star History

<a href="https://star-history.com/#niliovo/github-download-proxy&Date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=niliovo/github-download-proxy&type=Date&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=niliovo/github-download-proxy&type=Date" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=niliovo/github-download-proxy&type=Date" />
  </picture>
</a>
