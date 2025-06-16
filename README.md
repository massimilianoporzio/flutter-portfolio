# portfolio

A new Flutter project.

## Deploying

flutter clean
flutter pub get

flutter build web --base-href /flutter_portfolio_website/ --release
cd build/web
git init
git add .
git commit -m "Deploy 2"
git remote add origin https://github.com/massimilianoporzio/flutter_portfolio_website.git
git push -u --force origin master
