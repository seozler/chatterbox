import runpod

def handler(event):
    # Chatterbox kodunuzu buraya
    input_data = event.get("input", {})
    
    # İşleminizi yapın
    result = {"status": "success", "message": "Hello from Chatterbox"}
    
    return result

runpod.serverless.start({"handler": handler})
