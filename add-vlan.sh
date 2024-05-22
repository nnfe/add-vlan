#!/bin/bash
test_var () {
vlanA=$1
ipA=$2
    if [ -z $2 ] ;
	then 
	    add-link-dhcp $@ ;
	else
	    add-link-addr $@ ;
    fi
}
#add link add address
add-link-addr () {
    ip link add link lan0 name lan0.$vlanA type vlan id $vlanA &&
    ip link set lan0.$vlanA up &&
    ip addr add $ipA dev lan0.$vlanA &&
    ip link show dev lan0.$vlanA &&
    ip addr show dev lan0.$vlanA ;
} ;

#add link adn dhcp address
add-link-dhcp () {
    ip link add link lan0 name lan0.$vlanA type vlan id $vlanA &&
    ip link set lan0.$vlanA up &&
    dhclient lan0.$vlanA &&
    ip link show dev lan0.$vlanA &&
    ip addr show dev lan0.$vlanA ;
} ;

test_var $@

exit
