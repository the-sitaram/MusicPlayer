FROM python:3.9-slim-bookworm

RUN apt update && apt upgrade -y && \
    apt install -y git curl ffmpeg python3-pip && \
    apt clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -U -r /requirements.txt

WORKDIR /MusicPlayer

COPY . .

RUN chmod +x /MusicPlayer/startup.sh

CMD ["/bin/bash", "/MusicPlayer/startup.sh"]
