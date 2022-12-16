echo "setting TCP congestion control algorithm to ${TCP_STRATEGY}";
echo $TCP_STRATEGY > /proc/sys/net/ipv4/tcp_congestion_control;