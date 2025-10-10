FROM nvidia/cuda:12.1.1-base-ubuntu22.04

WORKDIR /app

RUN apt-get update && apt-get install -y python3 python3-pip git libsox-dev && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --default-timeout=100 -r requirements.txt

COPY handler.py .

CMD ["python3", "handler.py"]
