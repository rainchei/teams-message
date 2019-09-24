# reproducing issue
DEPLOY_MESSAGES=()
TMP_MSG_ALL=( 'ops/logstack_client:201906-5-gf581169b35|logging|RunningPods2/2' 'docker.elastic.co/kibana/kibana-oss:6.4.3|logging|RunningPods1/1' )
for TMP_MSG in ${TMP_MSG_ALL[@]}
do
  DEPLOY_MESSAGES=( "${DEPLOY_MESSAGES[@]} ${TMP_MSG} <br> " )
  DEPLOY_MESSAGES=( " == ERROR: rollout for helloworld returned: 1! <br> ${TMP_MSG} <<< $(tail -n 1 /tmp/rollout_error.txt) <br><br> ${DEPLOY_MESSAGES[@]}" )
done

echo "raw ::: ${DEPLOY_MESSAGES[@]}"
BUILT_MESSAGES="${DEPLOY_MESSAGES[@]}"

# env
WEBHOOK_URL='https://outlook.office.com/webhook/7358ebd5-8e9e-4465-9f99-27d96fb2df38@afb5d3cf-2693-47e7-ade9-696a806ba95a/IncomingWebhook/405f6771329f427fb2418785c7b71440/b52bbfca-8b6f-4012-8ad9-dadf094c0961'
TITLE='Title'
COLOR='#90B0FF'

# formating
BUILT_MESSAGES=$(echo "<strong> \` ${BUILT_MESSAGES} \` </strong>" | sed 's|<br>| \` <br> \` |g')
echo "formatted ::: $BUILT_MESSAGES "

MESSAGE="$BUILT_MESSAGES"
JSON="{\"title\": \"${TITLE}\", \"themeColor\": \"${COLOR}\", \"text\": \"${MESSAGE}\" }"

# post to teams channel
curl -H "Content-Type: application/json" -d "${JSON}" "${WEBHOOK_URL}"

