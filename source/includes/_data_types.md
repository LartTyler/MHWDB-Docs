# Scalar Data Types
Type | Description
---- | -----------
String | Text of any length
Integer | A normal integer
Percent | A percentage, formatted as a whole number without the trailing percent sign; may be negative
Boolean | A normal boolean (either `true` or `false`)
Enum(...) | One of any value listed between the parenthesis
Array&lt;T&gt; | An array containing zero more values of type `T`
Null | Represents an empty value (usually used when a field has no value)

# Complex Data Types
## Armor Objects
```json
{
  "id": 1,
  "slug": "leather-headgear",
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
  "slots": [],
  "attributes": {
    "defense": 2,
    "resistFire": 2
  },
  "skills": [
    {
      "id": 207,
      "slug": "hunger-resistance-rank-1",
      "level": 1,
      "description": "Extends the time until your stamina cap decreases by 30%.",
      "modifiers": [],
      "skill": 67,
      "skillName": "Hunger Resistance"
    }
  ],
  "armorSet": {
    "id": 1,
    "name": "Leather",
    "rank": "low",
    "pieces": [
      1,
      2,
      3,
      4,
      5
    ]
  },
  "assets": {
    "imageMale": "https://assets.mhw-db.com/armor/...",
    "imageFemale": "https://assets.mhw-db.com/armor/..."
  }
}
```

> A sample `Armor` object. Some fields have been truncated for brevity.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the armor piece
slug | String | A human readable unique identifier
name | String | The name of the armor piece
type | [ArmorType](#armor-types) | The slot the armor piece fits in
rank | Enum("low", "high") | The rank of the armor piece
rarity | Integer | The rarity of the armor piece
defense | [Defense](#defense-objects) | Contains information about the defense values of the armor piece
resistances | [Resistances](#resistance-objects) | Contains information about elemental resistances
slots | Array&lt;[Slot](#slot-objects)&gt; | An array decoration slot information, containing between 0 and 3 items
skills | Array&lt;[SkillRank](#skillrank-objects)&gt; | An array of skill ranks granted by the armor
armorSet | [SetInfo](#set-info) | Contains information about the set that the armor piece belongs to 
assets | [ArmorAssets](#armor-assets) | Contains information about armor UI assets (such as preview images)
attributes | [ArmorAttributes](#armor-attributes) | See [ArmorAttributes](#armor-attributes) for more information

### Armor Types
An armor's type is one of the following values:

- `head`
- `chest`
- `gloves`
- `waist`
- `legs`

### Defense Objects
Field | Type | Description
----- | ---- | -----------
base | Integer | The armor's base defense value
max | Integer | The armor's defense value at max level
augmented | Integer | The armor's defense value when augmented\

### Resistance Objects
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
rank | Enum("low", "high") | The rank of the armor set
pieces | Array&lt;Integer&gt; | An array of IDs of all armor pieces in the set

### Armor Assets
**Please note** that some assets may be missing or incorrect. This is due to some sources (such as Kiranico or the
Fextralife wiki) also having incomplete information. Please verify that the asset is not also incorrect on those two
sites before reporting issues with image assets.

Field | Type | Description
----- | ---- | -----------
imageMale | String | URL to the male preview image, or `null` if one does not exist
imageFemale | String | URL to the female preview image, or `null` if one does not exist

### Armor Attributes
The `ArmorAttributes` is a dictionary of attribute modifiers attached to the armor piece. These fields are planned to be
slowly phased out over several releases, and instead provided by specialized fields (such as `resistances`).

Possible attribute keys are listed below.

Name | Type | Description
---- | ---- | -----------
requiredGender | Enum("male", "female") | If present, identifies the only gender that may equip the armor piece
slotsRank1 | Integer | (_deprecated_: use `slots` instead) The number of rank 1 slots available on the armor piece
slotsRank2 | Integer | (_deprecated_: use `slots` instead) The number of rank 2 slots available on the armor piece
slotsRank3 | Integer | (_deprecated_: use `slots` instead) The number of rank 3 slots available on the armor piece

## ArmorSet Objects
```json
{
  "id": 20,
  "name": "Anja",
  "rank": "low",
  "pieces": [
    {
      "id": 84,
      "slug": "anja-helm",
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
          "slug": "fire-attack-rank-1",
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
          "slug": "adrenaline-rank-1",
          "level": 1,
          "description": "Temporarily reduces stamina depletion when health is at 40% or lower.",
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
rank | Enum("low", "high") | The rank of the armor set
pieces | Array&lt;[Armor](#armor-objects)&gt; | An array of armor pieces that are part of the set
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
skill | [SkillRank](#skillrank-objects) | The skill rank provided by this tier of the armor set bonus

## Charm Objects
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
              "description": "Pukei-Pukei material. Obtained by breaking its head. Grants poisonous properties.",
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

Charm objects are don't technically represent the individual charms in the game. They're more like groups for the charms
themselves, keeping the different levels of a charm in one place.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the charm
slug | String | A human readable unique identifier
name | String | The name of the charm
ranks | Array&lt;[CharmRank](#charmrank-objects)&gt; | An array of the different ranks of the charm

### CharmRank Objects
CharmRank objects represent the actual in-game equipment. Since most charms can be upgraded to higher levels, they're
represented as ranks under a [Charm](#charm-objects) object, which groups them together.

Field | Type | Description
----- | ---- | -----------
name | String | The name of the charm rank (includes level)
level | Integer | The level of the charm rank
rarity | Integer | The rarity of the charm rank
skills | Array&lt;[SkillRank](#skillrank-objects)&gt; | An array of skill ranks provided by the charm
crafting | [CharmRank Crafting](#charmrank-crafting-objects) | An object describing crafting info for the charm

### CharmRank Crafting Objects
Field | Type | Description
----- | ---- | -----------
craftable | Boolean | Indicates whether or not the charm rank is directly craftable; if false, it must be upgraded from the previous level
materials | Array&lt;[CraftingCost](#craftingcost-objects)&gt; | An array of crafting material costs

## Decoration Objects
```json
{
  "id": 1,
  "slug": "antidote-jewel-1",
  "name": "Antidote Jewel 1",
  "rarity": 5,
  "skills": [
    {
      "id": 1,
      "slug": "poison-resistance-rank-1",
      "description": "Reduces the duration of poison by 30%.",
      "level": 1,
      "skill": 1,
      "skillName": "Poison Resistance",
      "modifiers": []
    }
  ],
  "slot": 1,
  "skill": 1
}
```

> A sample `Decoration` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the decoration
slug | String | A humand readable unique identifier
name | String | The name of the decoration
rarity | Integer | The rarity of the decoration
slot | Enum(1, 2, 3) | The slot that the decoration fits into
skills | Array&lt;[SkillRank](#skillrank-objects)&gt; | An array of skill ranks that the decoration provides
skill | Integer | (_deprecated_) The ID of the [Skill](#skill-objects) that the decoration provides

## Item Objects
```json
{
  "id": 1,
  "name": "Potion",
  "description": "Potion",
  "rarity": 1,
  "carryLimit": 10,
  "sellPrice": 8,
  "buyPrice": 0
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
sellPrice | Integer | The amount that the item may be sold for; zero indicates that the item may not be sold, or that the sell price is not yet available
buyPrice | Integer | The amount that the item may be bought for; zero indicates that the item may not be bought, or that the buy price is not yet available

## Skill Objects
```json
{
  "id": 15,
  "slug": "attack-boost",
  "name": "Attack Boost",
  "description": "Increases attack power. Also improves affinity at higher levels.",
  "ranks": [
    {
      "id": 39,
      "slug": "attack-boost-rank-1",
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
slug | String | A human readable unique identifier
name | String | The name of the skill
description | String | A short description of the skill
ranks | Array&lt;[SkillRank](#skillrank-objects)&gt; | An array of available ranks for the skill
modifiers | [SkillRank Modifiers](#skillrank-modifiers) | See [SkillRank Modifiers](#skillrank-modifiers) for more information

### SkillRank Objects
Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the skill rank
slug | String | A human readable unique identifier
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
sharpnessBonus | Integer | Modifies the maximum sharpness of a weapon
resistAll | Integer | Modifies all elemental resistances
resistFire | Integer | Modifies fire resistance
resistWater | Integer | Modifies water resistance
resistIce | Integer | Modifies ice resistance
resistThunder | Integer | Modifies thunder resistance
resistDragon | Integer | Modifies dragon resistance

# Shared Objects
Some objects are shared between most or all of the objects in the API. Such objects are documented below.

## CraftingCost Objects
```json
{
  "quantity": 1,
  "item": {
    "id": 231,
    "name": "Pukei-Pukei Sac",
    "description": "Pukei-Pukei material. Obtained by breaking its head. Grants poisonous properties.",
    "rarity": 0,
    "carryLimit": 0,
    "sellPrice": 0,
    "buyPrice": 0
  }
}
```

> A sample `CraftingCost` object.

Field | Type | Description
----- | ---- | -----------
quantity | Integer | The quantity of the item needed for the craft
item | [Item](#item-objects) | The item to be consumed during crafting

## Slot Objects
```json
{
  "rank": 1
}
```

> A sample `Slot` object.

Field | Type | Description
----- | ---- | -----------
rank | Integer | The rank of the slot