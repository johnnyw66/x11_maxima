#echo $PWD
docker run -v $PWD:/app -p 5901:5900 -d x11maxima:latest



