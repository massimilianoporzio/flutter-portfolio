BASE_HREF = '/flutter_portfolio_website/'
GITHUB_REPO = https://github.com/massimilianoporzio/flutter_portfolio_website.git
BUILD_VERSION := $(shell powershell -Command "try { (Select-String -Path pubspec.yaml -Pattern 'version:').Line.Split()[1] } catch { 'unknown' }")
# Definisci i colori come variabili per facilità d'uso
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
PURPLE = \033[0;35m
CYAN = \033[0;36m
WHITE = \033[0;37m
BOLD = \033[1m
NC = \033[0m  # No Color (reset)

# Variabile per UTF-8
PS_UTF8 = powershell -Command "[Console]::OutputEncoding=[Text.Encoding]::UTF8;


test-emoji:
	
	@echo -e "🔨 $(GREEN) Building version $(BUILD_VERSION)$(NC)"
	# your build commands here

deploy-web:
	@echo "Deploying Flutter web application..."

	@echo "Clean existing build results..."
	flutter clean
	
	@echo "Get dependencies..."
	flutter pub get
	
	@echo "Building Flutter web application..."
	flutter build web --release --base-href $(BASE_HREF) 
	
	@echo "Deploying to GitHub Pages..."
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M master && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin master

	cd ../..

	@echo "✅ Deployment complete!"

.PHONY: deploy-web
.PHONY: test-emoji