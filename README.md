# Cream Soda tester

This app tests a big variety of TCP strategies with different servers, with different traffic amount. The data can be processed using a separate tool.
The basic algorithm is as follows:

```python
for server in servers:
    set_server(server)
    for strategy in strategies:
        set_strategy(strategy)
        for traffic in traffics:
            run_traffic(traffic)

```
As the most of this code runs in the server machine, the code should be moved to it.  
The `run_traffic` runs on the host. The function call is done using SSH.