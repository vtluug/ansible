# VTLUUG MOTD
HOSTNAME=$(hostname -f)
IPS=$(hostname -i)

IPV4="None"
IPV6="None"
IPV4_PRIVATE="None"
TOR="None"
if [[ "$(echo "$IPS" | wc -w)" -gt 2 ]]; then
    IPV4="$HOSTNAME $(echo "$IPS" | cut -d" " -f1)"
    IPV6="$HOSTNAME $(echo "$IPS" | cut -d" " -f3)"
    IPV4_PRIVATE="$(echo "$IPS" | cut -d" " -f2)"
else
    IPV6="$HOSTNAME $(echo "$IPS" | cut -d" " -f2)"
    IPV4_PRIVATE="$(echo "$IPS" | cut -d" " -f1)"
fi
# TODO TOR

# Print stuff out
uname -a
echo

if [[ "$HOSTNAME" == "acidburn.vtluug.org" ]]; then
    echo -e "Welcome to acidburn.vtluug.org -- the third incarnation of our ACIDBURN shell
server, running on Ubuntu + Linux, Codename Bionic Beaver.

If you plan to go 45 SECONDS FULL THROTTLE, or THERE ARE NO BARS HOLDING YOU BACK
please make sure no-one else is currently using the system."
fi

echo "Access to this server is available in the following ways:
Public IPv4:            $IPV4
Public IPv6:            $IPV6
Private IPv4:           $IPV4_PRIVATE
Tor:                    $TOR

Iodine instructions are available on the wiki; but need to be fixed.
IPv6 may have port 22 blocked from off-campus. SSH also listens on port 2222.
Outbound email over IPv6 is also probably blocked.

IPsec VPN is in development and nothing currently works. PRs welcome :)
Join #vtluug-infra on irc.oftc.net if you want to help w/ infra things.

If you find any security issues, please disclose them via email to:
        sysadmin@vtluug.org
        president@vtluug.org
        officers@vtluug.org
We do no have a VTLUUG PGP key.

To change your password, run passwd

To get games, set your path to PATH=\$PATH:/usr/games/:/usr/share/games/
in your .bashrc (or whatever you use as a shell)."
