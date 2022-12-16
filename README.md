# Cream Soda tester

    for server in ['nginx', 'apache2']:
        for strategy in tcpStrategies:
            set server
            set tcp strategy
            run traffic
