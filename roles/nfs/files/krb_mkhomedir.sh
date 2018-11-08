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
      dc=krb,dc=vtluug,dc=org | grep -oP '(?<=uid=).*?(?=,)' | sort | uniq)

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

    # Homedir creation
    echo "Creating $user:$user $HOMEPATH/$user"
    mkdir $HOMEPATH/$user
    chown $user:$user $HOMEPATH/$user
    chmod 755 $HOMEPATH/$user

    # Skeleton files
    echo "Adding skeleton files to $HOMEPATH/$user"
    
    ## .nofinger
    touch $HOMEPATH/$user/.nofinger
    chown $(id -un $user):$(ud -gn $user) $HOMEPATH/$user/.nofinger
    chmod 644 $HOMEPATH/$user/.nofinger

done
