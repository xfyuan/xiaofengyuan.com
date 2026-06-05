# 定义伪目标
.PHONY: all lint lint-yaml lint-md lint-ac fix fix-md fix-ac help

# 匹配模式 (依赖 .markdownlintignore 进行忽略)
MD_FILES = "_pages/*.md" "_posts/*.md"

# 默认目标
all: help

# ==============================================================================
# 🔍 静态检查 (Linting)
# ==============================================================================
lint: lint-yaml lint-md lint-ac
	@echo "🎉 所有 Lint 检查完成！"

lint-yaml:
	@echo "🔍 [1/3] 检查 YAML (yamllint)..."
	yamllint .

lint-md:
	@echo "🔍 [2/3] 检查 Markdown (markdownlint)..."
	markdownlint-cli2 $(MD_FILES)

lint-ac:
	@echo "🔍 [3/3] 检查排版 (autocorrect)..."
	autocorrect --lint

# ==============================================================================
# 🔧 自动修复 (Fixing)
# ==============================================================================
fix: fix-md fix-ac
	@echo "✨ 自动修复完成！(YAML 需手动修复)"

fix-md:
	@echo "🔧 [1/2] 修复 Markdown..."
	markdownlint-cli2 --fix $(MD_FILES)

fix-ac:
	@echo "🔧 [2/2] 修复排版..."
	autocorrect --fix

# ==============================================================================
# ℹ️ 帮助
# ==============================================================================
help:
	@echo "📖 Jekyll 项目检查命令："
	@echo ""
	@echo "代码质量："
	@echo "  make lint       - 运行所有检查"
	@echo "  make fix        - 自动修复格式错误"
	@echo ""
