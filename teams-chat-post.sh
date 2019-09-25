# env
WEBHOOK_URL='https://outlook.office.com/webhook/7358ebd5-8e9e-4465-9f99-27d96fb2df38@afb5d3cf-2693-47e7-ade9-696a806ba95a/IncomingWebhook/405f6771329f427fb2418785c7b71440/b52bbfca-8b6f-4012-8ad9-dadf094c0961'
ACT_TITLE='This Is A Title'
COLOR='#000000'

# formating
#MESSAGE_P1="$(echo "<strong> \` This is a message \` </strong>")"
#MESSAGE="$MESSAGE_P1 <br>"
#JSON="{ \"@type\": \"MessageCard\", \"title\": \"${TITLE}\", \"themeColor\": \"${COLOR}\", \"text\": \"${MESSAGE}\" }"

cat << EOF > /tmp/tmp-message.json
{
  "@type": "MessageCard",
  "@context": "http://schema.org/extensions",
  "themeColor": "${COLOR}",
  "summary": "Larry Bryant created a new task",
  "sections": [
    {
      "activityTitle": "${ACT_TITLE}",
      "activitySubtitle": "On Project Tango",
      "activityImage": "https://teamsnodesample.azurewebsites.net/static/img/image5.png",
      "facts": [
        {
          "name": "Assigned to",
          "value": "Unassigned"
        },
        {
          "name": "Due date",
          "value": "Mon May 01 2017 17:07:18 GMT-0700 (Pacific Daylight Time)"
        },
        {
          "name": "Status",
          "value": "Not started"
        }
      ],
      "markdown": true
    }
  ],
  "potentialAction": [
    {
      "@type": "ActionCard",
      "name": "Add a comment",
      "inputs": [
        {
          "@type": "TextInput",
          "id": "comment",
          "isMultiline": false,
          "title": "Add a comment here for this task"
        }
      ],
      "actions": [
        {
          "@type": "HttpPOST",
          "name": "Add comment",
          "target": "http://..."
        }
      ]
    },
    {
      "@type": "ActionCard",
      "name": "Set due date",
      "inputs": [
        {
          "@type": "DateInput",
          "id": "dueDate",
          "title": "Enter a due date for this task"
        }
      ],
      "actions": [
        {
          "@type": "HttpPOST",
          "name": "Save",
          "target": "http://..."
        }
      ]
    },
    {
      "@type": "ActionCard",
      "name": "Change status",
      "inputs": [
        {
          "@type": "MultichoiceInput",
          "id": "list",
          "title": "Select a status",
          "isMultiSelect": "false",
          "choices": [
            {
              "display": "In Progress",
              "value": "1"
            },
            {
              "display": "Active",
              "value": "2"
            },
            {
              "display": "Closed",
              "value": "3"
            }
          ]
        }
      ],
      "actions": [
        {
          "@type": "HttpPOST",
          "name": "Save",
          "target": "http://..."
        }
      ]
    }
  ]
}
EOF

JSON=$(cat /tmp/tmp-message.json)

# post to teams channel
curl -H "Content-Type: application/json" -d "${JSON}" "${WEBHOOK_URL}"

