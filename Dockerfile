# 使用官方 Python 轻量级基础镜像
FROM python:3.10-slim

# 设置工作目录
WORKDIR /app

# 复制依赖列表到容器中
COPY requirements.txt .

# 安装依赖（使用清华源加速国内下载，如果你的服务器在海外，可以去掉 -i 后面的部分）
RUN pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 复制项目的所有代码到容器中
COPY . .

# 暴露 Gradio Web UI 的默认端口
EXPOSE 7860

# 设置环境变量，强制 Gradio 监听所有网络接口，否则在容器外无法访问
ENV GRADIO_SERVER_NAME="0.0.0.0"

# 启动 Web UI
CMD ["python", "app.py"]