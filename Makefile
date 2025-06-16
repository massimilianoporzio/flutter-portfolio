BASE_HREF = '/flutter_portfolio_website/'
GITHUB_REPO = https://github.com/massimilianoporzio/flutter_portfolio_website.git
BUILD_VERSION := $(shell powershell -Command "try { (Select-String -Path pubspec.yaml -Pattern 'version:').Line.Split()[1] } catch { 'unknown' }")

build:
	echo Building version $(BUILD_VERSION)
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

	@echo "√ Deployment complete!"

.PHONY: deploy-web