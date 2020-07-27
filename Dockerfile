FROM python:3.7
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ADD . /code
COPY . /code
WORKDIR /code
# RUN pip install -r requirements.txt
EXPOSE 8000

# CMD python manage.py runserver 0.0.0.0:8001
CMD ["venv/bin/python3", "manage.py runserver 0.0.0.0:8001"]