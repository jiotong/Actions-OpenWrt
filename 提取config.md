## SSH 连接操作 （SSH 在线修改和提取.config ）                                                                      

 进入Actions，选择提取config.yml，然后单击Run workflow，设置SSH connection to Actions输入"true"  点击Run workflow运行

 页面运行到“SSH远程连接 SSH connection to Actions”，会显示一个链接，点击即可进入SSH，按Ctrl+C进入shell模式

 输入命令：cd openwrt && make menuconfig 进行个性化配置。

 完成后，按快捷键Ctrl+D或执行exit命令以退出，随后的编译工作将自动进行
 
 完成后到Actions下 已完成的提取config.yml下方找到config-xxxxx的压缩包下载解压
   
---

## 创建ACTIONS脚本的RELEASES_TOKEN

·1.到个人中心创建RELEASES_TOKEN：

 设置→开发人员设置→个人访问令牌→生成新令牌(Settings → Developer settings → Personal access tokens → Generate new token)

 创建名称"RELEASES_TOKEN"，勾选"public_repo"，创建后复制RELEASES_TOKEN值。

·2.到操作代码中心填上RELEASES_TOKEN

 设置→机密→新机密(Settings → Secrets → New secret)，名称"RELEASES_TOKEN"，粘贴RELEASES_TOKEN值

---

## 电报推送消息

设置方法 https://github.com/danshui-git/shuoming/blob/master/bot.md

---

## 插件说明 CONFIG*PACKAGE*

恩山https://www.right.com.cn/forum/thread-3682029-1-1.html

---
