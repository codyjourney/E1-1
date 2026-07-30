FROM nginx:alpine

LABEL maintainer="myname" \
      version="1.1"

COPY html/index.html /usr/share/nginx/html/index.html

# ✅ mime.types 포함한 nginx 설정 추가
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1