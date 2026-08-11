FROM nginx:alpine

LABEL org.opencontainers.image.title="developer-workstation"

# 복사: 커스텀 nginx 설정을 컨테이너의 conf.d 기본 설정으로 덮어씀
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 복사: 사이트 컨텐츠
COPY html/index.html /usr/share/nginx/html/index.html

EXPOSE 80