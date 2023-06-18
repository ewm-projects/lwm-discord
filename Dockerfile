# pull official base image
FROM python:3.11.3-slim-buster

# set working directory
WORKDIR /usr/bot

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
COPY ./requirements-dev.txt .
RUN pip install -r requirements-dev.txt

# add app
COPY . .

# add and run as non-root user
RUN adduser --disabled-password myuser
USER myuser

CMD ["python", "src/main.py"]