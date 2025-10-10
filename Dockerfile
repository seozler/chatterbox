FROM nvidia/cuda:12.1.1-base-ubuntu22.04

WORKDIR /app

# 🔸 Ek sistem bağımlılıkları
RUN apt-get update && apt-get install -y \
    python3 python3-pip git libsox-dev ffmpeg build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir --default-timeout=200 -r requirements.txt

COPY handler.py .

CMD ["python3", "handler.py"]
