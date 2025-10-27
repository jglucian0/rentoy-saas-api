from fastapi import FastAPI

# Cria a instância principal da aplicação
app = FastAPI()


@app.get("/")
def read_root():
    """Healt-check"""
    # Conversão automática dicionário > JSON
    return {"status": "ok", "message": "200 Healt-check"}
