# Items
## Get All Items
```shell
curl "https://mhw-db.com/items"
```

```javascript
fetch('https://mhw-db.com/items')
    .then(response => response.json())
    .then(items => {
        // your code here
    });
```

> The above command returns an array of [`Item`](#item-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 1,
    "name": "Potion",
    "description": "Potion",
    "rarity": 1,
    "carryLimit": 10,
    "value": 8
  }
]
```

This endpoint retrieves all items.

### HTTP Request
`GET https://mhw-db.com/items`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of items. For field information, see the [Item Fields](#item-fields) section.

## Get a Specific Item
```shell
curl "https://mhw-db.com/items/1"
```

```javascript
fetch('https://mhw-db.com/items/1')
    .then(response => response.json())
    .then(item => {
        // your code here
    });
```

> The above command returns a single [`Item`](#item-fields) object.

```json
{
  "id": 1,
  "name": "Potion",
  "description": "Potion",
  "rarity": 1,
  "carryLimit": 10,
  "value": 8
}
```

This endpoint retrieves a specific item.

### HTTP Request
`GET https://mhw-db.com/items/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the item to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single item. For field information, see the [Item Fields](#item-fields) section.

## Item Fields
```json
{
  "id": 1,
  "name": "Potion",
  "description": "Potion",
  "rarity": 1,
  "carryLimit": 10,
  "value": 8
}
```

> A sample `Item` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the item
name | String | The name of the item
description | String | A short description of the item
rarity | Integer | The rarity of the item
carryLimit | Integer | The maximum number of the item that may be in the player's inventory; zero indicates that there is no limit, or that the limit is not yet available
value | Integer | The Zenny value of the item; zero indicates that value is not yet available