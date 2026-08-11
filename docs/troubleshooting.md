## 1) 트러블슈팅

웹브라우저에서 HTML 소스가 그대로 나오는 현상

원인: 컨테이너가 서빙하던 index.html 파일 자체가 정상 HTML이 아니라, Apple(Cocoa) 문서에서 내보낸 형식으로 HTML 태그가 이스케이프(예: &lt;…&gt;)되어 텍스트로 들어있었습니다(파일에 Generator: Cocoa HTML Writer, Apple-converted-space, p.p1 등 표시). 따라서 브라우저에 소스가 그대로 보였습니다.
조치: E1-1/custom-nginx/html/index.html을 깨끗한(실제 HTML 태그가 그대로 있는) 파일로 교체하고 이미지를 재빌드/재시작하여 해결했습니다.
재발 방지: 편집기는 텍스트(또는 코드) 편집기(예: VS Code)로 열어 저장하거나, Pages/Word에서 복사한 내용을 반드시 "Plain Text"로 정리한 뒤 저장하세요. 컨테이너 내 파일 확인은 docker exec <컨테이너> cat /usr/share/nginx/html/index.html로 할 수 있습니다.