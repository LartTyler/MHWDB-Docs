# Charms
The API splits charms up into two different objects. The `Charm` object, which is essentially a group of the different levels a charm can be, and the `CharmRank` object, which represents a charm at a particular step in it's upgrade tree. All charms are represented this way, even charms that can't be upgraded.

## Get All Charms
```shell
curl "https://mhw-db.com/charms"
```

```javascript
fetch('https://mhw-db.com/charms')
    .then(response => response.json())
    .then(charms => {
        // your code here
    });
```

> The command above returns an array of [`Charm`](#charm-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 234,
    "slug": "poison-charm",
    "name": "Poison Charm",
    "ranks": [
      {
        "name": "Poison Charm 1",
        "level": 1,
        "rarity": 3,
        "skills": [...],
        "crafting": {
          "craftable": true,
          "materials": [...]
        }
      }
    ]
  }
]
```

This endpoint retrieves all charms.

### HTTP Request
`GET https://mhw-db.com/charms`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
q | No | See the [Searching the API](#searching-the-api)

### Response
This endpoint returns an array of charms. For field information, see the [Charm Fields](#charm-fields) section.

## Get a Specific Charm
```shell
curl "https://mhw-db.com/charms/234
```

```javascript
fetch('https://mhw-db.com/charms/234')
    .then(response => response.json())
    .then(charm => {
        // your code here
    });
```

> The above command returns a single [`Charm`](#charm-fields) object. Some fields have been truncated for brevity.

```json
{
  "id": 234,
  "slug": "poison-charm",
  "name": "Poison Charm",
  "ranks": [
    {
      "name": "Poison Charm 1",
      "level": 1,
      "rarity": 3,
      "skills": [...],
      "crafting": {
        "craftable": true,
        "materials": [...]
      }
    }
  ]
}
```

This endpoint retrieves a specific charm and it's ranks.

### HTTP Request
`GET https://mhw-db.com/charms/<idOrSlug>`

### Path Parameters
Parameter | Required | Description
--------- | -------- | -----------
idOrSlug | Integer &#124; String | The ID or slug of the charm to retrieve

### Response
This endpoint returns a single charm and all of it's ranks. For field information, see the [Charm Fields](#charm-fields) section.

## Charm Fields
```json
{
  "id": 234,
  "slug": "poison-charm",
  "name": "Poison Charm",
  "ranks": [
    {
      "name": "Poison Charm 1",
      "level": 1,
      "rarity": 3,
      "skills": [
        {
          "id": 1,
          "slug": "poison-resistance-rank-1",
          "level": 1,
          "description": "Reduces the duration of poison by 30%.",
          "skill": 1,
          "skillName": "Poison Resistance",
          "modifiers": []
        }
      ],
      "crafting": {
        "craftable": true,
        "materials": [
          {
            "quantity": 1,
            "item": {
              "id": 231,
              "name": "Pukei-Pukei Sac",
              "description": "Pukei-Pukei material. Obtained by ...",
              "rarity": 0,
              "carryLimit": 0,
              "sellPrice": 0,
              "buyPrice": 0
            }
          }
        ]
      }
    }
  ]
}
```

> A sample `Charm` object. Some fields have been truncated for brevity.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the charm
slug | String | A human readable unique identifier
name | String | The name of the charm
ranks | Array&lt;[CharmRank](#charmrank-fields)&gt; | An array of the different ranks of the charm

### CharmRank Fields
CharmRank objects represent the actual in-game equipment. Since most charms can be upgraded to higher levels, they're
represented as ranks under a [Charm](#charm-fields) object, which groups them together.

Field | Type | Description
----- | ---- | -----------
name | String | The name of the charm rank (includes level)
level | Integer | The level of the charm rank
rarity | Integer | The rarity of the charm rank
skills | Array&lt;[SkillRank](#skillrank-fields)&gt; | An array of skill ranks provided by the charm
crafting | [CharmRank Crafting](#charmrank-crafting-fields) | An object describing crafting info for the charm

### CharmRank Crafting Fields
Field | Type | Description
----- | ---- | -----------
craftable | Boolean | Indicates whether or not the charm rank is directly craftable; if false, it must be upgraded from the previous level
materials | Array&lt;[CraftingCost](#craftingcost-objects)&gt; | An array of crafting material costs