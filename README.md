Simple dockerfile for running the example fib Flask app behind nginx and uwsgi.

Assumes that docker is running on the current machine

1. In the command line, make sure you're in this directory
docker build -t fib_nginx .

2. Run the container
docker run -d -p "80:80" --name fib_container fib_nginx

If you're on linux you'll see your app working at localhost/fib/

If you're on Mac/Windows and are using boot2docker, get that ip and then go there

$ boot2docker ip 
111.111.111.111

then visit it in your browser
http://111.111.111.111/fib/55

and you should see the answer: 139583862445