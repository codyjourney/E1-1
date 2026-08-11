## Docker 운영 로그

### Docker 설치 및 기본 점검

#### 버전 확인
'''
% docker --version
Docker version 28.5.2, build ecc6942
'''


#### 데몬 동작 여부
'''
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
'''


### Docker 기본 운영 명령 수행

#### 이미지: 다운로드/목록 확인
'''
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
'''

#### 컨테이너: 실행/중지/목록 확인
'''
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
'''

#### 운영: 로그 확인
'''
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
'''

#### 운영: 리소스 확인
'''
% docker stats --no-stream
CONTAINER ID   NAME       CPU %     MEM USAGE / LIMIT     MEM %     NET I/O         BLOCK I/O         PIDS
7e4d7bd82c51   my-nginx   0.00%     6.309MiB / 15.67GiB   0.04%     1.13kB / 126B   16.8MB / 8.19kB   7
'''


### 컨테이너 실행 실습

#### 1. hello-world 실행
'''
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
'''

#### 2. ubuntu 이미지 다운로드
'''
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
'''

#### 3. ubuntu 컨테이너 실행 및 내부 진입
'''
% docker run -it --name my-ubuntu ubuntu /bin/bash
root@e60b2b13ea93:/#
'''

#### 4. 컨테이너 내부 명령 실행
'''
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
'''

#### 5. 종료/유지 방식 차이 관찰

##### exit 사용 시 (컨테이너 종료)
'''
root@e60b2b13ea93:/# exit
exit
sh3737152398@c6r9s8 permission % docker ps -a | grep my-ubuntu
e60b2b13ea93   ubuntu        "/bin/bash"               6 minutes ago    Exited (0) 18 seconds ago                                             my-ubuntu
- STATUS: Exited)
'''

##### Ctrl+P+Q 사용 시 (컨테이너 유지)
'''
% docker start -ai my-ubuntu
root@e60b2b13ea93:/# %                                                            % docker ps | grep my-ubuntu
e60b2b13ea93   ubuntu    "/bin/bash"               8 minutes ago    Up 16 seconds                                             my-ubuntu
'''

##### exec 재진입
'''
% docker exec -it my-ubuntu /bin/bash
root@e60b2b13ea93:/# 
'''

💡 attach vs exec 차이

방식	명령어	특징
attach	docker attach	기존 프로세스에 연결, exit 시 컨테이너 종료
exec	docker exec -it	새 프로세스 생성, exit해도 컨테이너 유지


#### 6. 종료/유지 방식 비교 정리

| 방식 | 명령/키 | 컨테이너 상태 | 사용 상황 |
|------|---------|--------------|----------|
| 종료 | `exit` | Exited (중지) | 작업 완전히 끝낼 때 |
| 분리 | `Ctrl+P+Q` | Up (실행 유지) | 컨테이너 살려두고 나올 때 |
| 재진입 | `docker exec -it` | Up 상태에서 진입 | 실행 중 컨테이너에 추가 작업 |
| 재연결 | `docker attach` | Up 상태에서 연결 | 기존 세션에 재연결 (exit 시 종료 주의) |

#### 7. 컨테이너 정리
'''
% docker stop my-ubuntu
my-ubuntu
% docker rm my-ubuntu
my-ubuntu
% docker ps -a
CONTAINER ID   IMAGE         COMMAND                   CREATED          STATUS                      PORTS                                     NAMES
d63cad256633   hello-world   "/hello"                  12 minutes ago   Exited (0) 12 minutes ago                                             mystifying_euclid
7e4d7bd82c51   nginx         "/docker-entrypoint.…"   20 minutes ago   Up 20 minutes               0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   my-nginx
0fc214599b44   hello-world   "/hello"                  20 minutes ago   Exited (0) 20 minutes ago                                             eloquent_tharp
'''


### 기존 Dockerfile 기반 커스텀 이미지 제작

#### 
'''
% ls
Dockerfile	html
% docker build -t custom-nginx:1.0 .
[+] Building 0.9s (7/7) FINISHED                                            docker:orbstack
 => [internal] load build definition from Dockerfile                                   0.1s
 => => transferring dockerfile: 1.06kB                                                 0.0s
 => [internal] load metadata for docker.io/library/nginx:alpine                        0.4s
 => [internal] load .dockerignore                                                      0.1s
 => => transferring context: 2B                                                        0.0s
 => [internal] load build context                                                      0.1s
 => => transferring context: 61B                                                       0.0s
 => [1/2] FROM docker.io/library/nginx:alpine@sha256:4a73073bd557c65b759505da037898b6  0.0s
 => CACHED [2/2] COPY html/index.html /usr/share/nginx/html/index.html                 0.0s
 => exporting to image                                                                 0.0s
 => => exporting layers                                                                0.0s
 => => writing image sha256:cb5588522c45a1972f155c1802e9be9084a72c023f72993cbb340462f  0.0s
 => => naming to docker.io/library/custom-nginx:1.0                                    0.0s
% docker run -d --name my-custom-nginx -p 8080:80 custom-nginx:1.0
794a61650a426b362e5217419d17da1d3a76f7d1f3565a8fd1afd3139b130d2c
% curl http://localhost:8080
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="2575.7">
  <style type="text/css">
    p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica}
  </style>
</head>
<body>
<p class="p1">&lt;!DOCTYPE html&gt;</p>
<p class="p1">&lt;html lang="ko"&gt;</p>
<p class="p1">&lt;head&gt;</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;meta charset="UTF-8"&gt;</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;title&gt;My Custom Nginx&lt;/title&gt;</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;style&gt;</p>
<p class="p1"><span class="Apple-converted-space">    </span>body { font-family: sans-serif; text-align: center; padding: 50px; background: #f0f4f8; }</p>
<p class="p1"><span class="Apple-converted-space">    </span>h1 <span class="Apple-converted-space">  </span>{ color: #2d6a4f; }</p>
<p class="p1"><span class="Apple-converted-space">    </span>p<span class="Apple-converted-space">    </span>{ color: #555; }</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;/style&gt;</p>
<p class="p1">&lt;/head&gt;</p>
<p class="p1">&lt;body&gt;</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;h1&gt;Custom Nginx Container&lt;/h1&gt;</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;p&gt;베이스 이미지: nginx:alpine&lt;/p&gt;</p>
<p class="p1"><span class="Apple-converted-space">  </span>&lt;p&gt;빌드 성공!&lt;/p&gt;</p>
<p class="p1">&lt;/body&gt;</p>
<p class="p1">&lt;/html&gt;</p>
</body>
</html>
% docker inspect --format='{{.State.Health.Status}}' my-custom-nginx
starting
'''

### 포트 매핑 및 접속 증거

#### 
'''
docker run -d \
  --name development-web \
  -p 8080:80 \
  development-workstation:1.0
683d14a61eb68e92de2906dd0d7c8c5c95643628b297d5cbb0806698d6fdac5c
'''

#### 
'''
% docker ps
CONTAINER ID   IMAGE                         COMMAND                   CREATED          STATUS          PORTS                                     NAMES
683d14a61eb6   development-workstation:1.0   "/docker-entrypoint.…"   49 seconds ago   Up 48 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   development-web
'''

#### 
'''
curl http://localhost:8080
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="2575.7">
  <style type="text/css">
    p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica}
  </style>
</head>
<body>
<p class="p1">Hello</p>
</body>
</html>
'''

### 바인드 마운트 반영

#### 
'''
docker run -d \
  --name bind-web \
  -p 8081:80 \
  --mount type=bind,source="$(pwd)/mount-test",target=/usr/share/nginx/html \
  nginx:alpine
Unable to find image 'nginx:alpine' locally
alpine: Pulling from library/nginx
55afa1ecc21d: Already exists 
3cd534fe98c6: Already exists 
1223f016b4e4: Already exists 
62bec68d7c31: Already exists 
46f977ee452f: Already exists 
d0008c891db4: Already exists 
390dc935348d: Already exists 
46519e7231d2: Already exists 
Digest: sha256:4a73073bd557c65b759505da037898b61f1be6cbcc3c2c3aeac22d2a470c1752
Status: Downloaded newer image for nginx:alpine
3c8ce0f2bd326801e62fda3e1c6409b2081a8000b8fd3d6ff551dd9dfa56f47b
 % curl http://localhost:8081
version 1
 % echo "version 2 - changed on host" > mount-test/index.html
 % curl http://localhost:8081
version 2 - changed on host
'''

#### 


### Docker 볼륨 영속성 검증

#### 
'''
% docker volume create workstation-data
workstation-data
% docker volume ls
DRIVER    VOLUME NAME
local     workstation-data

% docker run -d \
  --name volume-test \
  --mount source=workstation-data,target=/data \
  ubuntu:24.04 \
  sleep infinity
7289c5315fddd93d5ac37f08d3be2d8541899b198587328a6c05399b2f86cda9

% docker exec volume-test bash -c 'echo "persistent data" > /data/hello.txt'
% docker exec volume-test cat /data/hello.txt
persistent data
'''

#### 
'''
% docker rm -f volume-test
volume-test
% docker volume ls
DRIVER    VOLUME NAME
local     workstation-data
% docker run -d \
  --name volume-test-2 \
  --mount source=workstation-data,target=/data \
  ubuntu:24.04 \
  sleep infinity
80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c
% docker exec volume-test-2 cat /data/hello.txt
persistent data
'''

#### 
'''
% docker volume inspect workstation-data
[
    {
        "CreatedAt": "2026-08-11T17:33:41+09:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/workstation-data/_data",
        "Name": "workstation-data",
        "Options": null,
        "Scope": "local"
    }
]

% docker volume inspect workstation-data
[
    {
        "CreatedAt": "2026-08-11T17:33:41+09:00",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/workstation-data/_data",
        "Name": "workstation-data",
        "Options": null,
        "Scope": "local"
    }
]
% docker inspect volume-test-2 
[
    {
        "Id": "80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c",
        "Created": "2026-08-11T08:52:27.85859517Z",
        "Path": "sleep",
        "Args": [
            "infinity"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 785,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2026-08-11T08:52:27.913254068Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:045183670ef29ce21bc22a8d4f62511ce472679ca8fc9774f04181f7f383ca62",
        "ResolvConfPath": "/var/lib/docker/containers/80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c/hostname",
        "HostsPath": "/var/lib/docker/containers/80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c/hosts",
        "LogPath": "/var/lib/docker/containers/80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c/80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c-json.log",
        "Name": "/volume-test-2",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {
                    "max-file": "5",
                    "max-size": "20m"
                }
            },
            "NetworkMode": "bridge",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                16,
                101
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 8413773824,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": [],
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "Mounts": [
                {
                    "Type": "volume",
                    "Source": "workstation-data",
                    "Target": "/data"
                }
            ],
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/interrupts",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware",
                "/sys/devices/virtual/powercap"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "ID": "80a7a29e7c9fd2c43881e1cda0e4584a560fc142faea6f0f548bfbf724451d7c",
                "LowerDir": "/var/lib/docker/overlay2/12e84180ed1298fbd25f4048b3c5e38ccb9c46ad640aac8800b7d029b51ba7df-init/diff:/var/lib/docker/overlay2/bdddb181ed4944855d3c66d84e49eadc971fcefee6fec0abceb562750e2583f3/diff",
                "MergedDir": "/var/lib/docker/overlay2/12e84180ed1298fbd25f4048b3c5e38ccb9c46ad640aac8800b7d029b51ba7df/merged",
                "UpperDir": "/var/lib/docker/overlay2/12e84180ed1298fbd25f4048b3c5e38ccb9c46ad640aac8800b7d029b51ba7df/diff",
                "WorkDir": "/var/lib/docker/overlay2/12e84180ed1298fbd25f4048b3c5e38ccb9c46ad640aac8800b7d029b51ba7df/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "workstation-data",
                "Source": "/var/lib/docker/volumes/workstation-data/_data",
                "Destination": "/data",
                "Driver": "local",
                "Mode": "z",
                "RW": true,
                "Propagation": ""
            }
        ],
        "Config": {
            "Hostname": "80a7a29e7c9f",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "sleep",
                "infinity"
            ],
            "Image": "ubuntu:24.04",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {
                "org.opencontainers.image.version": "24.04"
            }
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "32db054ccb619608fa8c2ea6afff4dbd3433cb90d7b71e93103cbad6f042c049",
            "SandboxKey": "/var/run/docker/netns/32db054ccb61",
            "Ports": {},
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "60744a3e9817e0710cd35999fab4944f5656e2e874efbbb977e046039112e575",
            "Gateway": "192.168.215.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "192.168.215.5",
            "IPPrefixLen": 24,
            "IPv6Gateway": "",
            "MacAddress": "c6:09:26:8d:9c:59",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "c6:09:26:8d:9c:59",
                    "DriverOpts": null,
                    "GwPriority": 0,
                    "NetworkID": "bbae33330e53b8e701ff86b4b6630f7fe61740af2354f26a2fb70b009ca444d3",
                    "EndpointID": "60744a3e9817e0710cd35999fab4944f5656e2e874efbbb977e046039112e575",
                    "Gateway": "192.168.215.1",
                    "IPAddress": "192.168.215.5",
                    "IPPrefixLen": 24,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DNSNames": null
                }
            }
        }
    }
]

'''