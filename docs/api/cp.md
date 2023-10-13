[...home](README.md)

- [Cod points](#cod-points)


# Cod points

The count of cod points isn't shared for each platform so you need to specify a platform, I'm not sure why the title is asked

The API call is

```
https://my.callofduty.com/api/papi-client/inventory/v1/title/{{title}}/platform/{{platform}}/gamer/{{username}}/currency
```

And the result is (2900 is my current count on my account)

```json
{
  "status": "success",
  "data": {
    "codPoints": 2900
  }
}
```

