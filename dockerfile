# Dockerfile
FROM nginx:alpine

# 커스텀 HTML 교체 (목적: 내 콘텐츠 서빙)
COPY app/index.html /usr/share/nginx/html/index.html

# 포트 명시 (목적: 문서화 및 가독성)
EXPOSE 80
