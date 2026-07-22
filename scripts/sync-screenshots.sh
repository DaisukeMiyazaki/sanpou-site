#!/usr/bin/env bash
# fastlane で生成した機能スクショを sanpou-site の src/assets/screenshots/<locale>/ に
# canonical 名でコピーする。差し替えはこのスクリプトを再実行して commit するだけ。
#
# 使い方:
#   scripts/sync-screenshots.sh                 # en-US を同期
#   scripts/sync-screenshots.sh en-US ja        # 複数ロケール
#   RUNNER=user@host scripts/sync-screenshots.sh # 取得元を変更
#
# 取得元はランナー機（fastlane を実行したマシン）。ローカルで撮った場合は
# RUNNER を空にし SRC をローカルの fastlane ディレクトリに向ける。
set -euo pipefail

RUNNER="${RUNNER-daisuke@macbook-pro-1.woodpecker-court.ts.net}"
SRC="${SRC-ci/sanpou/fastlane}"                  # fastlane ディレクトリ（リモートは $HOME 相対）
PREFIX="iPhone 17 Pro Max-"
DEST_ROOT="$(cd "$(dirname "$0")/.." && pwd)/src/assets/screenshots"

LOCALES=("$@")
[ ${#LOCALES[@]} -eq 0 ] && LOCALES=("en-US")

# canonical キー -> fastlane のカット名（連番付き）
KEYS=(
  "hero:00_Hero"
  "memo-list:01_MemoList"
  "map:03_Map"
  "presentations:04_Presentations"
  "memo-input:05_MemoInput"
  "ocr:06_OCRCrop"
  "lockscreen:08_LockScreen"
)

# リモートかローカルかでコピー方法を切り替える
fetch() { # $1=パス $2=ローカル出力先
  if [ -n "$RUNNER" ]; then
    # ファイル名にスペースがあるためリモートシェル向けにエスケープする
    scp -q "$RUNNER:${1// /\\ }" "$2"
  else
    cp "$1" "$2"
  fi
}

for locale in "${LOCALES[@]}"; do
  dest="$DEST_ROOT/$locale"
  mkdir -p "$dest"
  echo "→ $locale"
  for pair in "${KEYS[@]}"; do
    key="${pair%%:*}"; cut="${pair#*:}"
    # hero は framed のみ。それ以外は raw と framed の両方を取得
    if [ "$key" = "hero" ]; then
      fetch "$SRC/screenshots/$locale/${PREFIX}${cut}_framed.png" "$dest/$key.png" && echo "  $key.png"
    else
      fetch "$SRC/screenshots/$locale/${PREFIX}${cut}.png" "$dest/$key.png" && echo "  $key.png"
      fetch "$SRC/screenshots/$locale/${PREFIX}${cut}_framed.png" "$dest/$key-framed.png" && echo "  $key-framed.png"
    fi
  done
done
echo "done. review with: git status src/assets/screenshots"
