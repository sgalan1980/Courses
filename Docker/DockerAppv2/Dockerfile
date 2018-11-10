FROM python:3.5
RUN pip install Flask==0.11.1 redis==2.10.5 && apt-get update
RUN useradd -ms /bin/bash santi
USER santi
WORKDIR /app
COPY app /app
CMD ["python", "app.py"] 