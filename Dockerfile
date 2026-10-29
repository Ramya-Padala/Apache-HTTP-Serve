FROM apache/airflow:slim
COPY /var/www/html/index.html
EXPOSE 80
