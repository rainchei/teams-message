# env
WEBHOOK_URL='<teams-webhook-url>'
TITLE='This Is A Title'
COLOR='#000000'

# formating
MESSAGES_P1="$(echo "<strong> \` This is a message \` </strong>")"
MESSAGES="$MESSAGES_P1 <br>"

cat << EOF > /tmp/tmp-message.json
{
  "@type": "MessageCard",
  "themeColor": "${COLOR}",
  "title": "${TITLE}",
  "text": "${MESSAGES}",
  "potentialAction": [
    {
      "@type": "OpenUri",
      "name": "Ok Google",
      "targets": [
        { "os": "default", "uri": "https://www.google.com" }
      ]
    }
  ]
}
EOF

JSON=$(cat /tmp/tmp-message.json)

# post to teams channel
curl -H "Content-Type: application/json" -d "${JSON}" "${WEBHOOK_URL}"


###############
## exmaple 1 ##
###############
#
#cat << EOF > /tmp/tmp-message.json
#{
#    "@type": "MessageCard",
#    "@context": "http://schema.org/extensions",
#    "themeColor": "0076D7",
#    "summary": "Larry Bryant created a new task",
#    "sections": [{
#        "activityTitle": "![TestImage](https://47a92947.ngrok.io/Content/Images/default.png)Larry Bryant created a new task",
#        "activitySubtitle": "On Project Tango",
#        "activityImage": "https://teamsnodesample.azurewebsites.net/static/img/image5.png",
#        "facts": [{
#            "name": "Assigned to",
#            "value": "Unassigned"
#        }, {
#            "name": "Due date",
#            "value": "Mon May 01 2017 17:07:18 GMT-0700 (Pacific Daylight Time)"
#        }, {
#            "name": "Status",
#            "value": "Not started"
#        }],
#        "markdown": true
#    }],
#    "potentialAction": [{
#        "@type": "ActionCard",
#        "name": "Add a comment",
#        "inputs": [{
#            "@type": "TextInput",
#            "id": "comment",
#            "isMultiline": false,
#            "title": "Add a comment here for this task"
#        }],
#        "actions": [{
#            "@type": "HttpPOST",
#            "name": "Add comment",
#            "target": "http://..."
#        }]
#    }, {
#        "@type": "ActionCard",
#        "name": "Set due date",
#        "inputs": [{
#            "@type": "DateInput",
#            "id": "dueDate",
#            "title": "Enter a due date for this task"
#        }],
#        "actions": [{
#            "@type": "HttpPOST",
#            "name": "Save",
#            "target": "http://..."
#        }]
#    }, {
#        "@type": "ActionCard",
#        "name": "Change status",
#        "inputs": [{
#            "@type": "MultichoiceInput",
#            "id": "list",
#            "title": "Select a status",
#            "isMultiSelect": "false",
#            "choices": [{
#                "display": "In Progress",
#                "value": "1"
#            }, {
#                "display": "Active",
#                "value": "2"
#            }, {
#                "display": "Closed",
#                "value": "3"
#            }]
#        }],
#        "actions": [{
#            "@type": "HttpPOST",
#            "name": "Save",
#            "target": "http://..."
#        }]
#    }]
#}
#EOF

###############
## exmaple 2 ##
###############
#
#cat << EOF > /tmp/tmp-message.json
#{
#  "@context": "https://schema.org/extensions",
#  "@type": "MessageCard",
#  "themeColor": "0072C6",
#  "title": "Visit the Outlook Dev Portal",
#  "text": "Click **Learn More** to learn more about Actionable Messages!",
#  "potentialAction": [
#    {
#      "@type": "ActionCard",
#      "name": "Send Feedback",
#      "inputs": [
#        {
#          "@type": "TextInput",
#          "id": "feedback",
#          "isMultiline": true,
#          "title": "Let us know what you think about Actionable Messages"
#        }
#      ],
#      "actions": [
#        {
#          "@type": "HttpPOST",
#          "name": "Send Feedback",
#          "isPrimary": true,
#          "target": "http://..."
#        }
#      ]
#    },
#    {
#      "@type": "OpenUri",
#      "name": "Learn More",
#      "targets": [
#        { "os": "default", "uri": "https://docs.microsoft.com/outlook/actionable-messages" }
#      ]
#    }
#  ]
#}
#EOF
