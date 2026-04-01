#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/bcefghj/comic-guide-skill"
SKILL_NAME="comic-guide"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${BLUE}[INFO]${NC} $*"; }
ok()    { echo -e "${GREEN}[OK]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()   { echo -e "${RED}[ERROR]${NC} $*"; }

banner() {
  echo ""
  echo -e "${BLUE}╔══════════════════════════════════════════╗${NC}"
  echo -e "${BLUE}║   🎨 comic-guide-skill 一键安装脚本     ║${NC}"
  echo -e "${BLUE}║   漫画风格图解生成器 (10+ 动漫风格)     ║${NC}"
  echo -e "${BLUE}╚══════════════════════════════════════════╝${NC}"
  echo ""
}

detect_platforms() {
  PLATFORMS=()
  if [ -d "$HOME/.cursor" ]; then
    PLATFORMS+=("cursor")
  fi
  if [ -d "$HOME/.claude" ]; then
    PLATFORMS+=("claude")
  fi
  if [ -d "$HOME/.openclaw" ] || command -v openclaw &>/dev/null; then
    PLATFORMS+=("openclaw")
  fi
  if [ ${#PLATFORMS[@]} -eq 0 ]; then
    PLATFORMS+=("cursor")
    warn "未检测到已安装的平台，将默认安装到 Cursor"
  fi
}

install_to_cursor() {
  local target="$HOME/.cursor/skills/$SKILL_NAME"
  info "安装到 Cursor: $target"
  mkdir -p "$target"
  copy_files "$target"
  ok "Cursor 安装完成！"
}

install_to_claude() {
  local target="$HOME/.claude/skills/$SKILL_NAME"
  info "安装到 Claude Code: $target"
  mkdir -p "$target"
  copy_files "$target"
  ok "Claude Code 安装完成！"
}

install_to_openclaw() {
  local target="$HOME/.openclaw/skills/$SKILL_NAME"
  info "安装到 OpenClaw: $target"
  mkdir -p "$target"
  copy_files "$target"
  ok "OpenClaw 安装完成！"
}

copy_files() {
  local dest="$1"
  local tmp_dir
  tmp_dir=$(mktemp -d)
  trap "rm -rf $tmp_dir" EXIT

  if command -v git &>/dev/null; then
    info "使用 git clone 下载..."
    git clone --depth 1 "$REPO_URL.git" "$tmp_dir/repo" 2>/dev/null
  elif command -v curl &>/dev/null; then
    info "使用 curl 下载..."
    curl -sL "$REPO_URL/archive/refs/heads/main.tar.gz" | tar xz -C "$tmp_dir"
    mv "$tmp_dir"/comic-guide-skill-main "$tmp_dir/repo"
  elif command -v wget &>/dev/null; then
    info "使用 wget 下载..."
    wget -qO- "$REPO_URL/archive/refs/heads/main.tar.gz" | tar xz -C "$tmp_dir"
    mv "$tmp_dir"/comic-guide-skill-main "$tmp_dir/repo"
  else
    err "需要 git、curl 或 wget 之一，请先安装"
    exit 1
  fi

  cp "$tmp_dir/repo/SKILL.md" "$dest/"
  [ -d "$tmp_dir/repo/references" ] && cp -r "$tmp_dir/repo/references" "$dest/"
  [ -d "$tmp_dir/repo/examples" ] && cp -r "$tmp_dir/repo/examples" "$dest/"

  trap - EXIT
  rm -rf "$tmp_dir"
}

main() {
  banner
  detect_platforms

  echo "检测到以下平台："
  for p in "${PLATFORMS[@]}"; do
    echo "  - $p"
  done
  echo ""

  if [ "${1:-}" = "--all" ]; then
    for p in "${PLATFORMS[@]}"; do
      case "$p" in
        cursor)  install_to_cursor ;;
        claude)  install_to_claude ;;
        openclaw) install_to_openclaw ;;
      esac
    done
  elif [ "${1:-}" = "--cursor" ]; then
    install_to_cursor
  elif [ "${1:-}" = "--claude" ]; then
    install_to_claude
  elif [ "${1:-}" = "--openclaw" ]; then
    install_to_openclaw
  else
    for p in "${PLATFORMS[@]}"; do
      case "$p" in
        cursor)  install_to_cursor ;;
        claude)  install_to_claude ;;
        openclaw) install_to_openclaw ;;
      esac
    done
  fi

  echo ""
  ok "安装完成！"
  echo ""
  echo "使用方法："
  echo "  在 AI 对话中输入："
  echo "    /comic-guide path/to/doc.md"
  echo "    /comic-guide path/to/doc.md --style naruto"
  echo ""
  echo "  或直接说："
  echo "    「请用哆啦A梦风格帮我图解这个文档」"
  echo ""
  echo "支持的风格：doraemon | naruto | onepiece | dragonball | spyfamily"
  echo "            chibi | guofeng | ghibli | shinchan | conan | custom"
  echo ""
}

main "$@"
