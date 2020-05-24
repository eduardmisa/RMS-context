FROM python:3.7
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ADD . /code
COPY . /code
WORKDIR /code
RUN pip install -r requirements.txt
EXPOSE 8001
# RUN python manage.py migrate

CMD python manage.py runserver 0.0.0.0:8001