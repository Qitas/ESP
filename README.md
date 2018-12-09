# [structure](https://github.com/Qitas/structure) 

### [概述](https://github.com/Qitas/structure/wiki) 

用于linux项目开发模板

### 目录

- source     : 项目用到的资源的源文件存档
- project    : 项目应用程序，每个子文件夹是一个独立的进程
- common     : 全部项目都有可能用到的公共头文件
- depends    : 项目依赖的外部库（尽量用git submodule形式引入）
- example    : 有重要参考意义的例子代码
- system     : 与bootloader/system/rootfs相关的配置与代码
- output     : 生成的目标文件、库与配置数据（分不同平台）
- scripts    : 编译过程中用到的一些脚本
- utils      : 在主机上使用的工具类程序（例如格式转换工具）
- docs       : 项目的相关文档（markdown）


### 说明

- programs/appmain   : 主应用程序
- programs/appxxx    : xxx program
- depends/libsample  : sample库
- README.md          : it's me!



### GIT

- git commit should follow rules:
 + [commit msg](http://karma-runner.github.io/0.12/dev/git-commit-msg.html)
 + [git usage](http://www.ruanyifeng.com/blog/2015/08/git-use-process.html)
 + [branches(CN)](http://www.ruanyifeng.com/blog/2012/07/git.html)
 + [branches(EN)](http://nvie.com/posts/a-successful-git-branching-model/)
 + [merge](http://scottchacon.com/2011/08/31/github-flow.html)
 + [merge](http://sandofsky.com/blog/git-workflow.html)

 ---

## 锻造最美之器

[![sites](qitas/qitas.png)](http://www.qitas.cn)


## 为锻造最美之器

[![sites](qitas/qitas.png)](http://www.qitas.cn)