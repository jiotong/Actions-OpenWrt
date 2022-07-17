## SSH 连接操作 （SSH 在线修改和提取.config ）                                                                      


  Actions→ 选择 提取config.yml→ 然后单击Run workflow右侧的按钮。设置SSH connection to Actions 输入 true  点 Run workflow 运行

  页面运行到SSH connection to Actions 点击显示的连接 进入SSH

  （Web终端可能会遇到黑屏，只需按即可Ctrl+C）

   输入命令：cd openwrt && make menuconfig 进行个性化配置。

   完成后，按快捷键Ctrl+D或执行exit命令以退出，随后的编译工作将自动进行
   
---

## 生成TOKEN令牌

1 个人中心：设置→开发人员设置→个人访问令牌→生成新令牌

（名称：RELEASES_TOKEN，勾择：public_repo，复制RELEASES_TOKEN令牌的值）。

Settings → Developer settings → Personal access tokens → Generate new token

2 操作代码中心：设置→机密→新机密（名称：RELEASES_TOKEN，值：粘贴令牌的值）。

Settings → Secrets → New secret


      
## 电报推送消息

设置方法 https://github.com/danshui-git/shuoming/blob/master/bot.md


## 插件说明 CONFIG*PACKAGE*

恩山https://www.right.com.cn/forum/thread-3682029-1-1.html
