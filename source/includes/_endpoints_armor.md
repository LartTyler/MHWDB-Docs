# Armor
## Get All Armor Pieces
```shell
curl "https://mhw-db.com/armor"
```

```javascript
fetch('https://mhw-db.com/armor')
    .then(response => response.json())
    .then(armorPieces => {
        // your code here
    });
```

> The above command returns an array of [`Armor`](#armor-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 1,
    "name": "Leather Headgear",
    "type": "head",
    "rank": "low",
    "rarity": 1,
    "defense": {
      "base": 2,
      "max": 38,
      "augmented": 68
    },
    "resistances": {
      "fire": 2,
      "water": 0,
      "ice": 0,
      "thunder": 0,
      "dragon": 0
    },
    "slots": [...],
    "attributes": {...},
    "skills": [...],
    "armorSet": {
      "id": 1,
      "name": "Leather",
      "rank": "low",
      "pieces": [...]
    },
    "assets": {
      "imageMale": "https://assets.mhw-db.com/armor/...",
      "imageFemale": "https://assets.mhw-db.com/armor/..."
    },
    "crafting": {
      "materials": [...]
    }
  }
]
```

This endpoint retrieves all armor pieces.

### HTTP Request
`GET https://mhw-db.com/armor`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of armor pieces. For field information, see the [Armor Fields](#armor-fields) section.

## Get a Specific Armor Piece
```shell
curl "https://mhw-db.com/armor/1"
```

```javascript
fetch('https://mhw-db.com/armor/1')
    .then(response => response.json())
    .then(armor => {
        // your code here
    });
```

> The above command returns a single [`Armor`](#armor-fields) object. Some fields have been truncated for brevity.

```json
{
  "id": 1,
  "name": "Leather Headgear",
  "type": "head",
  "rank": "low",
  "rarity": 1,
  "defense": {
    "base": 2,
    "max": 38,
    "augmented": 68
  },
  "resistances": {
    "fire": 2,
    "water": 0,
    "ice": 0,
    "thunder": 0,
    "dragon": 0
  },
  "slots": [...],
  "attributes": {...},
  "skills": [...],
  "armorSet": {
    "id": 1,
    "name": "Leather",
    "rank": "low",
    "pieces": [...]
  },
  "assets": {
    "imageMale": "https://assets.mhw-db.com/armor/...",
    "imageFemale": "https://assets.mhw-db.com/armor/..."
  },
  "crafting": {
    "materials": [...]
  }
}
```

This endpoint retrieves an armor piece by it's ID.

### HTTP Request
`GET https://mhw-db.com/armor/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the armor piece to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single armor piece. For field information, see the [Armor Fields](#armor-fields) section.

## Armor Fields
```json
{
  "id": 159,
  "name": "Leather Headgear Beta",
  "type": "head",
  "rank": "high",
  "rarity": 5,
  "defense": {
    "base": 32,
    "max": 54,
    "augmented": 70
  },
  "resistances": {
    "fire": 2,
    "water": 0,
    "ice": 0,
    "thunder": 0,
    "dragon": 0
  },
  "slots": [
    {
      "rank": 1
    }
  ],
  "attributes": {},
  "skills": [
    {
      "id": 207,
      "level": 1,
      "description": "Extends the time until ...",
      "modifiers": [],
      "skill": 67,
      "skillName": "Hunger Resistance"
    }
  ],
  "armorSet": {
    "id": 35,
    "name": "Leather Beta",
    "rank": "high",
    "pieces": [
      159,
      160,
      161,
      162,
      163
    ]
  },
  "assets": {
    "imageMale": "https://assets.mhw-db.com/armor/...",
    "imageFemale": "https://assets.mhw-db.com/armor/..."
  },
  "crafting": {
    "materials": [
      {
        "quantity": 2,
        "item": {
          "id": 119,
          "name": "Carbalite Ore",
          "description": "Ore obtained from mining outcrops. Still ...",
          "rarity": 0,
          "carryLimit": 0,
          "sellPrice": 0,
          "buyPrice": 0
        }
      }
    ]
  }
}
```

> A sample `Armor` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the armor piece
name | String | The name of the armor piece
type | [ArmorType](#armor-types) | The slot the armor piece fits in
rank | [Rank](#rank-types) | The rank of the armor piece
rarity | Integer | The rarity of the armor piece
defense | [Defense](#defense-objects) | Contains information about the defense values of the armor piece
resistances | [Resistances](#armor-resistances) | Contains information about elemental resistances
slots | Array&lt;[Slot](#slot-objects)&gt; | An array decoration slot information, containing between 0 and 3 items
skills | Array&lt;[SkillRank](#skillrank-objects)&gt; | An array of skill ranks granted by the armor
armorSet | [SetInfo](#set-info) | Contains information about the set that the armor piece belongs to
assets | [ArmorAssets](#armor-assets) | Contains information about armor UI assets (such as preview images)
crafting | [ArmorCraftingInfo](#armor-crafting-info) | Contains crafting information for the armor piece
attributes | [ArmorAttributes](#armor-attributes) | See [ArmorAttributes](#armor-attributes) for more information

### Armor Ranks
An armor's rank can be one of the following values:

- low
- high

### Armor Types
An armor's type is one of the following values:

- head
- chest
- gloves
- waist
- legs

### Defense Objects
Field | Type | Description
----- | ---- | -----------
base | Integer | The armor's base defense value
max | Integer | The armor's defense value at max level
augmented | Integer | The armor's defense value when augmented\

### Armor Resistances
Field | Type | Description
----- | ---- | -----------
fire | Integer | The armor's fire resistance
water | Integer | The armor's water resistance
ice | Integer | The armor's ice resistance
thunder | Integer | The armor's thunder resistance
dragon | Integer | The armor's dragon resistance

### Set Info
Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the armor set
name | String | The name of the armor set
rank | [ArmorRank](#armor-ranks) | The rank of the armor set
pieces | Array&lt;Integer&gt; | An array of IDs of all armor pieces in the set

### Armor Assets
**Please note** that some assets may be missing or incorrect. This is due to some sources (such as Kiranico or the
Fextralife wiki) also having incomplete information. Please verify that the asset is not also incorrect on those two
sites before reporting issues with image assets.

Field | Type | Description
----- | ---- | -----------
imageMale | String | URL to the male preview image, or `null` if one does not exist
imageFemale | String | URL to the female preview image, or `null` if one does not exist

### Armor Crafting Info
Field | Type | Description
----- | ---- | -----------
materials | Array&lt;[CraftingCost](#craftingcost-objects)&gt; | An array of crafting material costs

### Armor Attributes
The `ArmorAttributes` is a dictionary of attribute modifiers attached to the armor piece. These fields are planned to be
slowly phased out over several releases, and instead provided by specialized fields (such as `resistances`).

Possible attribute keys are listed below.

Name | Type | Description
---- | ---- | -----------
requiredGender | Enum("male", "female") | If present, identifies the only gender that may equip the armor piece