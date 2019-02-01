#!/bin/bash
##################################################
# krb_mkhomedir.sh - Create homedirectories for new kerberos users
#
# author: pew <paul@walko.org>
##################################################

HOMEPATH='/nfs/cistern/home'
HOST='chimera.vtluug.org'

# Lookup current homedirs and new users
HOMEDIRS=$(ls $HOMEPATH | sort)
USERS=$(ldapsearch -x -h $HOST -b \
    cn=luugusers,cn=groups,cn=compat,dc=krb,dc=vtluug,dc=org | \
    grep "^memberUid" | cut -d' ' -f2 | sort)

# Compare old & new uers
# -1: Suppress users with homedir but no account
#     (shouldn't happen but it's possible)
# -3: Suppress common users
NEWUSERS=$(comm -13 <(echo "$HOMEDIRS") <(echo "$USERS"))

# Create homedirs for new users
for user in $NEWUSERS; do
    if [[ "$user" == "admin" ]]; then
        continue
    fi
    group=$(id -gn $user)
    umask 022

    # Homedir creation
    echo "Creating $user:$group $HOMEPATH/$user"
    mkdir $HOMEPATH/$user

    # Skeleton files
    echo "Adding skeleton files to $HOMEPATH/$user"
    
    ## .nofinger
    touch $HOMEPATH/$user/.nofinger

    ## public_html
    mkdir $HOMEPATH/$user/public_html

    # Permissions
    echo "Setting permissions $user:$group for $HOMEPATH/$user"
    chown $user:$group -R $HOMEPATH/$user

done
