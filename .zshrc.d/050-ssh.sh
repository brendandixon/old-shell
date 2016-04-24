# SSH into a host in a hostclass
function by-hostclass {
    ssh2hc $1
}

# SSH into the first host in a VIP
function by-vip {
    ssh $(hostListWrapper vip:$1 | head -n 1)
}

# SSH into the first host in an environment
function by-env {
    sshenv -a $@
}
