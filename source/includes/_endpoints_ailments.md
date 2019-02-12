# Ailments
## Get All Ailments
```shell
curl "https://mhw-db.com/ailments"
```

```javascript
fetch('https://mhw-db.com/ailments')
	.then(response => response.json())
	.then(ailments => {
		// your code here
	});
```

> The above command returns an array of [`Ailment`](#ailment-fields) objects. Some fields have been truncated for brevity.

```json
[
    {
        "id": 1,
        "name": "Blastblight",
        "description": "Blastblight will cause a ...",
        "recovery": {
            "actions": [...],
            "items": [...]
        },
        "protection": {
            "items": [...],
            "skills": [...]
        }
    }
]
```

This endpoint retrieves all ailments

### HTTP Request
`GET https://mhw-db.com/ailments`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of ailments. For field information, see the [Ailment Fields](#ailment-fields) section.

## Get a Specific Ailment
```shell
curl "https://mhw-db.com/ailments/1"
```

```javascript
fetch('https://mhw-db.com/ailments/1')
	.then(response => response.json())
	.then(ailment => {
		// your code here
	});
```

> The above command returns a single [`Ailment`](#ailment-fields) object. Some fields have been truncated for brevity.

```json
{
    "id": 1,
    "name": "Blastblight",
    "description": "Blastblight will cause a ...",
    "recovery": {
        "actions": [...],
        "items": [...]
    },
    "protection": {
        "items": [...],
        "skills": [...]
    }
}
```

This endpoint retrieves a specific ailment.

### HTTP Request
`GET https://mhw-db.com/ailments/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the ailment to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single ailment. For field information, see the [Ailment Fields](#ailment-fields) section.

## Ailment Fields
```json
{
    "id": 2,
    "name": "Bleeding",
    "description": "Bleeding causes damage when performing certain actions, such as running, ...",
    "recovery": {
        "actions": [
            "crouch"
        ],
        "items": [
            {
                "id": 11,
                "name": "Well-done Steak",
                "description": "Provides a moderate boost to your stamina and keeps it at max for a ...",
                "rarity": 2,
                "value": 48,
                "carryLimit": 10
            }
        ]
    },
    "protection": {
        "items": [],
        "skills": [
            {
                "id": 7,
                "name": "Bleeding Resistance",
                "description": "Grants protection against bleeding."
            }
        ]
    }
}
```

> A sample `Ailment` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the ailment
name | String | The name of the ailment
description | String | A short description of the ailment
recovery | [Recovery](#recovery-fields) | An object describing methods to recover from the ailment
protection | [Protection](#protection-fields) | An object describing methods for mitigating or preventing the ailment

### Recovery Fields
Field | Type | Description
----- | ---- | -----------
actions | Array&lt;[RecoveryAction](#recovery-actions)&gt; | An array of actions that can be taken to remove the ailment
items | Array&lt;[Item](#item-fields)&gt; | An array of items that can remove the ailment

### Recovery Actions
- crouch
- dodge

### Protection Fields
Field | Type | Description
----- | ---- | -----------
items | Array&lt;[Item](#item-fields)&gt; | An array of items that can prevent the ailment
skills | Array&lt;[Skill](#skill-fields)&gt; | An array of skills that can prevent the ailment