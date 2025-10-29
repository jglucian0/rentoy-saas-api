FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt requirements-dev.txt /app/

RUN pip install --no-cache-dir pip-tools && \
    pip install --no-cache-dir -r requirements.txt


COPY src/ src/
COPY pyproject.toml .

EXPOSE 8000

CMD ["uvicorn", "src.rentoy_saas_api.main:app", "--host", "0.0.0.0", "--reload"]