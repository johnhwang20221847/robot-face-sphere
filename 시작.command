#!/bin/zsh
# 로봇 얼굴 모션그래픽 실행: 로컬 서버를 켜고 Chrome 전체화면으로 엽니다.
cd "$(dirname "$0")"
PORT=8766
lsof -ti tcp:$PORT >/dev/null || (python3 -m http.server $PORT >/dev/null 2>&1 &)
sleep 1
open -na "Google Chrome" --args --new-window --kiosk --user-data-dir="$HOME/.robot_face_sphere_chrome" "http://localhost:$PORT"
