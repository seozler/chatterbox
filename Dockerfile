FROM pytorch/pytorch:2.4.0-cuda12.1-cudnn9-runtime

WORKDIR /app

# runpod gerekli paketleri yükle
RUN pip install --no-cache-dir runpod

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY runpod_handler.py /app/runpod_handler.py

ENV PYTHONUNBUFFERED=1

CMD ["python", "-m", "runpod", "serverless", "start", "--handler", "runpod_handler.py:handler"]
