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


##形成flow项目

`flow init `进行项目初始化，如果当前目录已有git项目了会自动切换远程源等初始化工作，如果没有会自动新建一个flow项目;

##Feature

`flow feature help` 查看flow feature 命令

> `flow feature start` 开始一个本地项目，远程还没有此分支
> `flow feature pull [-r] <remote> [<name>]` 更新远程分支，要求本地分支名与远程分支名必须一致
> `flow feature push [<name>] <remoteName>` 把本地分支代码推送到远程,//TODO（是否需要支持本地创建远程分支?）
> `flow feature track <name> <remoteName>` 更新远程分支代码到本地并以创建以name命名的新分支
> `flow feature publish <name> <releaseName>` 把本地分支推送到远程的release分支, 远程分支必须存在


###未完待续





