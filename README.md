目录
===

<details>
<summary>点击展开目录菜单</summary>

<!-- vim-markdown-toc GFM -->

* [Install (安装)](#install-安装)
* [Uninstall (卸载)](#uninstall-卸载)
* [Upgrade Plugins (升级插件/vim8-pack特性)](#upgrade-plugins-升级插件vim8-pack特性)
* [Features (特色功能)](#features-特色功能)
    * [lightline (状态栏)](#lightline-状态栏)
    * [vim-buftabline (顶部状态栏)](#vim-buftabline-顶部状态栏)
    * [Backup (备份路径)](#backup-备份路径)
* [什么是Vim,为什么要使用Vim](#什么是vim为什么要使用vim)
    * [历史](#历史)
    * [帮助文档](#帮助文档)
    * [Vim的五种模式](#vim的五种模式)
    * [Vim的哲学](#vim的哲学)
* [Vim基本操作](#vim基本操作)
    * [打开/切换文件](#打开切换文件)
    * [退出/保存](#退出保存)
    * [编辑](#编辑)
    * [删除](#删除)
    * [移动](#移动)
    * [复制/粘贴](#复制粘贴)
    * [搜索](#搜索)
* [Vim进阶](#vim进阶)
    * [代码补全](#代码补全)
    * [拖动功能](#拖动功能)
    * [设置编码和格式](#设置编码和格式)
    * [代码折叠](#代码折叠)
    * [分割窗口](#分割窗口)
    * [宏](#宏)
* [Vim插件](#vim插件)
    * [配置语法](#配置语法)
    * [必装插件](#必装插件)
    * [vim-commentary操作命令](#vim-commentary操作命令)
* [Acknowledge](#acknowledge)

<!-- vim-markdown-toc -->
</details>


## Install (安装)

Install by conda:
```bash
conda install -c conda-forge vim
```

如果您之前有定制自己的`Vim`配置，**请先备份`~/.vim`目录**，以下操作会覆盖`~/.vim`目录
```bash
wget http://upos-sz-staticks3.bilivideo.com/appstaticboss/vim-vide-20200812.tgz && tar xvf ./vim-vide-20200812.tgz -C ~
```

## Uninstall (卸载)

如需恢复您原来的自定义配置，执行以下命令后，再将您原来的`.vim`目录还原至根目录即可
```bash
rm -rf ~/.vim
rm -rf ~/.vimtmp
```

## Upgrade Plugins (升级插件/vim8-pack特性)

```bash
git submodule update --recursive --remote
```

## Features (特色功能)

### lightline (状态栏)

lightline, much faster than airline or powerline!
(极其轻量化实现的状态栏，信息很全，比airline或者powerline快数倍！！！)

### vim-buftabline (顶部状态栏)
vim-buftabline show the buffer name, light!

### Backup (备份路径)

- 撤销文件夹 ~/.vimtmp/undodir
- 备份文件夹 ~/.vimtmp/backupdir
- 交换文件夹 ~/.vimtmp/directory .swp files

## 什么是Vim,为什么要使用Vim

### 历史

```bash
ed -> ex(sed) -> Vi -> Vim -> gVim / macvim
```

### 帮助文档

- `vimtutor`

  命令行直接运行，非Vim编辑器内命令

- `:h`

  Vim内部命令

### Vim的五种模式

1. 插入模式（和普通编辑器的模式差不多）

2. 普通模式

3. 可视模式

4. 命令行模式（扩展Vim的功能，Vim的精髓所在）

5. 选择模式（不常用）

### Vim的哲学

```bash
执行次数 + 操作 + 范围
次数 1,2,3
操作 v d c
范围 a i w p $ " ' { ( [ t

 ni hao tang jun xin
 $('nihao')
 <a href="xx" >kjkjk </a>
```

## Vim基本操作

### 打开/切换文件

| 命令                            | 功能                                                         |
| ------------------------------- | ------------------------------------------------------------ |
| `:e file_name` 、`:o file_name` | 打开文件                                                     |
| `:args file_name`               | 如果使用`vim file1 file2 [filen]`命令打开多个文件，就可以使用`:args file_name`命令在打开的文件之间切换 |
| `:buffers`、`:ls`、`files`      | 查看缓冲区中的文件列表                                       |
| `:bnext`                (ctrl+j)| 切换到下一个缓冲区文件                                       |
| `:bprevious`、`bpre`    (ctrl+k)| 切换到上一个缓冲区文件                                       |
| `:bfirst`                       | 切换到第一个缓冲区文件                                       |
| `:blast`                        | 切换到最后一个缓冲区文件                                     |
| `:bdelete file_name`    (ctrl+d)| 删除缓冲区文件                                               |
| `:badd file_name`               | 添加文件到缓冲区                                             |

### 退出/保存

| 命令        | 功能                                           |
| ----------- | ---------------------------------------------- |
| `:w`        | 保存                                           |
| `:w!`       | 强制保存，不退出Vim                            |
| `:q`        | 退出                                           |
| `:q!`       | 强制退出不保存                                 |
| `:wq`、`ZZ` | 保存并退出                                     |
| `:wq!`      | 强制保存，并退出                               |
| `:w file`   | 将修改另存到file中，不退出Vim                  |
| `:e!`       | 放弃所有修改，从上次保存文件开始再编辑命令历史 |

### 编辑

| 命令            | 功能                                                       |
| --------------- | ---------------------------------------------------------- |
| `i`/`I`         | 编辑                                                       |
| `esc`           | 退出编辑模式                                               |
| `u`             | 撤销操作                                                   |
| `<Ctrl> + r `   | 重做（恢复被撤销的动作）                                   |
| `cc` 、`C`、`S` | 清空当前行并进入编辑模式                                   |
| `s`             | 删除当前字符并进入编辑模式                                 |
| `r`             | 替换当前字符（替换后不进入编辑模式）                       |
| `R`             | 持续替换字符（不进入编辑模式），替换一个光标自动移到下一个 |
| `=-`            | 格式化当前行代码                                           |
| `gg=G`          | 格式化所有代码                                             |
| `<Shift> + v`   | 可视化多选                                                 |
| `:set mouse=a`  | 设置鼠标可区域选择，跟普通的编辑器一样可以进行拖选         |

### 删除

| 命令  | 功能                                        |
| ----- | ------------------------------------------- |
| `dd`  | 删除当前行                                  |
| `ndd` | 删除包含当前行的n行数据（从当前行往下删除） |
| `dG`  | 删除包含当前行及之后的全部行                |

### 移动

| 命令       | 功能                 |
| ---------- | -------------------- |
| `gg`       | 跳转到首行           |
| `G`        | 跳转到尾行           |
| `:n`、`nG` | 跳转到第n行          |
| `o`        | 在下一行插入         |
| `O`        | 在上一行插入         |
| `w`、`W`   | 移动到下一个单词开头 |
| `b`、`B`   | 移动到上一个单词开头 |
| `e`、`E`   | 移动到下一个单词结尾 |
| `{`        | 下一段落             |
| `}`        | 上一段落             |
| `M`        | 跳转到文件内容的中部 |
| `H`        | 跳转到文件内容的顶部 |
| `L`        | 跳转到文件内容的底部 |

### 复制/粘贴

| 命令     | 功能       |
| -------- | ---------- |
| `y`      | 复制       |
| `p`      | 粘贴到下部 |
| `P`      | 粘贴到上部 |
| `x`、`X` | 剪切       |

### 搜索

| 命令                     | 功能                              |
| ------------------------ | --------------------------------- |
| `f`  / `F`               | 当前行搜索，til，正向 / 反向      |
| `t` / `T`                | 当前行搜索，until，正向 / 反向    |
| `;`、`,`                 | 重复当前行搜索                    |
| `/`、`?`                 | 当前文件搜索，向上搜索 / 向下搜索 |
| `:grep -r` / `:!grep -r` | 跨文件搜索                        |
| `n`                      | 下一个匹配内容                    |
| `N`                      | 上一个匹配内容                    |
| `ctrl-L`                 | 清除搜索高亮                      |

## Vim进阶

### 代码补全

| 命令          | 代码         |
| ------------- | ------------ |
| `<Ctrl> + p ` | 往前搜索补全 |
| `<Ctrl> + n ` | 往后搜索补全 |
| `<Ctrl> + e ` | 取消补全     |
| `<Ctrl> + y ` | 确定补全     |

### 拖动功能

| 命令 | 功能                   |
| ---- | ---------------------- |
| `zz` | 将当前行定位到屏幕中间 |
| `zb` | 将当前行定位到屏幕底部 |
| `zt` | 将当前行定位到屏幕顶部 |

### 设置编码和格式

| 命令                           | 功能                                           |
| ------------------------------ | ---------------------------------------------- |
| `:set fileformat unix dos mas` | 让换行符自由切换                               |
| `:set fileencodings`           | 检测打开文档编码的顺序，一般设置为utf-8、cp936 |
| `:set fileencoding`            | 保存文档的编码，一般为utf-8                    |
| `:set encoding`                | Vim本身界面的编码，一般和文档无关              |

### 代码折叠

| 命令                    | 功能           |
| ----------------------- | -------------- |
| `zf`                    | 创建折叠       |
| `zo`                    | 打开折叠       |
| `zc`                    | 关闭折叠       |
| `:mkview` / `:loadview` | 保存，载入绘画 |

### 分割窗口

| 命令                                     | 功能                 |
| ---------------------------------------- | -------------------- |
| `:split [file_name]` 、`:sp [file_name]` | 水平分割             |
| `:vsplit [file_name]`、`:vs [file_name]` | 垂直分割             |
| `<Ctrl> + w + h`                         | 将焦点移动到左边窗口 |
| `<Ctrl> + w + j`                         | 将焦点移动到下方窗口 |
| `<Ctrl> + w + k`                         | 将焦点移动到上方窗口 |
| `<Ctrl> + w + l`                         | 将焦点移动到右边窗口 |

### 宏

| 命令 | 功能    |
| ---- | ------- |
| `qa` | 录制到a |
| `@a` | 播放a   |

## Vim插件

### 配置语法
`let ?:variable`
| 名称              | 选项                                               |
| ----------------- | -------------------------------------------------- |
| buffer-variable   | b:     Local to the current buffer.                |
| window-variable   | w:     Local to the current window.                |
| tabpage-variable  | t:     Local to the current tab page.              |
| global-variable   | g:     Global.                                     |
| local-variable    | l:     Local to a function.                        |
| script-variable   | s:     Local to a :source'ed Vim script.           |
| function-argument | a:     Function argument (only inside a function). |
| vim-variable      | v:     Global, predefined by Vim.                  |

### 必装插件

| 名称           | 功能                 |
| -------------- | -------------------- |
| ale            | 语法检查             |
| LeaderF        | 文件跳转             |
| vim-signify    | 观察git/svn状态      |
| vim-commentary | 强大的注释插件       |
| vim-surround   | 强大的括号辅助插件   |
| jedi-vim       | 强大的 Python 补全   |

### vim-commentary操作命令

| 快捷键 | 功能                               |
| ------ | ---------------------------------- |
| `gcc`  | 注释当前行（普通模式下）           |
| `gc`   | 注释当前选中内容（可视多选模式下） |
| `gcap` | 注释当前所在段落                   |
| `gcu`  | 注释上一次注释的部分               |
| `gcgc` | 取消一组相邻的注释                 |

## Acknowledge
[vim-view](https://github.com/bilibili/vim-vide)
[vim-one](https://github.com/rakr/vim-one)


