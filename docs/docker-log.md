## Docker 운영 로그

### Docker 설치 및 기본 점검

#### 버전 확인
% docker --version
Docker version 28.5.2, build ecc6942

#### 데몬 동작 여부
% docker info
Client:
 Version:    28.5.2
 Context:    orbstack
 Debug Mode: false
 Plugins:
  buildx: Docker Buildx (Docker Inc.)
    Version:  v0.29.1
    Path:     /Users/[user]/.docker/cli-plugins/docker-buildx
  compose: Docker Compose (Docker Inc.)
    Version:  v2.40.3
    Path:     /Users/[user]/.docker/cli-plugins/docker-compose

Server:
 Containers: 4
  Running: 2
  Paused: 0
  Stopped: 2
 Images: 2
 Server Version: 28.5.2
 Storage Driver: overlay2
  Backing Filesystem: btrfs
  Supports d_type: true
  Using metacopy: false
  Native Overlay Diff: true
  userxattr: false
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Cgroup Version: 2
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local splunk syslog
 CDI spec directories:
  /etc/cdi
  /var/run/cdi
 Swarm: inactive
 Runtimes: io.containerd.runc.v2 runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 1c4457e00facac03ce1d75f7b6777a7a851e5c41
 runc version: d842d7719497cc3b774fd71620278ac9e17710e0
 init version: de40ad0
 Security Options:
  seccomp
   Profile: builtin
  cgroupns
 Kernel Version: 6.17.8-orbstack-00308-g8f9c941121b1
 Operating System: OrbStack
 OSType: linux
 Architecture: x86_64
 CPUs: 6
 Total Memory: 15.67GiB
 Name: orbstack
 ID: c43436ea-6ce2-406d-9680-d9b75f8a58c8
 Docker Root Dir: /var/lib/docker
 Debug Mode: false
 Experimental: false
 Insecure Registries:
  ::1/128
  127.0.0.0/8
 Live Restore Enabled: false
 Product License: Community Engine
 Default Address Pools:
   Base: 192.168.97.0/24, Size: 24
   Base: 192.168.107.0/24, Size: 24
   Base: 192.168.117.0/24, Size: 24
   Base: 192.168.147.0/24, Size: 24
   Base: 192.168.148.0/24, Size: 24
   Base: 192.168.155.0/24, Size: 24
   Base: 192.168.156.0/24, Size: 24
   Base: 192.168.158.0/24, Size: 24
   Base: 192.168.163.0/24, Size: 24
   Base: 192.168.164.0/24, Size: 24
   Base: 192.168.165.0/24, Size: 24
   Base: 192.168.166.0/24, Size: 24
   Base: 192.168.167.0/24, Size: 24
   Base: 192.168.171.0/24, Size: 24
   Base: 192.168.172.0/24, Size: 24
   Base: 192.168.181.0/24, Size: 24
   Base: 192.168.183.0/24, Size: 24
   Base: 192.168.186.0/24, Size: 24
   Base: 192.168.207.0/24, Size: 24
   Base: 192.168.214.0/24, Size: 24
   Base: 192.168.215.0/24, Size: 24
   Base: 192.168.216.0/24, Size: 24
   Base: 192.168.223.0/24, Size: 24
   Base: 192.168.227.0/24, Size: 24
   Base: 192.168.228.0/24, Size: 24
   Base: 192.168.229.0/24, Size: 24
   Base: 192.168.237.0/24, Size: 24
   Base: 192.168.239.0/24, Size: 24
   Base: 192.168.242.0/24, Size: 24
   Base: 192.168.247.0/24, Size: 24
   Base: fd07:b51a:cc66:d000::/56, Size: 64

WARNING: DOCKER_INSECURE_NO_IPTABLES_RAW is set



### Docker 기본 운영 명령 수행

#### 이미지: 다운로드/목록 확인
% docker pull hello-world
Using default tag: latest
latest: Pulling from library/hello-world
Digest: sha256:c3cbe1cc1aa588a64951ac6286e0df7b27fe2e6324b1001c619bb358770c0178
Status: Image is up to date for hello-world:latest
docker.io/library/hello-world:latest
% docker pull nginx
Using default tag: latest
latest: Pulling from library/nginx
062e450697fa: Pull complete 
82454cdbf456: Pull complete 
3c7ab7949321: Pull complete 
cacfcdd01f30: Pull complete 
b6698f04e005: Pull complete 
2bedaf25031a: Pull complete 
d26f27cc8c41: Pull complete 
Digest: sha256:5a88c9c45479443d7be2eadc894b4ed0a9801bae03d97a5760ae13b5c2005942
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest
% docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
my-nginx      v1        c9085955cbdf   2 hours ago    62.4MB
nginx         latest    4e5db4761e0f   2 weeks ago    161MB
hello-world   latest    e2ac70e7319a   4 months ago   10.1kB

#### 컨테이너: 실행/중지/목록 확인
% docker run hello-world                        

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

% docker run -d --name my-nginx -p 8080:80 nginx
7e4d7bd82c51d66cf45ec0b9fd236a9b8259c6bcc917c694abbd959ca7e3f992
sh3737152398@c6r9s8 permission % docker ps
CONTAINER ID   IMAGE     COMMAND                   CREATED          STATUS          PORTS                                     NAMES
7e4d7bd82c51   nginx     "/docker-entrypoint.…"   13 seconds ago   Up 12 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-nginx
% docker ps -a
CONTAINER ID   IMAGE         COMMAND                   CREATED          STATUS                      PORTS                                     NAMES
7e4d7bd82c51   nginx         "/docker-entrypoint.…"   17 seconds ago   Up 16 seconds               0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-nginx
0fc214599b44   hello-world   "/hello"                  24 seconds ago   Exited (0) 23 seconds ago                                             eloquent_tharp


#### 운영: 로그 확인
% docker logs my-nginx
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/07/30 12:44:55 [notice] 1#1: using the "epoll" event method
2026/07/30 12:44:55 [notice] 1#1: nginx/1.31.3
2026/07/30 12:44:55 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19) 
2026/07/30 12:44:55 [notice] 1#1: OS: Linux 6.17.8-orbstack-00308-g8f9c941121b1
2026/07/30 12:44:55 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 20480:1048576
2026/07/30 12:44:55 [notice] 1#1: start worker processes
2026/07/30 12:44:55 [notice] 1#1: start worker process 29
2026/07/30 12:44:55 [notice] 1#1: start worker process 30
2026/07/30 12:44:55 [notice] 1#1: start worker process 31
2026/07/30 12:44:55 [notice] 1#1: start worker process 32
2026/07/30 12:44:55 [notice] 1#1: start worker process 33
2026/07/30 12:44:55 [notice] 1#1: start worker process 34

#### 운영: 리소스 확인
% docker stats --no-stream
CONTAINER ID   NAME       CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O         PIDS
7e4d7bd82c51   my-nginx   0.00%     6.309MiB / 15.67GiB   0.04%     1.13kB / 126B   16.8MB / 8.19kB   7



### 컨테이너 실행 실습

#### 1. hello-world 실행
% docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

#### 2. ubuntu 이미지 다운로드
% docker pull ubuntu
Using default tag: latest
latest: Pulling from library/ubuntu
ed819469700f: Pull complete 
a3679419df18: Pull complete 
Digest: sha256:3131b4cc82a783df6c9df078f86e01819a13594b865c2cad47bd1bca2b7063bb
Status: Downloaded newer image for ubuntu:latest
docker.io/library/ubuntu:latest
% docker images | grep ubuntu
ubuntu        latest    de7345b16e94   2 weeks ago    100MB

#### 3. ubuntu 컨테이너 실행 및 내부 진입
% docker run -it --name my-ubuntu ubuntu /bin/bash
root@e60b2b13ea93:/#

#### 4. 컨테이너 내부 명령 실행
pwd
/
root@e60b2b13ea93:/# ls
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
root@e60b2b13ea93:/# ls /
bin   dev  home  lib64  mnt  proc  run   srv  tmp  var
boot  etc  lib   media  opt  root  sbin  sys  usr
root@e60b2b13ea93:/# echo "Hello from Ubuntu Container!"
Hello from Ubuntu Container!
root@e60b2b13ea93:/# cat /etc/os-release
PRETTY_NAME="Ubuntu 26.04 LTS"
NAME="Ubuntu"
VERSION_ID="26.04"
VERSION="26.04 LTS (Resolute Raccoon)"
VERSION_CODENAME=resolute
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=resolute
LOGO=ubuntu-logo

#### 5. 종료/유지 방식 차이 관찰

##### exit 사용 시 (컨테이너 종료)
root@e60b2b13ea93:/# exit
exit
sh3737152398@c6r9s8 permission % docker ps -a | grep my-ubuntu
e60b2b13ea93   ubuntu        "/bin/bash"               6 minutes ago    Exited (0) 18 seconds ago                                             my-ubuntu
- STATUS: Exited)


##### Ctrl+P+Q 사용 시 (컨테이너 유지)

```bash
docker start -ai my-ubuntu
# 내부에서 Ctrl+P+Q
docker ps | grep my-ubuntu
```

```
(출력 결과 붙여넣기 - STATUS: Up)
```

##### exec 재진입

```bash
docker exec -it my-ubuntu /bin/bash
```

```
(출력 결과 붙여넣기)
```

---

#### 6. 종료/유지 방식 비교 정리

| 방식 | 명령/키 | 컨테이너 상태 | 사용 상황 |
|------|---------|--------------|----------|
| 종료 | `exit` | Exited (중지) | 작업 완전히 끝낼 때 |
| 분리 | `Ctrl+P+Q` | Up (실행 유지) | 컨테이너 살려두고 나올 때 |
| 재진입 | `docker exec -it` | Up 상태에서 진입 | 실행 중 컨테이너에 추가 작업 |
| 재연결 | `docker attach` | Up 상태에서 연결 | 기존 세션에 재연결 (exit 시 종료 주의) |

---

#### 7. 컨테이너 정리

```bash
docker stop my-ubuntu
docker rm my-ubuntu
docker ps -a
```

```
(출력 결과 붙여넣기)
```



### 기존 Dockerfile 기반 커스텀 이미지 제작

#### 


#### 


#### 



### 포트 매핑 및 접속 증거

#### 


#### 


#### 



### Docker 볼륨 영속성 검증

#### 


#### 


#### 



### Git 설정 및 GitHub 연동

#### 


#### 


#### 

