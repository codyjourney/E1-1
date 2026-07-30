## 1) 프로젝트 개요
개발의 첫 단추인 터미널, Docker, Git 을 직접 구축하여 "내 컴퓨터에서만 작동하는 문제"를 해결하고, 누구나 동일하게 실행·배포·디버깅할 수 있는 재현 가능한 개발 환경 생성

## 2) 실행 환경
- OS: macOS 15.7.4
- Shell: zsh
- Docker: 25.8.2
- Git: 2.53.0

## 3) 수행 체크리스트
- [x] 터미널 기본 조작 및 폴더 구성
- [x] 권한 변경 실습
- [x] Docker 설치/점검
- [x] hello-world 실행
- [x] Dockerfile 빌드/실행
- [x] 포트 매핑 접속(2회)
- [x] 바인드 마운트 반영
- [x] 볼륨 영속성
- [x] Git 설정 + VSCode GitHub 연동

## 4. 검증 방법 + 결과 위치
| 항목 | 검증 명령 | 결과 위치 |
|------|-----------|-----------|
| 포트 매핑 | curl http://localhost:8080 | screenshots/port-8080.png |
| 볼륨 영속성 | docker exec ... cat /data/... | docs/docker-log.md#볼륨 |

## 5. 트러블슈팅
- 문제 1: [제목]
- 문제: ...
- 원인 가설: ...
- 확인: ...
- 해결/대안: ...

- 문제 2: [제목]
- 문제: ...
- 원인 가설: ...
- 확인: ...
- 해결/대안: ...


## 3) 수행 로그(발췌)
- 실행 환경
% sw_vers
ProductName:		macOS
ProductVersion:		15.7.4
BuildVersion:		24G517
% echo $SHELL
/bin/zsh
% docker --version
Docker version 28.5.2, build ecc6942
% git --version
git version 2.53.0

- 실행 환경

