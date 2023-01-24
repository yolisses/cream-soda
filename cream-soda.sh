run_traffic() {
	clients=(100 500 1000)
	requests=(2000 10000 20000)
	for index in ${!clients[@]}; do
		filename=cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento$index
		ssh $HOST_URL ab -c $clients[$index] -n $requests[$index] \
			-e $filename.csv $SERVER_URL \
			>${filename}_out.txt
	done
}

update_strategy() {
	export TCP_STRATEGY=$1
	echo "setting TCP congestion control algorithm to $TCP_STRATEGY"
	echo $TCP_STRATEGY >/proc/sys/net/ipv4/tcp_congestion_control
}

update_server() {
	export SERVER_TYPE=$1
	if [ "$SERVER_TYPE" = "apache2" ]; then
		echo "changing to apache2"
		service nginx stop
		service apache2 start
	elif [ "$SERVER_TYPE" = "nginx" ]; then
		echo "changing to nginx"
		service apache2 stop
		service nginx start
	else
		echo "error using SERVER_TYPE value '$SERVER_TYPE'"
		exit 1
	fi
	service apache2 status | cat
	service nginx status | cat
}

servers=("nginx" "apache2")
strategies=("cubic" "bic" "westwood" "htcp" "hybla" "vegas" "nv" "scalable" "lp" "veno" "yeah" "illinois" "dctcp" "cdg" "bbr")

echo "running with:"
echo "HOST_URL=$HOST_URL"
echo "SERVER_URL=$SERVER_URL"

for server in ${servers[@]}; do
	update_server $server
	for strategy in ${strategies[@]}; do
		update_strategy $strategy
		run_traffic
	done
done
