echo "ab -c 100  -n 2000  -e cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento1.csv $SERVER_URL > cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento1_out.txt";

ab -c 100  -n 2000  -e cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento1.csv $SERVER_URL > cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento1_out.txt;

ab -c 500  -n 10000 -e cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento2.csv $SERVER_URL > cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento2_out.txt;

ab -c 1000 -n 20000 -e cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento3.csv $SERVER_URL > cubic_${TCP_STRATEGY}_${SERVER_TYPE}_escalonamento3_out.txt;