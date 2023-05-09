#防止休眠命令，取消下一行代码的注释生效
#python3 /app/self-ping.py &

#启动自动更新内核导致启动缓慢，因此取消自动更新，需要手动更新内核

#define folders
CONFIG="/app/etc/v2ray"
APP="/app/usr/bin"

#write config.json
cat << EOF > ${CONFIG}/config.json
{
    "inbounds": [{
        "port": $PORT,
        "protocol": "vmess",
        "settings": {
            "clients": [{
                "id": "0dd29db0-1a66-4cd8-bddd-5a250e5000f3",
                "alterId": 0
            }]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "/"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

#configure
${APP}/v2ctl config ${CONFIG}/config.json > ${CONFIG}/config.pb

#run
${APP}/v2ray -config=${CONFIG}/config.pb
