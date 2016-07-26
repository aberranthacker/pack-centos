#!/bin/sh
if [ ! -d app-rails.cookbook ]; then
    git clone https://github.com/Fodoj/app-rails.cookbook.git
fi

rm -rf berks-cookbooks
berks vendor --berksfile=app-rails.cookbook/Berksfile

~/bin/packer build -force -parallel=false centos7_template.json

