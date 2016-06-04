# IPTables

They are evil but essential.

## View the IPTables

    sudo iptables -L -n --line-numbers

## Add a rule to the top of rule-chain (all other rules will be pushed down)

    sudo iptables -I INPUT --src [ip-address] -p [tcp/udp] --dport [port] -m state --state [NEW/ESTABLISHED] -j [ACCEPT/DENY]

## Specifying a IP Range

`-m iprange --src-range IP-IP -j ACTION`

    sudo iptables -A INPUT -p tcp --dport [port] -m iprange --src-range [ip-address]-[ip-address] -j [ACCEPT/DENY]

## Delete IPTable Rule number

    sudo iptables -D INPUT [number]

## Add IP Address to S1 for MySQL Connection

    sudo iptables -I INPUT --src 52.40.197.42 -p tcp --dport 3306 -m state --state NEW -j ACCEPT
