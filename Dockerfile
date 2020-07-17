FROM python:3.8

RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN pip3 install --trusted-host pypi.org --trusted-host files.pythonhosted.org -r requirements.txt

ENV FLASK_APP flaskr
ENV FLASK_ENV development

EXPOSE 5000
CMD ["python", "__init__.py"]

