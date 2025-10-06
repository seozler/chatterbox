FROM runpod/pytorch:2.1.1-py3.10-cuda12.1.0-devel-ubuntu22.04
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY runpod_handler.py /app/runpod_handler.py
ENV PYTHONUNBUFFERED=1
CMD ["python", "-m", "runpod_worker", "--handler", "runpod_handler.py:handler"]
