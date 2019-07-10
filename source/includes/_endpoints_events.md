# Events
## Get All Events
```shell
curl "https://mhw-db.com/events"
```

```javascript
fetch('https://mhw-db.com/events')
	.then(response => response.json())
	.then(events => {
		// your code here
	});
```
> The above command returns an array of [`Event`](#event-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 1,
    "name": "A Visitor from Eorzea (Extreme)",
    "platform": "console",
    "exclusive": null,
    "type": "event quest",
    "description": "You and your entire party will have...",
    "requirements": "HR 50 or higher",
    "questRank": 9,
    "successConditions": "Slay a Behemoth",
    "startTimestamp": "2019-07-05T00:00:00+0000",
    "endTimestamp": "2019-07-11T23:59:00+0000",
    "location": {...}
  }
]
```

This endpoint retrieves all ongoing and scheduled in-game events, pulled from the official Capcom events pages
([PC](http://game.capcom.com/world/steam/us/schedule.html) and [console](http://game.capcom.com/world/us/schedule.html)).

Events are updated once per day, at midnight UTC. During the daily update, newly scheduled events will be added to the
system, while events that have ended will be removed.

### HTTP Request
`GET https://mhw-db.com/events`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of events. For field information, see the [Event Fields](#event-fields) section.

## Get a Specific Event
```shell
curl "https://mhw-db.com/events/1"
```

```javascript
fetch('https://mhw-db.com/events/1')
	.then(response > response.json())
	.then(event => {
		// your code here
	});
```
> The above command returns a single [`Event`](#event-fields) object. Some fields have been truncted for brevity.

```json
{
  "id": 1,
  "name": "A Visitor from Eorzea (Extreme)",
  "platform": "console",
  "exclusive": null,
  "type": "event quest",
  "description": "You and your entire party will have...",
  "requirements": "HR 50 or higher",
  "questRank": 9,
  "successConditions": "Slay a Behemoth",
  "startTimestamp": "2019-07-05T00:00:00+0000",
  "endTimestamp": "2019-07-11T23:59:00+0000",
  "location": {...}
}
```

This endpoint retrieves a specific event.

### HTTP Request
`GET https://mhw-db.com/events/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the event to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single event. For field information, see the [Event Fields](#event-fields) section.

## Event Fields
```json
{
  "id": 1,
  "name": "A Visitor from Eorzea (Extreme)",
  "platform": "console",
  "exclusive": null,
  "type": "event quest",
  "description": "You and your entire party will have...",
  "requirements": "HR 50 or higher",
  "questRank": 9,
  "successConditions": "Slay a Behemoth",
  "startTimestamp": "2019-07-05T00:00:00+0000",
  "endTimestamp": "2019-07-11T23:59:00+0000",
  "location": {
    "id": 5,
    "name": "Elder's Recess",
    "zoneCount": 16,
    "camps": [...]
  }
}
```

> A sample `Event` object.

Field | Type | Description
id | Integer | The ID of the event
name | String | The event's title
platform | [EventPlatform](#event-platforms) | The platform that the event is running on (if an event is running on more than one platform, each platform will have it's own event object in the API)
exclusive | [EventExclusivity](#event-exclusivity-types) | For consoles, a value other than `null` indicates that the event is only running on a specific console
type | [EventType](#event-types) | The event's type
description | String | A text description of the event
requires | String | A text description of the event's entry requirements
questRank | Integer | The rank of the quest
successConditions | String | A text description of the event's success condition(s)
startTimestamp | DateTime | A timestamp indicating when the event started
endTimestamp | DateTime | A timestamp indicating when the event will end
location | [Location](#location-fields) | The location in which the event takes place

### Event Types
An event's type may be one of the following values.

- `kulve taroth siege`
- `event quest`
- `challenge quest`

Event types correspond to the section on the event page under which the event is listed.

### Event Platforms
An event's platform may be one of the following values.

- `pc`
- `console`

### Event Exclusivity Types
Some events (such as the Horizon Zero Dawn event) only run on specific consoles. For such events, the `exclusive` field
will contain one of the following values.

- `ps4`
- `xbox`