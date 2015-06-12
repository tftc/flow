#Flow



##安装方式

``
  curl -L -N https://raw.github.com/tftc/flow/master/install.sh | sh
``

##概念

flow用于git的分支流程管理；以下几个概念：

###发布版本

规范采用与[**语义化版本**](http://semver.org/lang/zh-CN/)保持一致。

版本号： v主版本号.次版本号.修订号 
主版本号：对于模块来说是否做了不兼容API的修复，应用来说是否做了架构变更；
次版本号：功能性新增，对应每次release的发布，次版本号API需要保持向下兼容性;
修订号：缺陷功能修复，修订号最低为0；


###master

  线上运行环境的代码版本；
  
###feature

  为啥需要feature？在项目实际开发协作过程中，存在以下几种情况
  1. 很多feature是并行开发的；
  2. 同时开发的feature不意味着上线时间是一起的，一些feature先上线，一些feature延迟上线，一些紧急feature加入上线；
  3. 可能存在超长feature情况，这个分支可能会存在很长时间
  所以需要有feature分支，某个任务或者故事点用此分支；那么就存在着feature下会有多个分支的情况；
  
  分支命名：**feature/分支名** 前缀为feature，分支名为当前任务命名；具体名称视情况而定，名称可以为story，也可以为task；
  
  feature不允许直接发布，发布必须按照release方式。

###release

  项目上线一定会有先后顺序，当我们知道本次上线的时候，我们就会建立出一个release分支；可以选择性的将本次需要上线feature合并到当前release分支中；
  分支命名：**release/分支名** ，前缀为release；分支名为待发布版本，版本命名规则见版本章节；


###hotfix

  紧急线上修复使用此分支，每次修复对应一次hotfix分支；
  分支命名：**hotfix/分支名**，前缀为hotfix；分支名为本次修复版本号，由于是修复所以应该是对线上的某次发布的版本进行修复，按照语义化版本的规约修订号加1，所以应该是某次发布的版本的修订号+1；举例：v1.2.0是目前版本，那么这个版本本次的hotfix应该是v1.2.1;
  

##使用实践 


###推荐实践

1. 每个任务使用feature；任务名称取名尽量能完整表达本次任务的意义；每个feature均从master中checkout；如果有长期的feature分支，建议每天均合并下master内容，防止最后一次合并内容过多；测试环境可以对feature直接测试；
2. 需要发布的时候创建本次发布的release，release从master中checkout；将需要上线的功能合并到release；如果知道本次上线计划建议测试时候统一使用本次relase进行测试；

###图例

![Flow modle](https://raw.githubusercontent.com/tftc/flow/master/template/flow-model.png)


##形成flow项目

`flow init `进行项目初始化，新建或将已有git项目转成支持flow;

##feature

* `flow feature help` 帮助信息
* `flow feature start <name> [base]` 从`[base]`checkout `<name>`分支；`[base]` 默认为 **master**
* `flow feature push [remoteName]` 把当前分支push到远程, `[remoteName]`默认取当前分支名；
* `flow feature track <remoteName> [name]` 将远程`<remoteName>`分支checkout到本地，`[name]`默认为`<remoteName>`
* `flow feature publish <name> <releaseName>` 将`<name>`合并到本次待发布`<releaseName>`中


##release
* `flow release help` 帮助信息
* `flow release start <version> [base]` 从`[base]`checkout `<version>`分支；base缺省值为 **master**；注意：使用codeReview时候不使用
* `flow feature push [remoteVersion]` 把当前分支push到远程, `[remoteVersion]`如果不填写，默认为远程分支名与当前分支名一致
* `flow release track <remoteVersion> [version]` 把远程`<remoteversion>`分支checkout到本地，`[version]`默认为`<remoteVersion>`
* `flow release publish <version>` 发布`<version>`到远程，`<version>`为必填参数。实际会生成tag名为version,且会推送到远程; 如果同一个version发布多次会出现名为`<version>-build.num`, num最小数字为1，每次发布递增+1；
* `flow release finish <remoteVersion>` 终结本次`<remoteVersion>`；当线上验证通过后使用此命令，该命令会将`<remoteVersion>`合并到 master；



##hotfix
* `flow hotfix help` 帮助信息
* `flow hotfix start <version> [base]` 从`[base]`checkout `<version>`分支；base缺省值为 **master**；注意：使用codeReview时候不使用
* `flow hotfix push [remoteVersion]` 把当前分支push到远程, `[remoteVersion]`如果不填写，默认为远程分支名与当前分支名一致
* `flow hotfix track <remoteVersion> [version]` 把远程`<remoteversion>`分支checkout到本地，`[version]`默认为`<remoteVersion>`
* `flow hotfix publish <version>` 发布`<version>`到远程，`<version>`为必填参数。实际会生成tag名为version,且会推送到远程; 如果同一个version发布多次会出现名为`<version>-build.num`, num最小数字为1，每次发布递增+1；
* `flow hotfix finish <remoteVersion>` 终结本次`<remoteVersion>`；当线上验证通过后使用此命令，该命令会将`<remoteVersion>`合并到 master；





