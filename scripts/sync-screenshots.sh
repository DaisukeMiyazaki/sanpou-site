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

# hero.png は fastlane のカットではなく web 用に別途生成した透過画像のため、ここでは同期しない。
# 挿絵を差し替えたときは fastlane ディレクトリで以下を実行して置き換える:
#   magick -size 1200x1500 xc:none \
#     \( assets/hero.png -fuzz 4% -transparent white -resize 900x900 \) -gravity center -geometry +0+30 -composite \
#     -font '/System/Library/Fonts/ヒラギノ角ゴシック W6.ttc' -pointsize 92 -fill '#1D1D1F' -interline-spacing 14 \
#     -gravity north -annotate +0+50 'Life is busy.\nIdeas slip away fast.' \
#     -gravity south -annotate +0+70 'Sanpou can help.' hero.png
#
# canonical キー -> fastlane のカット名（連番付き）
KEYS=(
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
    # 素の画面（wiki・機能カード用）と framed（about 用）の両方を取得する
    fetch "$SRC/screenshots/$locale/${PREFIX}${cut}.png" "$dest/$key.png" && echo "  $key.png"
    fetch "$SRC/screenshots/$locale/${PREFIX}${cut}_framed.png" "$dest/$key-framed.png" && echo "  $key-framed.png"
  done
done
echo "done. review with: git status src/assets/screenshots"
