export SERVER_TYPE=$1

if [ "$SERVER_TYPE" = "apache2" ]; then
    echo "changing to apache2";
    service nginx stop;
    service apache2 start;
elif [ "$SERVER_TYPE" = "nginx" ]; then
    echo "changing to nginx";
    service apache2 stop;
    service nginx start;
else
    echo "erro using SERVER_TYPE value '${SERVER_TYPE}'";
    exit 1
fi

service apache2 status | cat;
service nginx status | cat;