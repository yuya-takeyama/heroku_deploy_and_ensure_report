heroku_deploy_and_ensure_report
========

Description
-------------

`git push heroku master` and `return 1` if deploy failed.

Just a shell version of https://github.com/yuya-takeyama/heroku-deploy-wrap

Usage
-------

```sell
. ./heroku_deploy_and_ensure_report.sh
heroku_deploy_and_ensure_report || error
```

---

* Developed in bash(bsh mode)
* MIT License
* 2016
* Kenichi Kamiya
