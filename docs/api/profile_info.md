[...home](README.md)

- [Profile info](#profile-info)


# Profile info

A profile is an Activision profile, it can be linked with some platform IDs

You can fetch your own identities with the API call

```
https://my.callofduty.com/api/papi-client/crm/cod/v2/identities
```

With the result

```json
{
  "status": "success",
  "data": {
    "titleIdentities": [
      {
        "title": "{{title}}",
        "platform": "{{platform}}",
        "username": "{{username}}",
        "activeDate": 1605284479000,
        "activityType": "{{gameMode}}",
        "id": null
      },
    ]
  }
}
```

1605284479000 is the last timestamp of the play time (in millis)

