#!/bin/bash
# 把 学习资料 里的笔记同步到 robotics-journey 仓库
# 用法：cd /d/~LeoWu/robotics-journey && bash sync.sh

SRC="/d/~LeoWu/学习资料"
DST="/d/~LeoWu/robotics-journey"

n=0
copy() {
  if [ -d "$1" ]; then
    mkdir -p "$DST/$2"
    for f in "$1"/*.md; do
      [ -e "$f" ] || continue
      cp "$f" "$DST/$2/" && echo "  → $2/$(basename "$f")" && n=$((n+1))
    done
  fi
}

echo "同步中..."
copy "$SRC/01-日志"                    "00-log"
copy "$SRC/02-机械"                    "01-mechanical"
copy "$SRC/02-机械/W01"                "01-mechanical/W01"
copy "$SRC/02-机械/W01/干涉检查练习"    "01-mechanical/W01"
copy "$SRC/02-机械/W01/motion分析"      "01-mechanical/W01"
copy "$SRC/02-机械/Simulation"         "01-mechanical"
copy "$SRC/03-软件"                    "02-software"
copy "$SRC/03-软件/Keyshot"            "02-software"
copy "$SRC/04-系统"                    "03-system"

echo ""
echo "已同步 $n 个文件。"
echo ""
echo "接下来自己敲："
echo "  git status"
echo "  git add ."
echo '  git commit -m "说明"'
echo "  git push"
