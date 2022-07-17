#!/bin/bash

# Files 标签 ID 获取自行上传的F大内核文件 https://api.github.com/repos/jiotong/Actions-OpenWrt/releases/latest
wget $(curl -s https://api.github.com/repos/jiotong/Actions-OpenWrt/releases/72174845 | grep browser_download_url | cut -d '"' -f 4)
