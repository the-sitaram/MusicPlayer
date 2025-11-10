# ✅ Use a supported base image (buster replaced with bookworm)
FROM python:3.9-slim-bookworm

# 🧩 Update and install required packages
RUN apt update && apt upgrade -y && \
    apt install -y git curl ffmpeg python3-pip && \
    apt clean && rm -rf /var/lib/apt/lists/*

# 📦 Copy and install Python requirements
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -U -r /requirements.txt

# 📁 Set working directory
WORKDIR /MusicPlayer

# 🚀 Copy project files
COPY . .

# 🏁 Make startup script executable
RUN chmod +x /MusicPlayer/startup.sh

# ▶️ Run the bot
CMD ["/bin/bash", "/MusicPlayer/startup.sh"]
