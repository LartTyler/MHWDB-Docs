# Monsters
## Get All Monsters
```shell
curl "https://mhw-db.com/monsters"
```

```javascript
fetch('https://mhw-db.com/monsters')
	.then(response => response.json())
	.then(monsters => {
		// your code here
	});
```

> The above command returns an array of [`Monster`](#monster-fields) objects. Some fields have been truncated for brevity.

```json
[
    {
        "id": 1,
        "name": "Apceros",
        "type": "small",
        "species": "herbivore",
        "description": "Herbivores that inhabit the Wildspire Waste. They've developed...",
        "elements": [],
        "ailments": [],
        "locations": [],
        "resistances": [],
        "weaknesses": [
            {
                "element": "thunder",
                "stars": 1,
                "condition": null
            }
        ],
        "rewards": [
            {
                "id": 1,
                "item": {
                    "id": 67,
                    "name": "Raw Meat",
                    "description": "Meat carved from a monster. Can be ...",
                    "rarity": 1,
                    "carryLimit": 10,
                    "value": 5
                },
                "conditions": [
                    {
                        "type": "carve",
                        "subtype": null,
                        "rank": "low",
                        "quantity": 1,
                        "chance": 100
                    }
                ]
            }
        ]
    }
]
```

This endpoint retrieves all monsters.

### HTTP Request
`GET https://mhw-db.com/monsters`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of monsters. For field information, see the [Monster Fields](#monster-fields) section.

## Get a Specific Monster
```shell
curl "https://mhw-db.com/monsters/1"
```

```javascript
fetch('https://mhw-db.com/monsters/1')
	.then(response => response.json())
	.then(ailment => {
		// your code here
	});
```

> The above command returns a single [`Monster`](#monster-fields) object. Some fields have been truncated for brevity.

```json
{
    "id": 1,
    "name": "Apceros",
    "type": "small",
    "species": "herbivore",
    "description": "Herbivores that inhabit the Wildspire Waste. They've developed...",
    "elements": [],
    "ailments": [],
    "locations": [],
    "resistances": [],
    "weaknesses": [
        {
            "element": "thunder",
            "stars": 1,
            "condition": null
        }
    ],
    "rewards": [
        {
            "id": 1,
            "item": {
                "id": 67,
                "name": "Raw Meat",
                "description": "Meat carved from a monster. Can be ...",
                "rarity": 1,
                "carryLimit": 10,
                "value": 5
            },
            "conditions": [
                {
                    "type": "carve",
                    "subtype": null,
                    "rank": "low",
                    "quantity": 1,
                    "chance": 100
                }
            ]
        }
    ]
}
```

This endpoint retrieves a specific monster.

### HTTP Request
`GET https://mhw-db.com/monsters/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the monster to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single monster. For field information, see the [Monster Fields](#monster-fields) section.

## Monster Fields
```json
{
    "id": 2,
    "name": "Vaal Hazak",
    "type": "large",
    "species": "elder dragon",
    "description": "A grotesque Elder Dragon, that inhabits the...",
    "elements": [],
    "ailments": [
        {
            "id": 1,
            "name": "Effluvia",
            "description": "A blight caused by the mists in the Rotten Vale, and by certain...",
            "recovery": {...},
            "protection": {...}
        }
    ],
    "locations": [
        {
            "id": 1,
            "name": "Rotten Vale",
            "zoneCount": 16
        }
    ],
    "resistances": [
        {
            "element": "water",
            "condition": null
        }
    ],
    "weaknesses": [
        {
            "element": "fire",
            "stars": 3,
            "condition": null
        }
    ],
    "reward": [
        {
            "id": 1,
            "item": {...},
            "conditions": [...]
        }
    ]
}
```

> A sample `Monster` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the monster
name | String | The name of the monster
type | [MonsterType](#monster-types) | The monster's category
species | [MonsterSpecies](#monster-species) | The monster's species
description | String | A brief description of the monster
elements | Array&lt;[ElementType](#element-types)&gt; | An array of elements used by the monster
ailments | Array&lt;[Ailment](#ailment-fields)&gt; | An array of ailments inflicted by the monster
locations | Array&lt;[Location](#location-fields)&gt; | An array of locations where the monster can be found
resistances | Array&lt;[MonsterResistance](#monster-resistance-fields)&gt; | An array of the monster's elemental resistances
weakness | Array&lt;[MonsterWeakness](#monster-weakness-fields)&gt; | An array of the monster's elemental weaknesses
rewards | Array&lt;[MonsterReward](#monster-reward-fields)&gt; | An array of the possible rewards / drops from the monster

### Monster Types
A monster's type is one of the following values.

- `small`
- `large`

### Monster Species
A monster's species is one of the following values.

- `bird wyvern`
- `brute wyvern`
- `elder dragon`
- `fanged beast`
- `fanged wyvern`
- `fish`
- `flying wyvern`
- `herbivore`
- `lynian`
- `neopteron`
- `piscine wyvern`
- `relict`
- `wingdrake`

### Monster Resistance Fields
Field | Type | Description
----- | ---- | -----------
element | [ElementType](#element-types) | The element the resistance applies to
condition | String | A text description of the condition under which the resistance applies (i.e. "covered in mud"), or `null` if the resistance is always active

### Monster Weakness Fields
Field | Type | Description
----- | ---- | -----------
element | [ElementType](#element-types) | The element the weakness applies to
stars | Integer | The magnitude of the weakness; corresponds directly to the number of stars shown in the hunter's log in-game
condition | String | A text description of the condition under which the weakness applies (i.e. "covered in mud"), or `null` if the weakness is always active

### Monster Reward Fields
Field | Type | Description
----- | ---- | -----------
id | Integer | The reward's ID
item | [Item](#item-fields) | The item granted by the reward
conditions | Array&lt;[RewardCondition](#rewardcondition-objects)&gt; | An array of conditions that cause the reward to be granted