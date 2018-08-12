IP=`curl -s 'https://api.ipify.org' | uniq`
filepath="currentIp"
webhookUrl="yourWebhookUrlHere";
cmd=$(curl -X POST -H 'Content-type: application/json' --data "{'text':'$IP'}" $webhookUrl;)

function success() {
  echo $IP > $filepath;
  export IP;
  eval $cmd;
}

if [ ! -f "$filepath" ]; then
  success;
else
  if [ $IP != "$(cat $filepath)" ]
  then
    success;
  fi
fi
