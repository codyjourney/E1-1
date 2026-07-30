## 실행 환경

### 실행 환경 명령어 기록
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



## 터미널 조작 로그

### 명령어 실습 기록

#### 1. 현재 위치 확인
% pwd
/home/[user]/Desktop/app

#### 2. 목록 확인 (숨김 파일 포함)
% ls -la
total 40
drwx------+ 10 [user]  [user]   320  7 30 20:47 .
drwxr-x---+ 29 [user]  [user]   928  7 30 20:49 ..
-rw-r--r--@  1 [user]  [user]  8196  7 30 20:52 .DS_Store
drwxr-xr-x  13 [user]  [user]   416  7 30 20:52 .git
-rw-r--r--   1 [user]  [user]     0  7 30 19:34 .localized
drwxr-xr-x   3 [user]  [user]    96  7 30 19:57 app
-rw-r--r--@  1 [user]  [user]   201  7 30 20:50 dockerfile
drwxr-xr-x   5 [user]  [user]   160  7 30 20:47 docs
-rw-r--r--@  1 [user]  [user]  1390  7 30 20:38 README.md
drwxr-xr-x   2 [user]  [user]    64  7 30 20:37 screenshots

#### 3. 디렉토리 이동
% cd app
% pwd
/home/[user]/Desktop/app

#### 4. 디렉토리 생성
% mkdir -p practice   
% ls
hello		index.html	practice

#### 5. 파일 내용 확인
% touch practice/hello.txt
% echo "Hello" > practice/hello.txt
% cat practice/hello.txt           
Hello

#### 6. 파일 복사
% cp practice/hello.txt practice/hello_copy.txt
% cd practice 
% ls
hello_copy.txt	hello.txt
% cat hello.txt
Hello

#### 7. 이동/이름변경
% mv hello_copy.txt hello_renamed.txt 
% ls         
backup			hello_renamed.txt	hello.txt
% mkdir -p backup
% mv hello_renamed.txt backup/
% cd backup 
% ls
hello_renamed.txt

#### 8. 삭제
% ls 
hello		index.html	practice
% rm practice/backup/hello_renamed.txt
% rm -r practice
% ls
hello		index.html



## 권한 실습 및 증거

### 파일 권한 변경 (hello.txt)

#### 변경 전
% ls -la hello.txt
-rw-r--r--  1 [user]  [user]  0  7 30 21:27 hello.txt

#### 권한 변경
% chmod 755 hello.txt

#### 변경 후
% ls -la hello.txt   
-rwxr-xr-x  1 [user]  [user]  0  7 30 21:27 hello.txt


### 디렉토리 권한 변경 (mydir)

#### 변경 전
% ls -la | grep mydir
drwxr-xr-x   2 [user]  [user]   64  7 30 21:30 mydir

#### 권한 변경
% chmod 700 mydir

#### 변경 후
% ls -la | grep mydir
drwx------   2 [user]  [user]   64  7 30 21:30 mydir





