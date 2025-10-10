import runpod
import torch
from chatterbox.tts import ChatterboxMultilingualTTS
import base64
import io
import torchaudio

device = "cuda" if torch.cuda.is_available() else "cpu"
model = ChatterboxMultilingualTTS.from_pretrained(device=device)
sample_rate = 22050

def handler(job):
    inputs = job["input"]
    text = inputs.get("text", "Hello from Chatterbox!")
    lang = inputs.get("language_id", "en")

    print(f"🗣️ Generating speech for: {text[:50]}... ({lang})")

    audio_tensor = model.generate(text, language_id=lang)
    buffer = io.BytesIO()
    torchaudio.save(buffer, audio_tensor, sample_rate, format="wav")
    buffer.seek(0)

    audio_b64 = base64.b64encode(buffer.read()).decode("utf-8")

    return {
        "status": "success",
        "language": lang,
        "text": text,
        "audio_base64": audio_b64
    }

runpod.serverless.start({"handler": handler})
