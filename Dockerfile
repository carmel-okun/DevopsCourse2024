FROM python:3.8.2-slim

WORKDIR /src/app

COPY . /src/app

COPY requirements.txt src/app/
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080


ENV FLASK_APP=flaskr
ENV FLASK_ENV=development


RUN pip install --upgrade pip
RUN pip install --editable .
RUN flask init-db


CMD ["flask", "run", "--host=0.0.0.0"]
