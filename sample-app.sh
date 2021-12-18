#!/bin/bash

mkdir tempdir
cp sample-app.py tempdir/
cp requirements.txt tempdir/


echo "FROM python" >> tempdir/Dockerfile
echo "WORKDIR /home/ubuntu" >> tempdir/Dockerfile
echo "COPY ./sample-app.py /home/ubuntu/sample-app.py" >> tempdir/Dockerfile
echo "COPY ./requirements.txt /home/ubuntu/requirements.txt" >> tempdir/Dockerfile
echo "RUN pip3 install -r /home/ubuntu/requirements.txt" >> tempdir/Dockerfile
echo "CMD python /home/ubuntu/sample-app.py" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile

cd tempdir
docker build -t sampleappfrombash .
docker run -t -d -p 5050:5050 --name samplerunning-bash sampleappfrombash
docker ps -a

