FROM python:3.12-slim as python-base
WORKDIR  /app
COPY ./pyproject.toml /app
RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install 
COPY . .
CMD ["fastapi", "dev", "main.py"]