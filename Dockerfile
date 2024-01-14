FROM python:3.9-slim

COPY hello.py /hello.py

CMD ["python", "/hello.py"]

