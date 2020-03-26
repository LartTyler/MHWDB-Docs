# Armor Sets
## Get All Armor Sets
```shell
curl "https://mhw-db.com/armor/sets"
```

```javascript
fetch('https://mhw-db.com/armor/sets')
    .then(response => response.json())
    .then(sets => {
        // your code here
    });
```

> The command above returns an array of [`ArmorSet`](#armorset-fields) object. Some fields have been truncated for brevity.

```json
[
  {
    "id": 1,
    "name": "Leather",
    "rank": "low",
    "pieces": [
      {
        "id": 1,
        "name": "Leather Headgear",
        "type": "head",
        "rank": "low",
        "rarity": 1,
        "armorSet": 1,
        "attributes": {...},
        "skills": [...],
        "assets": {
          "imageMale": "https://assets.mhw-db.com/armor/...",
          "imageFemale": "https://assets.mhw-db.com/armor/..."
        }
      }
    ],
    "bonus": null
  }
]
```

This endpoint retrieves all armor sets.

### HTTP Request
`GET https://mhw-db.com/armor/sets`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of armor sets. For field information, see the [ArmorSet Fields](#armorset-fields) section.

## Get a Specific Armor Set
```shell
curl https://mhw-db.com/armor/sets/20
```

```javascript
fetch('https://mhw-db.com/armor/sets/20')
    .then(response => response.json())
    .then(set => {
        // your code here
    });
```

> The command above returns a single [`ArmorSet`](#armorset-fields) object. Some fields have been truncated for brevity.

```json
{
  "id": 20,
  "name": "Anja",
  "rank": "low",
  "pieces": [
    {
      "id": 84,
      "name": "Anja Helm",
      "type": "head",
      "rank": "low",
      "rarity": 3,
      "armorSet": 20,
      "attributes": {...},
      "skills": [...],
      "assets": {
        "imageMale": "https://assets.mhw-db.com/armor/...",
        "imageFemale": "https://assets.mhw-db.com/armor/..."
      }
    }
  ],
  "bonus": {
    "id": 1,
    "name": "Anjanath Power",
    "ranks": [
      {
        "pieces": 3,
        "skill": {
          "id": 311,
          "level": 1,
          "description": "Temporarily reduces stamina ...",
          "modifiers": [...],
          "skill": 112,
          "skillName": "Adrenaline"
        }
      }
    ]
  }
}
```

This endpoint retrieves a specific armor set by it's ID.

### HTTP Request
`GET https://mhw-db.com/armor/sets/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the armor set to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single armor set. For field information, see the [ArmorSet Fields](#armorset-fields) section.

## ArmorSet Fields
```json
{
  "id": 20,
  "name": "Anja",
  "rank": "low",
  "pieces": [
    {
      "id": 84,
      "name": "Anja Helm",
      "type": "head",
      "rank": "low",
      "rarity": 3,
      "armorSet": 20,
      "attributes": {
        "defense": 20,
        "resistFire": 3,
        "resistWater": -3,
        "resistThunder": -1,
        "resistIce": -1
      },
      "skills": [
        {
          "id": 80,
          "level": 1,
          "description": "Fire attack +30",
          "modifiers": {
            "damageFire": 30
          },
          "skill": 26,
          "skillName": "Fire Attack"
        }
      ],
      "assets": {
        "imageMale": "https://assets.mhw-db.com/armor/...",
        "imageFemale": "https://assets.mhw-db.com/armor/..."
      }
    }
  ],
  "bonus": {
    "id": 1,
    "name": "Anjanath Power",
    "ranks": [
      {
        "pieces": 3,
        "skill": {
          "id": 311,
          "level": 1,
          "description": "Temporarily reduces stamina depletion ...",
          "modifiers": [],
          "skill": 112,
          "skillName": "Adrenaline"
        }
      }
    ]
  }
}
```

> A sample `ArmorSet` object. Some fields have been truncated for brevity.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the armor set
name | String | The name of the armor set
rank | [Rank](#rank-types) | The rank of the armor set
pieces | Array&lt;[Armor](#armor-fields)&gt; | An array of armor pieces that are part of the set
bonus | [ArmorSetBonus](#armorset-bonus) | Either an object describing armor set bonus information, or `null`

### ArmorSet Bonus
Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the bonus
name | String | The name of the bonus
ranks | Array&lt;[ArmorSetBonusRank](#armorset-bonus-rank)&gt; | An array of the different ranks of the bonus

### ArmorSet Bonus Rank
Field | Type | Description
----- | ---- | -----------
pieces | Integer | The minium number of armor pieces that must be equipped to trigger this level of the bonus
skill | [SkillRank](#skillrank-fields) | The skill rank provided by this tier of the armor set bonus