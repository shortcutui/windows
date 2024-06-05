# windows

这是[SUI](https://github.com/shortcutui/sui)在windows上的一个实现. 该实现基于norman布局, 现在如果要在qwerty布局下使用, 需要对一些按键绑定稍做调整.

> [!WARNING]
> 该实现仍然在开发中, 虽然我自己日常使用已经比较稳定, 但这是基于norman布局设置的键位, 如果要在qwerty布局下体验, 现在需要自行在kanata.kbd中自行对键位做一些修改.
> 使用鼠标接口时要注意, 目前的实现会在退出时自动把鼠标隐藏, 通过[SUI的鼠标接口](https://github.com/shortcutui/sui?tab=readme-ov-file#mouse-interface)可以显示鼠标, 如果不喜欢这个特性, 可以在sui.ahk文件中找到SystemCursor方法, 把它注释掉即可. 直接关掉sui.ahk也可以显示鼠标.

## 依赖

下表是必须的依赖项

- [komorebi](https://github.com/LGUG2Z/komorebi)是windows上的平铺式窗口管理器
- [kanata](https://github.com/jtroo/kanata)是跨平台的用户层按键修改工具
- [AutoHotkey](https://www.autohotkey.com)是windows上的按键修改工具

下表是可选的依赖项目

- [win32yank]() 这是一个命令行剪切板工具, 也可以用其它的代替, 如果有安装windows下的neovim会附带一个
- [ScreenToGif]() 这是gif的录制工具, 用来录制gif图像
- [CapsWriter]() 这是语音转文字的工具, 目前绑定在ctrl+u
- [搜狗输入法]目前输入法切换只适配了搜狗, 在某些vim模式的应用中, 为了方便写中文, esc会自动切换输入法

## 安装

> ahk请使用1.x的最后一版, 启动时如果ahk碰到编码问题弹了个乱码的弹窗启动不起来, 需要把系统编码调整成utf8编码.
> 在apps目录里面的ahk都是可选的, 不过要注意, 如果需要删掉, 要把sui.ahk里面的Include语句一起删掉.
> kanata的安装必须安装可以使用命令的变体
> 最好通过管理员来启动bat
> 最好是在komorebi.json里面找到app_specific_configuration_path_TODO字段, 把后面的_TODO去掉,
并且把它的值改成你的目录中的applications.yaml的路径.

首先克隆本仓库 ,安装几个必须的依赖中的软件, komorebi, kanata和AutoHotkey.
安装好以后, 用管理员分别启动startsui.bat, startahk.bat.
其中startahk.bat会在托盘区域启动一个ahk脚本, startsui.bat会开两个cmd窗口,要停止的话分别把这些干掉即可.


## 卸载

如果你体验下来感觉不好, 该实现是纯净绿色版. 只需要停止sui并把整个目录删除即可.
