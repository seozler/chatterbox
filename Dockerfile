FROM nvidia/cuda:12.1.1-base-ubuntu22.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 python3-pip git libsox-dev ffmpeg build-essential cmake rustc cargo pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir --default-timeout=300 -r requirements.txt --verbose

COPY handler.py .

CMD ["python3", "handler.py"]
