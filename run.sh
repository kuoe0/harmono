#! /bin/bash
#
# run.sh
# Copyright (C) 2015 KuoE0 <kuoe0.tw@gmail.com>
#
# Distributed under terms of the MIT license.
#

SED="sed"
if which gsed &> /dev/null; then
  SED="gsed"
fi

curl -s "https://pages.github.com/versions.json" > /dev/null
if [ "$?" -eq "0" ]; then
  curl -s "https://pages.github.com/versions.json" > gh-pages-versions.json
fi

if [[ "$1" = "debug" ]]; then
  bundle exec jekyll serve --watch --config "_config.yml,_config-dev.yml" -V
else
  bundle exec jekyll serve --watch --config "_config.yml,_config-dev.yml"
fi
