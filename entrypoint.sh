#!/bin/bash

# WORKING_DIR=/root

max_players="${L4D2_SERVER_MAX_PLAYERS:-4}"

cfg_path=~/l4d/left4dead2/cfg/server.cfg

tee $cfg_path <<EOF
hostname "${L4D2_SERVER_HOSTNAME}"
log on
sv_logfile 1
sv_password "${L4D2_SERVER_PASSWORD}"

EOF

cat $cfg_path

./l4d/srcds_run -game left4dead2 -console -port 27015 +maxplayers "${max_players}"
