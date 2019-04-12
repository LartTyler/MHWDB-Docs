# Locations
## Get All Locations
```shell
curl "https://mhw-db.com/locations"
```

```javascript
fetch('https://mhw-db.com/locations')
	.then(response => response.json())
	.then(locations => {
		// your code here
	});
```

> The above command returns an array of [`Location`](#location-fields) objects. Some fields have been truncated for brevity.

```json
[
    {
        "id": 1,
        "name": "Ancient Forest",
        "zoneCount": 16,
        "camps": [
            {
                "id": 1,
                "name": "Southwest Camp",
                "zone": 1
            }
        ]
    }
]
```

This endpoint retrieves all locations.

### HTTP Request
`GET https://mhw-db.com/locations`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of locations. For field information, see the [Location Fields](#location-fields) section.

## Get a Specific Location
```shell
curl "https://mhw-db.com/locations/1"
```

```javascript
fetch('https://mhw-db.com/locations/1')
	.then(response => response.json())
	.then(location => {
		// your code here
	});
```

> The above command returns a single [`Location`](#location-fields) object. Some fields have been truncated for brevity.

```json
{
    "id": 1,
    "name": "Ancient Forest",
    "zoneCount": 16,
    "camps": [
        {
            "id": 1,
            "name": "Southwest Camp",
            "zone": 1
        }
    ]
}
```

This endpoint retrieves a specific location.

### HTTP Request
`GET https://mhw-db.com/locations/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the location to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single location. For field information, see the [Location Fields](#location-fields) section.

## Location Fields
```json
{
    "id": 1,
    "name": "Ancient Forest",
    "zoneCount": 16,
    "camps": [
        {
            "id": 1,
            "name": "Southwest Camp",
            "zone": 1
        },
        {
            "id": 2,
            "name": "Northwest Camp",
            "zone": 8
        },
        {
            "id": 3,
            "name": "Northeast Camp",
            "zone": 11
        },
        {
            "id": 4,
            "name": "Ancient Forest Camp",
            "zone": 17
        }
    ]
}
```

> A sample `Location` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the location
name | String | The name of the location
zoneCount | Integer | The number of zones in the location
camps | Array&lt;[Camp](#camp-fields)&gt; | An array of camps available in the location

### Camp Fields
Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the camp
name | String | The name of the camp
zone | Integer | Which zone the camp is located in