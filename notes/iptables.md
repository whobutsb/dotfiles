# IPTables

They are evil but essential 

View the IPTables

    sudo iptables -L -n --line-numbers

Add a rule to the top of rule-chain (all other rules will be pushed down)

    sudo iptables -I 1 --src [ip-address] -p [tcp/udp] --dport [port] -m state --state [NEW/ESTABLISHED] -j [ACCEPT/DENY]

Specifying a IP Range

`-m iprange --src-range IP-IP -j ACTION`

    sudo iptables -A INPUT -p tcp --dport [port] -m iprange --src-range [ip-address]-[ip-address] -j [ACCEPT/DENY]
