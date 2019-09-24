# env
WEBHOOK_URL='https://outlook.office.com/webhook/7358ebd5-8e9e-4465-9f99-27d96fb2df38@afb5d3cf-2693-47e7-ade9-696a806ba95a/IncomingWebhook/405f6771329f427fb2418785c7b71440/b52bbfca-8b6f-4012-8ad9-dadf094c0961'
TITLE='This Is A Title'
COLOR='#90B0FF'

# formating
MESSAGE_P1="$(echo "<strong> \` This is a message \` </strong>")"

MESSAGE="$MESSAGE_P1 <br>"
JSON="{\"title\": \"${TITLE}\", \"themeColor\": \"${COLOR}\", \"text\": \"${MESSAGE}\" }"

# post to teams channel
curl -H "Content-Type: application/json" -d "${JSON}" "${WEBHOOK_URL}"

