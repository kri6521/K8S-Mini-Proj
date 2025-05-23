# use a lightweight base img
FROM python:3.9-slim

# set environment variables to prevent python from writing .pyc files and buffer o/p
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# set the working directory inside the container
WORKDIR /app

# copy only the required files in the docker img
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# expose the port the appp runs on
EXPOSE 5000

# run the application
CMD ["python","app.py"]