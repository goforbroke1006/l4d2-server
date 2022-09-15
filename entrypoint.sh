#!/bin/bash

# WORKING_DIR=/root

hostname=${L4D2_SERVER_HOSTNAME:-none}
sv_region=${L4D2_SERVER_SV_REGION:-255}
max_players="${L4D2_SERVER_MAX_PLAYERS:-4}"

cfg_path=~/games/left4dead2/cfg/server.cfg

tee $cfg_path <<EOF
hostname "${hostname}"
sv_region ${sv_region}
log on
sv_logfile 1
sv_password ""
writeid
writeip

EOF

cat $cfg_path

./games/srcds_run -game left4dead2 -console -port 27015 +maxplayers "${max_players}"
