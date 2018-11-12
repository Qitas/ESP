
# SETUP

- Install cmake, gcc & more...

```
sudo apt install cmake
```

```
# 这个动作只需要做一次，arm/mips/x86指不同的目标平台
./mk.all arm prepare
```

## Add new submodule to project

for example:
```
cd depends/
git submodule add git://git.0pointer.de/libdaemon libdaemon
```

## How to patch libs

创建补丁：

```
# 假设_libname.origin_是原始的库文件
# 假设_libname_是被修改过的库文件

cd depends/
mkdir patches/_libname_
mkdir patches/_libname_/arm

diff -uNr _libname_.origin_ _libname_ > patches/_libname_/arm/_libname_.patch
```

其中，-u 表示使用unified output format，统一输出格式，比较紧凑而且易读；
-N 用来处理新增的文件（此时参数对应的是目录）
-r 表示递归处理所有的子目录。
整条命令的意思是，递归比较original和updated两个工程中的所有文件，使用统一的输出格式，添加新增的文件，生成结果输出到 test.patch文件中。
其他常用的选项还有：-p 仅针对C程序有效，显示每个不同所对应的函数；-i 忽略大小写，对于大小写不敏感的场合使用，比如某些html文件；–exclude 表示排除某些文件或者目录，不做比较，适用于如代码包含cvs目录之类的场合。剩下的其他参数可以参考info或者help或者man。

应用补丁：

```
    cd depends/
    patch -lNp0 < patches/_libname_/arm/_libname_.patch
```

其中， -l的意思–ignore-whitespace，忽略空白字符；-N 表示 –forward，忽略已经打过或者已经取消的补丁(ignore patches that seem to be reversed or already applied)；-pnum 表示–strip=num，如果没有num参数，表示直接使用文件名，0表示全路径名，其他表示从左开始去除几个slash到，哪一级目录（cut slash count）.
整条命令的意思是，使用test.patch文件作为输入，忽略空白符号和已经处理过的补丁，保留patch文件中的包含文件的全路径名，对patch文件涉及到的文件做补丁。
其他常用的选项有：-i 指定使用的patch文件名，代替常用的命令行重定向；-R 反转（取消）patch。其他的可以查看帮助。


