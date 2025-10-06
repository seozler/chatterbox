FROM runpod/pytorch:2.4.0-cuda12.1-py3.10
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY runpod_handler.py /app/runpod_handler.py
ENV PYTHONUNBUFFERED=1
CMD ["python", "-m", "runpod_worker", "--handler", "runpod_handler.py:handler"]
