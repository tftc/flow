#Flow



安装方式

``
  curl -L -N https://raw.github.com/tftc/flow/master/install.sh | sh
``

##概念
flow 分支上线：分为feature、release、hotfix以及master；

**master** 永远与线上保持一致

**release** 1个release对应一个sprint的版本，每次上线按照release上线

**feature** 1个feature对应 (1...n) story，(1...n) task, (ps:**不允许单独上线**)

**hotfix**  线上bug修复，每次修复对应一hotfix

![Flow modle](https://raw.githubusercontent.com/tftc/flow/master/template/flow-model.png)




##形成flow项目

`flow init `进行项目初始化，如果当前目录已有git项目了会自动切换远程源等初始化工作，如果没有会自动新建一个flow项目;

##Feature

`flow feature help` 查看feature命令

* `flow feature start <name> [base]` 在本地库上以[Base]创建名为`<name>`的分支；
* `flow feature push [remoteName]` 把当前分支推送到远程, remoteName如果不填写，默认为远程分支名与当前分支名一致
* `flow feature track <remoteName> [name]` 更新远程分支代码到本地并以创建以name命名的新分支，name不填写，默认采用与remoteName一致
* `flow feature publish <name> <releaseName>` 把本地分支推送到远程的release分支, 远程分支必须存在


##Release
`flow release help`

* `flow release start <name> [base]`
* 
###未完待续





