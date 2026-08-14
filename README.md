## 1) 프로젝트 개요
개발의 첫 단추인 터미널, Docker, Git 을 직접 구축하여 "내 컴퓨터에서만 작동하는 문제"를 해결하고, 누구나 동일하게 실행·배포·디버깅할 수 있는 재현 가능한 개발 환경 생성

## 2) 실행 환경
- OS: macOS 15.7.4
- Shell: zsh
- Docker: 25.8.2
- Git: 2.53.0

## 3) 수행 체크리스트
- [O] 터미널 기본 조작 및 폴더 구성
- [O] 권한 변경 실습
- [O] Docker 설치/점검
- [O] hello-world 실행
- [O] Dockerfile 빌드/실행
- [O] 포트 매핑 접속
- [O] 바인드 마운트 반영
- [O] 볼륨 영속성
- [O] Git 설정 + GitHub 연동


## 4. 검증 방법

### 4.1 터미널 기본 조작 및 폴더 구성

터미널 기본 조작 및 폴더 구성 실습을 진행했습니다.

- 상세 로그: [터미널 조작 로그](./docs/terminal-log.md)

---

### 4.2 권한 변경 실습

Linux 파일 권한은 **소유자(Owner)**, **그룹(Group)**, **Others** 순서로 표시됩니다.

~~~text
-rwxr-xr-x
 ↑↑↑↑↑↑↑↑↑
 │└──┘└──┘└──┘
 │ 소유자  그룹  others
 │
 └ 파일 종류 (- = 파일, d = 디렉토리)
~~~

#### 권한 숫자 의미

| 숫자 | 의미 | 기호 |
|:---:|---|:---:|
| `7` | 읽기 + 쓰기 + 실행 | `rwx` |
| `6` | 읽기 + 쓰기 | `rw-` |
| `5` | 읽기 + 실행 | `r-x` |
| `4` | 읽기만 | `r--` |
| `0` | 권한 없음 | `---` |

- 상세 로그 및 증거: [권한 실습 및 증거](./docs/terminal-log.md)

---

### 4.3 Docker 설치 및 점검

Docker 설치 및 기본 명령어를 확인하고 실습했습니다.

- 상세 로그: [Docker 설치/점검](./docs/docker-log.md)

#### Docker 운영 명령 요약

| 분류 | 명령어 | 설명 |
|---|---|---|
| 이미지 | `docker pull` | 이미지 다운로드 |
| 이미지 | `docker images` | 이미지 목록 확인 |
| 컨테이너 | `docker run` | 컨테이너 실행 |
| 컨테이너 | `docker ps` | 실행 중인 컨테이너 목록 확인 |
| 컨테이너 | `docker ps -a` | 전체 컨테이너 목록 확인 |
| 운영 | `docker logs` | 컨테이너 로그 확인 |
| 운영 | `docker stats` | 컨테이너 리소스 사용량 확인 |
| 정리 | `docker stop` | 컨테이너 중지 |
| 정리 | `docker rm` | 컨테이너 삭제 |

---

### 4.4 `hello-world` 실행

Docker의 정상적인 설치 및 실행 여부를 확인하기 위해 `hello-world` 이미지를 실행했습니다.

- 상세 로그: [hello-world 실행](./docs/docker-log.md)

---

### 4.5 Dockerfile 빌드 및 실행

Dockerfile을 작성하고 이미지를 빌드한 후 컨테이너를 실행하는 과정을 실습했습니다.

- 상세 로그: [Dockerfile 빌드/실행](./docs/docker-log.md)

---

### 4.6 포트 매핑 접속

컨테이너의 포트를 호스트에 매핑하고 실제 접속이 정상적으로 이루어지는지 **2회** 확인했습니다.

- 상세 로그: [포트 매핑 접속(2회)](./docs/docker-log.md)
- 상세 스크린샷: [screenshots](./screenshots/)

---

### 4.7 바인드 마운트 반영

호스트의 파일을 컨테이너에 바인드 마운트하여 호스트에서 변경한 내용이 컨테이너에 반영되는 것을 확인했습니다.

- 상세 로그: [바인드 마운트 반영](./docs/docker-log.md)

---

### 4.8 볼륨 영속성

Docker Volume을 이용하여 컨테이너가 삭제된 이후에도 데이터가 유지되는 것을 확인했습니다.

- 상세 로그: [볼륨 영속성](./docs/docker-log.md)

#### Bind Mount vs Volume

| 구분 | Bind Mount | Docker Volume |
|---|---|---|
| 데이터 위치 | 호스트 경로 직접 지정 | Docker가 관리 |
| 주요 목적 | 개발 중 소스 변경 반영 | 데이터 영속성 |
| 예시 | `./mount-test:/usr/share/nginx/html` | `workstation-data:/data` |
| 호스트 파일 직접 접근 | 쉬움 | 직접 관리하지 않는 것이 일반적 |
| 컨테이너 삭제 후 데이터 | 호스트에 남음 | Volume이 남아 있으면 유지 |

> Docker의 **Bind Mount**는 호스트와 컨테이너 사이의 파일 공유에 적합하고, **Volume**은 컨테이너와 독립적으로 데이터를 지속적으로 저장하는 데 적합합니다.

---

### 4.9 Git 설정 및 GitHub 연동

Git 사용자 정보와 기본 브랜치를 설정하고, GitHub 원격 저장소와의 연결 상태를 확인했습니다.

- 상세 로그: [Git 설정 및 GitHub 연동](./docs/git-log.md)
- 상세 스크린샷: [Git 설정 화면](./screenshots/Git.png)

#### Git 설정 및 저장소 정보

~~~text
% git config --list

credential.helper=osxkeychain
user.name=홍길동
user.email=hong@example.com
init.defaultbranch=Main
core.repositoryformatversion=0
core.filemode=true
core.bare=false
core.logallrefupdates=true
core.ignorecase=true
core.precomposeunicode=true
remote.origin.url=https://github.com/[user]/E1-1.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.Main.remote=origin
branch.Main.merge=refs/heads/Main
~~~




## 5. 트러블슈팅
상세 로그: [트러블슈팅 로그](./docs/troubleshooting.md)




## 6. 설명

# 개발 워크스테이션 구축 미션

## 1. 프로젝트 개요

이 프로젝트는 개발을 시작하기 위한 기본적인 개발 워크스테이션을 직접 구성하고 검증하는 것을 목표로 한다.

터미널을 이용하여 파일과 디렉토리를 관리하고 권한을 확인 및 변경하는 과정을 수행한다.

이후 Docker를 설치하고 Docker 엔진의 정상 동작 여부를 확인한다. Docker의 이미지와 컨테이너 개념을 이해하고 `hello-world`, `ubuntu` 컨테이너를 실행하면서 기본적인 컨테이너 운영 명령을 익힌다.

Dockerfile을 직접 작성하여 웹 서버를 커스텀 이미지로 만들고, 포트 매핑을 통해 호스트에서 컨테이너의 웹 서버에 접근한다.

또한 바인드 마운트를 이용하여 호스트의 파일 변경 사항이 컨테이너에 반영되는 것을 확인하고, Docker 볼륨을 이용하여 컨테이너가 삭제된 이후에도 데이터가 유지되는 것을 검증한다.

마지막으로 Git의 사용자 정보와 기본 브랜치를 설정하고 GitHub Repository와 연동하여 버전 관리 및 협업 환경을 구성한다.

---

# 2. 미션 목표

이 미션을 통해 다음 내용을 직접 수행하고 설명할 수 있는 것을 목표로 한다.

* 절대 경로와 상대 경로의 차이 이해
* Linux 터미널 기본 명령어 사용
* 파일 및 디렉토리 생성, 복사, 이동, 삭제
* 파일 내용 확인
* Linux 파일 권한의 `r`, `w`, `x` 의미 이해
* `755`, `644` 등의 권한 표기 이해
* Docker 이미지와 컨테이너의 차이 이해
* Docker 이미지 다운로드 및 관리
* Docker 컨테이너 실행 및 관리
* Dockerfile을 이용한 커스텀 이미지 생성
* 컨테이너 포트와 호스트 포트의 매핑 이해
* 바인드 마운트의 동작 방식 이해
* Docker 볼륨의 데이터 영속성 이해
* Git과 GitHub의 역할 차이 이해
* Git 기본 설정 및 GitHub Repository 연동
* 실행 결과와 로그를 이용하여 작업 결과 검증


---

# 5. 터미널 기본 조작

## 5.1 현재 위치 확인

현재 터미널이 어느 디렉토리를 가리키고 있는지 확인한다.

```bash
pwd
```


### 설명

`pwd`는 **Print Working Directory**의 약자로 현재 작업 중인 디렉토리의 절대 경로를 출력한다.

예를 들어 다음과 같은 결과가 나온다면:

```text
/Users/user/dev-workstation
```

현재 작업 위치가 `/Users/user/dev-workstation`이라는 의미이다.

---

## 5.2 파일 목록 확인

일반 파일과 디렉토리를 확인한다.

```bash
ls
```

숨김 파일을 포함하여 자세히 확인한다.

```bash
ls -la
```


### 설명

`ls`는 현재 디렉토리에 존재하는 파일과 디렉토리를 보여준다.

`ls -la`에서:

* `-l`: 상세 정보 표시
* `-a`: 숨김 파일까지 표시

따라서 `ls -la`를 사용하면 `.git`과 같은 숨김 파일 또는 디렉토리도 확인할 수 있다.

---

# 6. 절대 경로와 상대 경로

## 6.1 절대 경로

절대 경로는 현재 위치와 관계없이 파일 또는 디렉토리의 위치를 루트부터 표현하는 방식이다.

예:

```text
/Users/user/dev-workstation/app/index.html
```

현재 작업 디렉토리가 어디인지와 관계없이 같은 파일을 가리킨다.

## 6.2 상대 경로

상대 경로는 현재 작업 디렉토리를 기준으로 위치를 표현한다.

현재 위치가 다음과 같다고 가정한다.

```text
/Users/user/dev-workstation
```

이때:

```text
app/index.html
```

은 다음 파일을 의미한다.

```text
/Users/user/dev-workstation/app/index.html
```

### 핵심 차이

| 구분       | 절대 경로                        | 상대 경로            |
| -------- | ---------------------------- | ---------------- |
| 기준       | 루트 디렉토리                      | 현재 작업 디렉토리       |
| 예시       | `/Users/user/app/index.html` | `app/index.html` |
| 현재 위치 영향 | 없음                           | 있음               |

---

# 7. 디렉토리 생성 및 이동

## 7.1 디렉토리 생성

```bash
mkdir -p dev-workstation/app
```

생성 결과 확인:

```bash
ls -la dev-workstation
```

## 7.2 디렉토리 이동

```bash
cd dev-workstation
```

현재 위치 확인:

```bash
pwd
```
---

# 8. 파일 생성 및 내용 확인

## 8.1 빈 파일 생성

`touch`를 사용하여 빈 파일을 생성한다.

```bash
touch test.txt
```

파일 확인:

```bash
ls -la
```

## 8.2 파일 내용 확인

```bash
cat test.txt
```

빈 파일이므로 출력 내용이 없을 수 있다.

테스트 내용을 추가한다.

```bash
echo "Hello Terminal" > test.txt
```

내용을 확인한다.

```bash
cat test.txt
```

실행 결과:

```text
Hello Terminal
```

---

# 9. 파일 복사

`cp` 명령어를 사용하여 파일을 복사한다.

```bash
cp test.txt test-copy.txt
```

결과를 확인한다.

```bash
ls -la
```

내용도 확인한다.

```bash
cat test-copy.txt
```

실행 결과:

```text
Hello Terminal
```

---

# 10. 파일 이동 및 이름 변경

Linux에서 `mv`는 파일이나 디렉토리를 이동하거나 이름을 변경할 때 사용한다.

## 10.1 이름 변경

```bash
mv test-copy.txt renamed.txt
```

확인:

```bash
ls -la
```

## 10.2 디렉토리 이동

예를 들어 `renamed.txt`를 `app` 디렉토리로 이동한다.

```bash
mv renamed.txt app/
```

확인:

```bash
ls -la app
```

---

# 11. 파일 삭제

`rm` 명령어를 사용하여 파일을 삭제한다.

```bash
rm app/renamed.txt
```

삭제 결과 확인:

```bash
ls -la app
```

### 주의

`rm`은 일반적으로 휴지통을 거치지 않고 파일을 삭제하므로 삭제할 대상이 정확한지 확인한 후 사용한다.

---

# 12. Linux 파일 권한 실습

Linux에서는 파일과 디렉토리에 권한이 존재한다.

기본 권한은 다음 세 가지로 구성된다.

| 권한  | 의미 | 숫자 |
| --- | -- | -: |
| `r` | 읽기 |  4 |
| `w` | 쓰기 |  2 |
| `x` | 실행 |  1 |

권한은 일반적으로 다음 세 사용자 그룹에 대해 설정된다.

```text
owner / group / others
```

---

# 13. 파일 권한 확인

테스트 파일을 생성한다.

```bash
touch permission-test.txt
```

권한을 확인한다.

```bash
ls -l permission-test.txt
```


예를 들어 다음과 같이 출력될 수 있다.

```text
-rw-r--r--  1 user  staff  0 Aug 13 11:00 permission-test.txt
```

여기서:

```text
-rw-r--r--
```

는 다음과 같이 해석할 수 있다.

```text
- rw- r-- r--
  │   │   │
  │   │   └── others
  │   └────── group
  └────────── owner
```

---

# 14. 파일 권한 644 실습

`644`는 다음과 같이 해석한다.

```text
6 = 4 + 2 = rw-
4 = r--
4 = r--
```

따라서:

```text
644 = rw-r--r--
```

권한을 변경한다.

```bash
chmod 644 permission-test.txt
```

변경 전/후를 비교한다.

```bash
ls -l permission-test.txt
chmod 755 permission-test.txt
ls -l permission-test.txt
```

## 755의 의미

```text
7 = 4 + 2 + 1 = rwx
5 = 4 + 1     = r-x
5 = 4 + 1     = r-x
```

따라서:

```text
755 = rwxr-xr-x
```

소유자는 읽기/쓰기/실행이 가능하고, 그룹과 기타 사용자는 읽기/실행이 가능하다.

---

# 15. 디렉토리 권한 실습

테스트 디렉토리를 생성한다.

```bash
mkdir permission-dir
```

현재 권한을 확인한다.

```bash
ls -ld permission-dir
```

권한을 `700`으로 변경한다.

```bash
chmod 700 permission-dir
```

다시 확인한다.

```bash
ls -ld permission-dir
```

## 700의 의미

```text
7 = rwx
0 = ---
0 = ---
```

따라서:

```text
700 = rwx------
```

소유자에게만 읽기, 쓰기, 디렉토리 접근/탐색 권한을 부여하는 형태이다.

---

# 16. Docker 실행 환경 구성

## 16.1 서울캠퍼스 환경

서울캠퍼스에서는 시스템 보안 정책에 따라 `sudo` 사용이 제한될 수 있다.

이 경우 Docker를 일반적인 방식으로 직접 설치하거나 Docker 데몬을 제어하는 것이 어려울 수 있다.

따라서 본 실습에서는 OrbStack을 Docker 실행 환경으로 사용할 수 있다.

OrbStack 애플리케이션이 실행되면 Docker 엔진을 사용할 수 있고 터미널에서 일반적인 Docker CLI 명령을 실행할 수 있다.

예:

```bash
docker run
docker ps
docker build
docker images
```

---

# 17. Docker 기본 점검

## 17.1 Docker 버전

```bash
docker --version
```

## 17.2 Docker 엔진 점검

```bash
docker info
```

`docker info`가 정상적으로 출력된다면 Docker CLI가 Docker 엔진과 정상적으로 통신하고 있음을 확인할 수 있다.

---

# 18. Docker 이미지 확인

현재 로컬에 존재하는 Docker 이미지를 확인한다.

```bash
docker images
```


Docker 이미지와 컨테이너의 관계는 다음과 같다.

```text
Dockerfile
    ↓
docker build
    ↓
Docker Image
    ↓
docker run
    ↓
Docker Container
```

### 이미지

컨테이너를 실행하기 위한 읽기 전용 템플릿에 가깝다.

### 컨테이너

이미지를 기반으로 실제 실행되는 독립적인 프로세스 환경이다.

따라서 하나의 이미지에서 여러 개의 컨테이너를 생성할 수 있다.

---

# 19. hello-world 컨테이너 실행

Docker가 정상적으로 동작하는지 가장 간단하게 확인하기 위해 `hello-world` 이미지를 실행한다.

```bash
docker run hello-world
```

정상적으로 성공했다면 Docker 이미지 다운로드와 컨테이너 실행이 정상적으로 이루어진 것이다.

---

# 20. Ubuntu 컨테이너 실행

Ubuntu 이미지를 다운로드하고 컨테이너 내부에 진입한다.

```bash
docker run -it --name ubuntu-practice ubuntu bash
```

컨테이너 내부에서 다음 명령을 실행한다.

```bash
ls
```

다음 명령도 실행한다.

```bash
echo "Hello Docker"
```

실행 결과:

```text
Hello Docker
```

컨테이너 내부에서 나간다.

```bash
exit
```

---

# 21. attach와 exec의 차이

Docker 컨테이너에 접근하는 방법으로 `attach`와 `exec`를 사용할 수 있다.

## attach

실행 중인 컨테이너의 기존 프로세스에 연결한다.

```bash
docker attach <container_name>
```

## exec

실행 중인 컨테이너 안에서 새로운 프로세스를 실행한다.

```bash
docker exec -it <container_name> bash
```

두 방식의 핵심적인 차이는 다음과 같다.

| 명령              | 의미                          |
| --------------- | --------------------------- |
| `docker attach` | 기존 컨테이너 프로세스에 연결            |
| `docker exec`   | 실행 중인 컨테이너에서 새로운 명령/프로세스 실행 |

실무에서는 컨테이너가 계속 실행되는 상태에서 내부를 확인하거나 디버깅할 때 `docker exec`를 자주 사용할 수 있다.

---

# 22. 컨테이너 상태 확인

실행 중인 컨테이너를 확인한다.

```bash
docker ps
```

종료된 컨테이너를 포함하여 확인한다.

```bash
docker ps -a
```

### 차이

```bash
docker ps
```

현재 실행 중인 컨테이너만 표시한다.

```bash
docker ps -a
```

종료된 컨테이너까지 포함하여 모든 컨테이너를 표시한다.

---

# 23. Docker 로그 확인

실행된 컨테이너의 로그를 확인한다.

```bash
docker logs <container_name_or_id>
```

로그는 컨테이너 내부 애플리케이션이 출력한 정보를 확인할 때 사용할 수 있다.

---

# 24. Docker 리소스 확인

현재 실행 중인 컨테이너의 CPU 및 메모리 사용량 등을 확인한다.

```bash
docker stats
```

종료하려면:

```text
Ctrl + C
```

`docker stats`는 실행 중인 컨테이너의 리소스 사용량을 관찰할 수 있어 운영 및 문제 분석에 활용할 수 있다.

---

# 25. 커스텀 웹 서버 제작

이번 실습에서는 NGINX 이미지를 기반으로 정적 웹 페이지를 제공하는 커스텀 이미지를 제작한다.

선택한 베이스 이미지는 다음과 같다.

```text
nginx:alpine
```

NGINX를 직접 설치하는 대신 기존 NGINX 이미지를 베이스로 사용하고, 내가 작성한 HTML 파일을 이미지 내부의 웹 서버 디렉토리에 복사하는 방식을 사용한다.

---

# 26. 웹 서버 소스 작성

`app/index.html` 파일을 생성한다.

```bash
mkdir -p app
touch app/index.html
```

다음 내용을 작성한다.

```html
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Docker Web Server</title>
</head>
<body>
    <h1>Hello Docker!</h1>
    <p>My custom Docker web server is running.</p>
</body>
</html>
```

내용을 확인한다.

```bash
cat app/index.html
```

---

# 27. Dockerfile 작성

프로젝트 루트에 `Dockerfile`을 생성한다.

```dockerfile
FROM nginx:alpine

LABEL org.opencontainers.image.title="my-custom-nginx"

ENV APP_ENV=dev

COPY app/ /usr/share/nginx/html/
```

## Dockerfile 설명

### FROM

```dockerfile
FROM nginx:alpine
```

기존 NGINX Alpine 이미지를 베이스 이미지로 사용한다.

### LABEL

```dockerfile
LABEL org.opencontainers.image.title="my-custom-nginx"
```

이미지에 메타데이터를 추가한다.

### ENV

```dockerfile
ENV APP_ENV=dev
```

컨테이너 내부에서 사용할 환경 변수를 설정한다.

### COPY

```dockerfile
COPY app/ /usr/share/nginx/html/
```

호스트의 `app/` 디렉토리에 있는 웹 페이지를 NGINX가 정적 파일을 제공하는 디렉토리로 복사한다.

---

# 28. Docker 이미지 빌드

Dockerfile이 있는 프로젝트 루트에서 실행한다.

```bash
docker build -t my-custom-nginx:1.0 .
```

이미지가 생성되었는지 확인한다.

```bash
docker images
```

결과에서 다음 이미지가 존재하는지 확인한다.

```text
my-custom-nginx
```

---

# 29. 커스텀 컨테이너 실행

컨테이너 포트를 호스트 포트와 연결한다.

```bash
docker run -d \
  --name my-web \
  -p 8080:80 \
  my-custom-nginx:1.0
```

## 포트 매핑 의미

```text
-p 8080:80
```

은 다음을 의미한다.

```text
호스트 8080 포트
        ↓
컨테이너 80 포트
```

즉 브라우저에서:

```text
http://localhost:8080
```

으로 접속하면 컨테이너 내부의 NGINX 80번 포트에 접근하게 된다.

---

# 30. 컨테이너 상태 확인

```bash
docker ps
```

다음과 같은 포트 정보가 보이는지 확인한다.

```text
0.0.0.0:8080->80/tcp
```

---

# 31. 웹 서버 접속 검증

## 31.1 curl을 이용한 검증

```bash
curl http://localhost:8080
```

## 31.2 브라우저를 이용한 검증

브라우저 주소창에 다음 주소를 입력한다.

```text
http://localhost:8080
```

정상적으로 다음과 같은 페이지가 표시되는지 확인한다.

```text
Hello Docker!

My custom Docker web server is running.
```

---

# 32. 다른 호스트 포트로 동일 이미지 실행

동일한 이미지를 다른 호스트 포트에서도 실행한다.

```bash
docker run -d \
  --name my-web-8081 \
  -p 8081:80 \
  my-custom-nginx:1.0
```

확인:

```bash
docker ps
```


curl로 확인한다.

```bash
curl http://localhost:8081
```


### 확인 결과

하나의 Docker 이미지에서 두 개의 컨테이너를 실행하고 서로 다른 호스트 포트를 사용할 수 있음을 확인했다.

```text
my-web
    localhost:8080 → container:80

my-web-8081
    localhost:8081 → container:80
```

---

# 33. 포트 매핑이 필요한 이유

컨테이너의 네트워크는 호스트의 네트워크와 분리되어 있다.

따라서 컨테이너 내부에서 웹 서버가 `80`번 포트로 실행되고 있다고 해서 호스트에서 바로 `localhost:80`으로 접근할 수 있는 것은 아니다.

다음과 같이 포트를 연결해야 한다.

```bash
-p 8080:80
```

이는 다음과 같은 연결을 만든다.

```text
Host
localhost:8080
      │
      ▼
Docker Port Mapping
      │
      ▼
Container
:80
      │
      ▼
NGINX
```

포트 매핑을 사용하면 호스트에서 컨테이너 내부의 서비스에 접근할 수 있다.

---

# 34. 바인드 마운트 실습

바인드 마운트는 호스트의 특정 디렉토리를 컨테이너 내부 디렉토리에 연결하는 방식이다.

이를 이용하면 컨테이너 이미지를 다시 빌드하지 않고도 호스트의 파일 변경 사항을 컨테이너에 반영할 수 있다.

---

# 35. 바인드 마운트 실행

테스트용 디렉토리를 생성한다.

```bash
mkdir -p bind-site
```

HTML 파일을 생성한다.

```bash
cat > bind-site/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bind Mount Test</title>
</head>
<body>
    <h1>Before Change</h1>
</body>
</html>
EOF
```

내용을 확인한다.

```bash
cat bind-site/index.html
```

---

# 36. 바인드 마운트 컨테이너 실행

```bash
docker run -d \
  --name bind-web \
  -p 8082:80 \
  -v "$(pwd)/bind-site:/usr/share/nginx/html:ro" \
  nginx:alpine
```

상태 확인:

```bash
docker ps
```

웹 페이지 확인:

```bash
curl http://localhost:8082
```

실행 결과:

```html
[Before Change HTML 응답]
```

---

# 37. 호스트 파일 변경

호스트의 HTML 파일을 변경한다.

```bash
cat > bind-site/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bind Mount Test</title>
</head>
<body>
    <h1>After Change</h1>
    <p>Host file change is reflected in the container.</p>
</body>
</html>
EOF
```

변경 내용을 확인한다.

```bash
cat bind-site/index.html
```

다시 요청한다.

```bash
curl http://localhost:8082
```

실행 결과:

```html
[After Change HTML 응답]
```

### 검증 결과

컨테이너를 다시 빌드하거나 새 이미지를 만들지 않았지만 호스트의 파일 변경 사항이 컨테이너의 웹 서버에 반영되었다.

이는 호스트 디렉토리와 컨테이너 디렉토리가 바인드 마운트로 연결되어 있기 때문이다.

---

# 38. 바인드 마운트 구조

```text
Host
bind-site/
└── index.html
       │
       │ bind mount
       ▼
Container
/usr/share/nginx/html/
└── index.html
       │
       ▼
NGINX
       │
       ▼
localhost:8082
```

---

# 39. Docker 볼륨 실습

Docker 볼륨은 Docker가 관리하는 저장 공간이다.

컨테이너 내부에만 데이터를 저장하면 컨테이너를 삭제했을 때 데이터가 함께 사라질 수 있다.

반면 Docker 볼륨을 사용하면 컨테이너의 생명주기와 데이터를 분리할 수 있다.

즉:

```text
Container
    +
Volume
```

구조로 데이터를 보존할 수 있다.

---

# 40. Docker 볼륨 생성

볼륨을 생성한다.

```bash
docker volume create mydata
```

실행 결과:

```text
mydata
```

볼륨 목록을 확인한다.

```bash
docker volume ls
```

---

# 41. 볼륨 연결 컨테이너 실행

Ubuntu 컨테이너를 실행하면서 볼륨을 `/data`에 연결한다.

```bash
docker run -d \
  --name volume-test \
  -v mydata:/data \
  ubuntu \
  sleep infinity
```

컨테이너 상태를 확인한다.

```bash
docker ps
```

---

# 42. 볼륨에 데이터 저장

컨테이너 내부 `/data` 디렉토리에 파일을 생성한다.

```bash
docker exec volume-test \
  bash -lc 'echo "Persistent Docker Volume Data" > /data/hello.txt && cat /data/hello.txt'
```

실행 결과:

```text
Persistent Docker Volume Data
```

파일 존재 여부를 확인한다.

```bash
docker exec volume-test ls -la /data
```

---

# 43. 컨테이너 삭제

데이터가 볼륨에 저장되어 있는지 확인하기 위해 컨테이너를 삭제한다.

```bash
docker rm -f volume-test
```

컨테이너가 삭제되었는지 확인한다.

```bash
docker ps -a
```

---

# 44. 동일 볼륨을 새로운 컨테이너에 연결

새로운 컨테이너를 실행한다.

```bash
docker run -d \
  --name volume-test2 \
  -v mydata:/data \
  ubuntu \
  sleep infinity
```

기존 파일을 확인한다.

```bash
docker exec volume-test2 \
  bash -lc 'cat /data/hello.txt'
```

실행 결과:

```text
Persistent Docker Volume Data
```

---

# 45. Docker 볼륨 영속성 검증 결과

검증 과정은 다음과 같다.

```text
1. mydata 볼륨 생성
        ↓
2. volume-test 컨테이너에 연결
        ↓
3. /data/hello.txt 생성
        ↓
4. volume-test 컨테이너 삭제
        ↓
5. volume-test2 컨테이너 생성
        ↓
6. 동일한 mydata 볼륨 연결
        ↓
7. /data/hello.txt 확인
        ↓
8. 기존 데이터 유지 확인
```

따라서 컨테이너는 삭제되었지만 Docker 볼륨에 저장한 데이터는 유지되는 것을 확인했다.

---

# 46. Docker 운영 명령어 종합 검증

## 이미지 목록

```bash
docker images
```


## 실행 중인 컨테이너

```bash
docker ps
```

## 전체 컨테이너

```bash
docker ps -a
```


## 컨테이너 로그

```bash
docker logs my-web
```


## 컨테이너 리소스

```bash
docker stats
```

## 볼륨 목록

```bash
docker volume ls
```

---

# 47. 컨테이너 종료와 삭제

테스트가 끝난 컨테이너를 정리한다.

```bash
docker stop my-web
docker stop my-web-8081
docker stop bind-web
docker stop volume-test2
```

컨테이너 삭제:

```bash
docker rm my-web
docker rm my-web-8081
docker rm bind-web
docker rm volume-test2
```

확인:

```bash
docker ps -a
```

> `mydata` 볼륨은 영속성 검증을 위해 삭제하지 않는다.

---

# 48. Docker 이미지와 컨테이너의 관계 정리

Docker의 이미지와 컨테이너는 서로 다른 개념이다.

```text
Dockerfile
    │
    │ docker build
    ▼
Docker Image
    │
    │ docker run
    ▼
Docker Container
```

이미지는 실행 환경을 만들기 위한 템플릿이고, 컨테이너는 해당 이미지를 기반으로 실행되는 인스턴스이다.

하나의 이미지를 이용하여 여러 컨테이너를 실행할 수 있다.

예:

```text
my-custom-nginx:1.0
       │
       ├── my-web       → localhost:8080
       │
       └── my-web-8081  → localhost:8081
```

---

# 49. Git 기본 설정

Git 사용자 이름을 설정한다.

```bash
git config --global user.name "YOUR_NAME"
```

Git 이메일을 설정한다.

```bash
git config --global user.email "YOUR_EMAIL"
```

기본 브랜치를 `main`으로 설정한다.

```bash
git config --global init.defaultBranch main
```

---

# 50. Git 설정 확인

```bash
git config --list
```

또는 사용자 정보만 확인한다.

```bash
git config --global --list
```

실행 결과:

```text
[실제 git config 결과]

user.name=YOUR_NAME
user.email=YOUR_EMAIL
init.defaultbranch=main
```

> 이메일 주소 등 개인 정보가 제출 문서에 포함되는 것이 문제가 된다면 일부를 마스킹하여 기록한다.

---

# 51. Git Repository 초기화

프로젝트 루트에서 Git Repository를 생성한다.

```bash
git init
```


상태를 확인한다.

```bash
git status
```

---

# 52. Git 기본 흐름

Git은 작업 내용을 다음과 같은 흐름으로 관리한다.

```text
Working Directory
       │
       │ git add
       ▼
Staging Area
       │
       │ git commit
       ▼
Local Repository
       │
       │ git push
       ▼
GitHub Repository
```

### Working Directory

실제로 파일을 생성하고 수정하는 공간이다.

### Staging Area

다음 commit에 포함할 변경 사항을 선택하는 공간이다.

### Local Repository

내 컴퓨터에 있는 Git 저장소이다.

### GitHub Repository

원격 서버에 저장된 Repository로 협업 및 코드 공유에 활용한다.

---

# 53. 첫 번째 Git Commit

현재 변경 사항을 확인한다.

```bash
git status
```

모든 파일을 staging area에 추가한다.

```bash
git add .
```

상태를 다시 확인한다.

```bash
git status
```

commit한다.

```bash
git commit -m "feat: build development workstation"
```


commit 목록 확인:

```bash
git log --oneline
```


---

# 54. GitHub Repository 생성

GitHub에서 새로운 Repository를 생성한다.

Repository 이름 예시:

```text
dev-workstation
```

README는 로컬에서 작성했으므로 로컬 프로젝트를 GitHub에 연결하는 방식으로 진행한다.


---

# 55. GitHub 원격 저장소 연결

원격 저장소를 추가한다.

```bash
git remote add origin [본인의 GitHub Repository 주소]
```

원격 저장소가 정상적으로 등록되었는지 확인한다.

```bash
git remote -v
```

---

# 56. GitHub에 Push

현재 브랜치를 확인한다.

```bash
git branch
```

`main`이 아니라면 다음과 같이 변경할 수 있다.

```bash
git branch -M main
```

GitHub로 push한다.

```bash
git push -u origin main
```

GitHub Repository에서 파일이 정상적으로 올라갔는지 확인한다.

---

# 57. VSCode와 GitHub 연동

VSCode에서 프로젝트 디렉토리를 연다.

```bash
code .
```

VSCode에서 다음 항목을 확인한다.

* Source Control 패널에서 Git Repository 확인
* GitHub 계정 로그인 상태 확인
* 현재 Repository와 로컬 프로젝트 연결 확인
* 변경 사항 표시 확인
* commit 및 push 상태 확인


> 토큰, 비밀번호, 인증 코드 등의 민감한 정보가 화면에 표시되지 않도록 주의한다.

---

# 58. 보안 및 개인정보 보호

README, 로그, 스크린샷에는 다음 정보를 포함하지 않는다.

* GitHub Personal Access Token
* 비밀번호
* 개인키
* SSH Private Key
* 인증 코드
* API Key
* 기타 Secret

특히 다음과 같은 명령 실행 결과를 그대로 공개하지 않도록 주의한다.

```bash
cat ~/.ssh/id_rsa
```

또는:

```bash
cat ~/.ssh/id_ed25519
```

Private Key는 절대로 GitHub Repository에 업로드하지 않는다.

---

# 59. 트러블슈팅 1 - Docker 데몬 연결 문제

## 문제

Docker 명령을 실행했을 때 Docker 엔진에 연결할 수 없다는 오류가 발생할 수 있다.

예:

```text
Cannot connect to the Docker daemon
```

## 원인 가설

Docker CLI는 설치되어 있지만 Docker 엔진이 실행되지 않은 상태일 수 있다.

서울캠퍼스 환경에서는 `sudo` 권한 제한으로 일반적인 Docker 데몬 제어가 어려울 수도 있다.

## 확인

다음 명령을 실행한다.

```bash
docker --version
```

Docker CLI 버전은 정상적으로 출력되는지 확인한다.

그다음:

```bash
docker info
```

를 실행한다.

## 해결

OrbStack을 사용하는 환경이라면 OrbStack 애플리케이션이 실행되어 있는지 확인한다.

이후 다시:

```bash
docker info
```

를 실행한다.

정상적으로 Docker Engine 정보가 출력되면 문제를 해결한 것이다.


---

# 60. 트러블슈팅 2 - 포트 충돌

## 문제

웹 서버 컨테이너 실행 시 포트가 이미 사용 중이라는 오류가 발생할 수 있다.

예:

```text
port is already allocated
```

## 원인 가설

호스트의 `8080` 포트를 다른 프로그램 또는 기존 컨테이너가 사용하고 있을 가능성이 있다.

## 확인

현재 실행 중인 컨테이너를 확인한다.

```bash
docker ps
```

필요하면 포트 사용 여부를 확인한다.

```bash
lsof -i :8080
```

## 해결

기존 컨테이너가 사용하고 있다면 종료한다.

```bash
docker stop <container_name>
```

또는 다른 호스트 포트를 사용한다.

```bash
docker run -d \
  --name my-web-new \
  -p 8083:80 \
  my-custom-nginx:1.0
```

이 경우 접속 주소는:

```text
http://localhost:8083
```

이 된다.


---

# 61. 트러블슈팅 3 - 바인드 마운트 파일이 반영되지 않는 문제

## 문제

호스트의 HTML 파일을 변경했지만 컨테이너의 웹 페이지가 변경되지 않을 수 있다.

## 원인 가설

다음과 같은 문제가 있을 수 있다.

* 잘못된 호스트 경로 사용
* 잘못된 컨테이너 경로 사용
* 다른 컨테이너에 접속하고 있음
* 브라우저 캐시
* 마운트 옵션 오류

## 확인

컨테이너 실행 정보를 확인한다.

```bash
docker inspect bind-web
```

또는:

```bash
docker exec bind-web ls -la /usr/share/nginx/html
```

호스트 파일도 확인한다.

```bash
cat bind-site/index.html
```

## 해결

현재 작업 디렉토리를 기준으로 절대 경로를 사용한다.

```bash
docker run -d \
  --name bind-web \
  -p 8082:80 \
  -v "$(pwd)/bind-site:/usr/share/nginx/html:ro" \
  nginx:alpine
```

그리고 다시:

```bash
curl http://localhost:8082
```

를 실행한다.



# 64. 핵심 개념 정리

## 64.1 절대 경로와 상대 경로

절대 경로는 루트 디렉토리부터 전체 경로를 지정하며 현재 작업 디렉토리의 영향을 받지 않는다.

상대 경로는 현재 작업 디렉토리를 기준으로 경로를 지정한다.

예:

```text
절대 경로
/Users/user/dev-workstation/app/index.html

상대 경로
app/index.html
```

---

## 64.2 Linux 권한

Linux 파일 권한은 읽기, 쓰기, 실행 권한으로 구성된다.

```text
r = 4
w = 2
x = 1
```

예:

```text
755
```

는:

```text
7 = rwx
5 = r-x
5 = r-x
```

이므로:

```text
rwxr-xr-x
```

를 의미한다.

---

## 64.3 Docker 이미지와 컨테이너

이미지는 컨테이너를 생성하기 위한 실행 환경의 템플릿이고, 컨테이너는 이미지를 기반으로 실행되는 실제 인스턴스이다.

```text
Dockerfile
   ↓
Image
   ↓
Container
```

하나의 이미지에서 여러 컨테이너를 실행할 수 있다.

---

## 64.4 포트 매핑

컨테이너 내부 서비스에 호스트에서 접근하려면 포트 매핑이 필요할 수 있다.

```bash
-p 8080:80
```

의 의미는:

```text
Host 8080
   ↓
Container 80
```

이다.

---

## 64.5 바인드 마운트

바인드 마운트는 호스트의 특정 경로를 컨테이너 내부 경로와 직접 연결한다.

```text
Host Directory
      │
      ▼
Bind Mount
      │
      ▼
Container Directory
```

따라서 호스트의 파일을 변경하면 컨테이너에서 사용하는 파일에도 변경 사항이 반영될 수 있다.

---

## 64.6 Docker Volume

Docker Volume은 Docker가 관리하는 별도의 저장 공간이다.

컨테이너와 데이터를 분리할 수 있기 때문에 컨테이너를 삭제하더라도 볼륨에 저장된 데이터는 유지할 수 있다.

```text
Container 1
    │
    ▼
 Docker Volume
    │
    ▲
    │
Container 2
```

이 구조를 이용하면 컨테이너의 생명주기와 데이터의 생명주기를 분리할 수 있다.

---

## 64.7 Git과 GitHub

Git은 로컬에서 소스코드 변경 이력을 관리하는 버전 관리 시스템이다.

GitHub는 Git Repository를 원격에서 저장하고 공유하며 협업할 수 있도록 제공하는 플랫폼이다.

즉:

```text
Git
= 로컬 버전 관리

GitHub
= 원격 Repository + 협업 플랫폼
```

일반적인 작업 흐름은 다음과 같다.

```text
코드 작성
   ↓
git add
   ↓
git commit
   ↓
Local Repository
   ↓
git push
   ↓
GitHub Repository
```

---

# 65. 최종 결과

이번 미션에서는 개발 워크스테이션을 구성하기 위해 다음 과정을 직접 수행했다.

1. 터미널 기본 명령어를 이용하여 파일과 디렉토리를 관리했다.
2. 절대 경로와 상대 경로의 차이를 확인했다.
3. Linux 파일 및 디렉토리 권한을 확인하고 변경했다.
4. Docker CLI와 Docker Engine의 정상 동작 여부를 확인했다.
5. `hello-world` 및 `ubuntu` 컨테이너를 실행했다.
6. Docker 이미지와 컨테이너의 차이를 확인했다.
7. Dockerfile을 직접 작성하여 커스텀 NGINX 이미지를 제작했다.
8. 포트 매핑을 이용하여 컨테이너 웹 서버에 접근했다.
9. 바인드 마운트를 사용하여 호스트 파일 변경 사항이 컨테이너에 반영되는 것을 확인했다.
10. Docker Volume을 사용하여 컨테이너 삭제 후에도 데이터가 유지되는 것을 확인했다.
11. Git 사용자 정보 및 기본 브랜치를 설정했다.
12. Git Repository를 생성하고 commit 및 push를 수행했다.
13. GitHub 및 VSCode 연동을 확인했다.
14. 실제 수행 과정에서 발생한 문제와 해결 과정을 트러블슈팅으로 기록했다.

최종적으로 코드, 실행 환경, Docker 구성, 포트, 스토리지, Git/GitHub 설정을 하나의 Repository에서 재현할 수 있는 형태로 정리했다.

---

# 68. 전체 실습 수행 순서

실제 과제 수행 시 다음 순서로 진행한다.

```text
1. 프로젝트 디렉토리 생성
        ↓
2. pwd / ls / ls -la
        ↓
3. cd / mkdir / touch
        ↓
4. cat / cp / mv / rm
        ↓
5. chmod로 파일 권한 실습
        ↓
6. chmod로 디렉토리 권한 실습
        ↓
7. docker --version
        ↓
8. docker info
        ↓
9. docker images
        ↓
10. docker run hello-world
        ↓
11. ubuntu 컨테이너 실행
        ↓
12. docker ps / docker ps -a
        ↓
13. docker logs
        ↓
14. docker stats
        ↓
15. app/index.html 작성
        ↓
16. Dockerfile 작성
        ↓
17. docker build
        ↓
18. docker images 확인
        ↓
19. docker run -p 8080:80
        ↓
20. curl / 브라우저 접속
        ↓
21. 다른 포트 8081로 실행
        ↓
22. 바인드 마운트 실행
        ↓
23. 호스트 HTML 수정
        ↓
24. 변경 사항 반영 확인
        ↓
25. Docker Volume 생성
        ↓
26. Volume 연결 컨테이너 실행
        ↓
27. Volume에 데이터 저장
        ↓
28. 컨테이너 삭제
        ↓
29. 새 컨테이너에서 데이터 확인
        ↓
30. Git config
        ↓
31. git init
        ↓
32. git add
        ↓
33. git commit
        ↓
34. GitHub Repository 생성
        ↓
35. git remote add
        ↓
36. git push
        ↓
37. VSCode GitHub 연동
        ↓
38. 스크린샷 첨부
        ↓
39. 트러블슈팅 작성
        ↓
40. README 최종 검토
        ↓
41. GitHub Repository 제출
```

---

# 69. 제출 시 주의사항


## 69.2 스크린샷 확인

스크린샷에는 가능하면 다음 두 가지가 함께 보이도록 한다.

```text
명령어 입력
+
명령어 출력 결과
```

브라우저 접속 증거에는 반드시 주소창의 포트가 보이도록 한다.

예:

```text
http://localhost:8080
```

## 69.3 민감정보 확인

다음 정보가 포함되지 않았는지 최종 확인한다.

```text
GitHub Token
Password
API Key
SSH Private Key
인증 코드
개인키
```

민감정보가 발견되었다면 Repository에 push하기 전에 삭제하고, 이미 외부에 노출된 인증 정보라면 가능한 범위에서 폐기 또는 재발급한다.

---

# 70. 최종 제출 정보

## 주요 기술

```text
Linux CLI
Docker
Dockerfile
NGINX
Bind Mount
Docker Volume
Git
GitHub
VSCode
```


---

# 71. 결론

이번 미션을 통해 단순히 Docker 명령어를 실행하는 것을 넘어 개발 환경을 구성하고 재현하는 전체 흐름을 경험했다.

터미널을 통해 파일과 디렉토리를 관리하고 Linux 권한의 기본 원리를 확인했다.

Docker에서는 이미지와 컨테이너의 관계를 이해하고, `hello-world`와 Ubuntu 컨테이너를 실행하면서 컨테이너의 기본적인 생명주기와 운영 명령을 확인했다.

Dockerfile을 직접 작성하여 기존 `nginx:alpine` 이미지를 기반으로 커스텀 웹 서버 이미지를 제작했으며, 포트 매핑을 통해 호스트에서 컨테이너 내부의 웹 서버에 접근했다.

바인드 마운트 실습에서는 호스트 파일을 수정했을 때 컨테이너의 웹 페이지에 변경 사항이 반영되는 것을 확인했다.

Docker Volume 실습에서는 컨테이너를 삭제한 이후에도 동일한 볼륨을 새로운 컨테이너에 연결했을 때 기존 데이터가 유지되는 것을 확인했다.

마지막으로 Git을 이용하여 로컬 변경 이력을 관리하고 GitHub를 이용하여 원격 Repository에 코드를 공유함으로써 기본적인 협업 환경을 구성했다.

이를 통해 개발 환경을 단순히 "내 컴퓨터에서 실행되는 환경"으로 만드는 것이 아니라, 다른 환경에서도 동일한 방식으로 실행하고 검증할 수 있는 재현 가능한 개발 환경으로 구성하는 기본적인 사고방식을 익혔다.



## 7. 참고
https://chatgpt.com/share/6a7ae436-59ec-83ea-b675-e895c7b3acd8

