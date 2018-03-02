#!/bin/sh

set -ex

build_site() {
  gulp sass
  bundle exec jekyll build
}

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout -b gh-pages
  git add _site
  git commit --message "Site rebuild: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GITHUB_TOKEN}@github.com/preslavrachev/preslavrachev.github.io.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages build
}

build_site
setup_git
commit_website_files
upload_files
