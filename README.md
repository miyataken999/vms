# VMS
[![Build Status](https://travis-ci.org/ericjjj/vms.svg?branch=master)](https://travis-ci.org/ericjjj/vms)
[![Code Climate](https://codeclimate.com/repos/58edfcb0bab24b0265000e3b/badges/be1cc8f745e432cd57ec/gpa.svg)](https://codeclimate.com/repos/58edfcb0bab24b0265000e3b/feed)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](LICENSE)


It is used by [GeekPark](http://geekpark.net)

Current version: https://github.com/GeekPark/gpk_admin

Contact: github@ericjj.com

### ENV
* Node.js 6+
* MongoDB 3+

### Features

* Vue.js 2+
* Element UI
* WYSIWYG Editor
* Markdown Editor
* Upload pictures to qiniu
* Node.js backend
* Role access control
* Easy to deploy

### How to Start

```bash
# clone project
git clone https://github.com/ericjjj/vms.git

# start backend, need mongodb
cd backend/utils
# modify config.js (qiniu)
cp config.simple.js config.js
cd ..
# start
NODE_ENV=dev node index.js

# start websites
cd frontend/src
# modify config.js (qiniu)
cp config.simple.js config.js
cd ..
# start
npm run dev
```

### Deploy
```bash
cd frontend
# build static files
npm run build
cd backend
# modify processes.json
# see http://pm2.keymetrics.io/docs/usage/deployment/
pm2 deploy processes.json production setup
# cp config.simple.js config.js
pm2 deploy processes.json production
```


### Test
```bash
cd backend
npm run test
```


### LICENSE
MIT



