echo "changing TCP congestion control algorithm to ${TCP_ALGORITHM}";
echo $TCP_ALGORITHM > /proc/sys/net/ipv4/tcp_congestion_control;