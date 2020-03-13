# Skills
## Get All Skills
```shell
curl https://mhw-db.com/skills
```

```javascript
fetch('https://mhw-db.com/skills')
    .then(response => response.json())
    .then(skills => {
        // your code here
    });
```

> The above command returns an array of [`Skill`](#skill-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 1,
    "name": "Poison Resistance",
    "description": "Grants protection against the effects of poison.",
    "ranks": [
      {
        "id": 1,
        "skill": 1,
        "level": 1,
        "description": "Reduces the duration of poison by 30%.",
        "modifiers": []
      }
    ]
  }
]
```

This endpoint retrieves a list of all skills.

### HTTP Request
`GET https://mhw-db.com/skills`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of skills and their ranks. For field information, see the [Skill Fields](#skill-fields) section.

## Get a Specific Skill
```shell
curl "https://mhw-db.com/skills/1"
```

```javascript
fetch('https://mhw-db.com/skills/1')
    .then(response => response.json())
    .then(skill => {
        // your code here
    });
```

> The above command returns a single [`Skill`](#skill-fields) object. Some fields have been truncated for brevity.


```json
{
  "id": 1,
  "name": "Poison Resistance",
  "description": "Grants protection against the effects of poison.",
  "ranks": [
    {
      "id": 1,
      "skill": 1,
      "level": 1,
      "description": "Reduces the duration of poison by 30%.",
      "modifiers": []
    }
  ]
}
```

This endpoint retrieves a specific skill and it's ranks.

### HTTP Request
`GET https://mhw-db.com/skills/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the skill to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single skill and all of it's ranks. For field information, see the [Skill Fields](#skill-fields) section.

## Skill Fields
```json
{
  "id": 15,
  "name": "Attack Boost",
  "description": "Increases attack power. Also ...",
  "ranks": [
    {
      "id": 39,
      "skill": 15,
      "level": 1,
      "description": "Attack +3",
      "modifiers": {
        "attack": 3
      }
    }
  ]
}
```

> A sample `Skill` object. Some fields have been truncated for brevity.

Field | Type | Description
----- | ---- | --------- | -----------
id | Integer | The skill's ID
name | String | The name of the skill
description | String | A short description of the skill
ranks | Array&lt;[SkillRank](#skillrank-fields)&gt; | An array of available ranks for the skill

### SkillRank Fields
Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the skill rank
level | Integer | The numeric level of the skill rank (starting at 1)
description | String | A text description of the skill rank
skill | Integer | The ID of the skill that the rank belongs to
skillName | String | The name of the skill that the rank belongs to
modifiers | [SkillRank Modifiers](#skillrank-modifiers) | See [SkillRank Modifiers](#skillrank-modifiers) for more information

### SkillRank Modifiers
These objects describe the stat modifiers granted by a skill rank. The object is a simple dictionary, mapping string keys
to a value (usually an integer). All possible modifier fields can be found in the table below.

Name | Type | Description
---- | ---- | -----------
affinity | Percent | Modifies the affinity of a weapon
attack | Integer | Modifies the attack value of a weapon
damageFire | Integer | Modifies fire damage
damageWater | Integer | Modifies water damage
damageIce | Integer | Modifies ice damage
damageThunder | Integer | Modifies thunder damage
damageDragon | Integer | Modifies dragon damage
defense | Integer | Modifies the character's defense
health | Integer | Modifies the character's maximum health
sharpnessBonus | Integer | Modifies the maximum sharpness of a weapon
resistAll | Integer | Modifies all elemental resistances
resistFire | Integer | Modifies fire resistance
resistWater | Integer | Modifies water resistance
resistIce | Integer | Modifies ice resistance
resistThunder | Integer | Modifies thunder resistance
resistDragon | Integer | Modifies dragon resistance