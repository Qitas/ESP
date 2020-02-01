# [template](https://github.com/Qitas/template) 

### [概述](https://github.com/Qitas/template/wiki) 

适用于linux项目的工程开发模板

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

[![sites](http://182.61.61.133/link/resources/head.png)](http://www.qitas.cn) 

## 锻造最美之器
