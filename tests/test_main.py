from fastapi.testclient import TestClient

# Importa o 'app' de ./rentoy-saas-api/src/rentoy_saas_api/main.py
from rentoy_saas_api.main import app

# Cria o 'web client test'
client = TestClient(app)


def test_read_rood_deve_retornar_200():
    # Realiza uma requisição GET á raiz '/'
    response = client.get("/")

    # Verifica se o status HTTP retorna 200 (ok)
    assert response.status_code == 200

    # Verifica se o retorno JSON é exatamente o esperado
    assert response.json() == {
        "status": "ok",
        "message": "200 Healt-check",
    }
