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

## 4. 검증 방법 + 결과 위치
- 터미널 기본 조작 및 폴더 구성
상세 로그: [터미널 조작 로그](./docs/terminal-log.md)
- 권한 변경 실습
-rwxr-xr-x
 ↑↑↑↑↑↑↑↑↑
 │└──┘└──┘└──┘
 │ 소유자  그룹  others
 │
 └ 파일 종류 (- = 파일, d = 디렉토리)
숫자	의미	기호
7	읽기+쓰기+실행	rwx
6	읽기+쓰기	rw-
5	읽기+실행	r-x
4	읽기만	r--
0	권한 없음	---
상세 로그: [권한 실습 및 증거](./docs/terminal-log.md)
- Docker 설치/점검
상세 로그: [Docker 설치/점검](./docs/docker-log.md)
운영 명령 요약
| 분류 | 명령어 | 설명 |
|------|--------|------|
| 이미지 | `docker pull` | 이미지 다운로드 |
| 이미지 | `docker images` | 이미지 목록 확인 |
| 컨테이너 | `docker run` | 컨테이너 실행 |
| 컨테이너 | `docker ps` | 실행 중 목록 |
| 컨테이너 | `docker ps -a` | 전체 목록 |
| 운영 | `docker logs` | 로그 확인 |
| 운영 | `docker stats` | 리소스 확인 |
| 정리 | `docker stop` | 컨테이너 중지 |
| 정리 | `docker rm` | 컨테이너 삭제 |
- hello-world 실행
상세 로그: [hello-world 실행](./docs/docker-log.md)
- Dockerfile 빌드/실행
상세 로그: [Dockerfile 빌드/실행](./docs/docker-log.md)
- 포트 매핑 접속(2회)
상세 로그: [포트 매핑 접속(2회)](./docs/docker-log.md)
상세 스크린샷: (./screenshots/)
- 바인드 마운트 반영
상세 로그: [바인드 마운트 반영](./docs/docker-log.md)
- 볼륨 영속성
상세 로그: [볼륨 영속성](./docs/docker-log.md)
Bind Mount vs Volume 정리
구분	Bind Mount	Docker Volume
데이터 위치	호스트 경로 직접 지정	Docker가 관리
주요 목적	개발 중 소스 변경 반영	데이터 영속성
예시	./mount-test:/usr/share/nginx/html	workstation-data:/data
호스트 파일 직접 접근	쉬움	직접 관리하지 않는 것이 일반적
컨테이너 삭제 후 데이터	호스트에 남음	Volume이 남아 있으면 유지
Docker 역시 bind mount는 호스트와 컨테이너 사이 파일 공유에, volume은 지속적인 데이터 저장에 적합하다고 설명합니다.

- Git 설정 + GitHub 연동
상세 로그: [Git 설정 및 GitHub 연동](./docs/git-log.md)
상세 스크린샷: (./screenshots/Git.png)
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


## 5. 트러블슈팅
상세 로그: [트러블슈팅 로그](./docs/troubleshooting.md)


## 6. 참고
https://chatgpt.com/share/6a7ae436-59ec-83ea-b675-e895c7b3acd8

