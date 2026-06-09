@echo off
chcp 65001 >nul 2>&1
echo.
echo ====================================
echo    琅琊榜 - 文字冒险游戏
echo ====================================
echo.
echo 正在启动本地服务器...
echo.

:: 检查Python是否安装
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Python，正在尝试其他方式...
    echo.
    
    :: 尝试直接用浏览器打开
    echo 正在用浏览器直接打开游戏...
    start "" "%~dp0index.html"
    echo.
    echo [提示] 如果游戏显示异常（背景/图片/音乐缺失），
    echo 请安装 Python 后重新运行此脚本：https://www.python.org/downloads/
    echo 安装时请勾选 "Add Python to PATH"
    echo.
    pause
    exit /b
)

:: 启动本地服务器
echo 服务器启动成功！
echo.
echo 请在浏览器中打开以下地址：
echo.
echo     http://localhost:8080
echo.
echo （浏览器应会自动打开，如未打开请手动复制上方地址）
echo.
echo 关闭此窗口即可停止服务器
echo.

:: 自动打开浏览器
start "" "http://localhost:8080"

:: 启动HTTP服务器
cd /d "%~dp0"
python -m http.server 8080
