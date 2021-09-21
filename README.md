# Jupyter Notebook | Docker Container

http://localhost:8888

This container contains Jupyter Notebook, which is frequently used in data science project development processes.

### Setup

        $ docker build -t ahmtcnbs/jupyternotebook .
        
        $ docker volume create myjupyter
        
        $ docker volume inspect myjupyter
        
Docker Volume is used so that your data is not lost when you close and restart the container. After this command you will get output as below.
        
        [
    {
        "CreatedAt": "2021-09-21T10:59:32Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/myjupyter/_data",
        "Name": "myjupyter",
        "Options": {},
        "Scope": "local"
    }
        ]
        
We will use the information here while running the container. (-v Name:Mountpoint)
        
        $ docker run -p 8888:8889 -v myjupyter:/var/lib/docker/volumes/myjupyter/_data  --name jupyter -d ahmtcnbs/jupyternotebook
        
        Result: 27c40a3ac2e97e40f1ebe5e3b5bb421f38f1771c03b1e9ffb6490474e783534d

Now the container is running. Jupyter Notebook is an application that works with token. In order not to receive token every time, you can follow the ways below to use it by logging in with a password.

        $ docker exec -it 27c40a3ac2e97e40f1ebe5e3b5bb421f38f1771c03b1e9ffb6490474e783534d /bin/sh
        $ jupyter notebook list
        
        Result: Currently running servers:
                http://0.0.0.0:8889/?token=c9548150b2bce6263a35228cce7e7c0c10e483a95fe13abe

Now we can login to Jupyter Notebook using this token. (Token : c9548150b2bce6263a35228cce7e7c0c10e483a95fe13abe)

http://localhost:8888
