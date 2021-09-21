FROM python:3.6

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8889

CMD jupyter notebook --allow-root --ip 0.0.0.0 --port 8889
