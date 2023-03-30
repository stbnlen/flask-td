# Usar Python 3.10
FROM python:3.10

# Establecer el directorio de trabajo
WORKDIR /code

# Copiar el Pipfile y Pipfile.lock
COPY Pipfile Pipfile.lock ./

# Instalar los requerimientos con pipenv
RUN pip install --no-cache-dir pipenv && \
    pipenv install --system --deploy --ignore-pipfile

# Copiar el resto del código
COPY . .

# Establecer la variable de entorno FLASK_RUN_HOST
ENV FLASK_RUN_HOST=0.0.0.0

# Establecer el comando por defecto
CMD ["flask", "run"]
