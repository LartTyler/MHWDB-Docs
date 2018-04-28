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
rank | [ArmorRank](#armor-ranks) | The rank of the armor piece
rarity | Integer | The rarity of the armor piece
defense | [Defense](#defense-objects) | Contains information about the defense values of the armor piece
resistances | [Resistances](#armor-resistances) | Contains information about elemental resistances
slots | Array&lt;[Slot](#slot-objects)&gt; | An array decoration slot information, containing between 0 and 3 items
skills | Array&lt;[SkillRank](#skillrank-objects)&gt; | An array of skill ranks granted by the armor
armorSet | [SetInfo](#set-info) | Contains information about the set that the armor piece belongs to 
assets | [ArmorAssets](#armor-assets) | Contains information about armor UI assets (such as preview images)
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

### Armor Attributes
The `ArmorAttributes` is a dictionary of attribute modifiers attached to the armor piece. These fields are planned to be
slowly phased out over several releases, and instead provided by specialized fields (such as `resistances`).

Possible attribute keys are listed below.

Name | Type | Description
---- | ---- | -----------
requiredGender | Enum("male", "female") | If present, identifies the only gender that may equip the armor piece
slotsRank1 | Integer | ([_deprecated_](#deprecation-schedule)) The number of rank 1 slots available on the armor piece
slotsRank2 | Integer | ([_deprecated_](#deprecation-schedule)) The number of rank 2 slots available on the armor piece
slotsRank3 | Integer | ([_deprecated_](#deprecation-schedule)) The number of rank 3 slots available on the armor piece

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
rank | [ArmorRank](#armor-ranks) | The rank of the armor set
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
  "description": "Increases attack power. Also ...",
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

## Weapon Objects
```json
{
  "id": 94,
  "slug": "iron-grace-3",
  "name": "Iron Grace 3",
  "type": "long-sword",
  "rarity": 5,
  "slots": [
    {
      "rank": 1
    }
  ],
  "elements": [
    {
      "type": "water",
      "damage": 120,
      "hidden": true
    }
  ],
  "attributes": {
    "attack": 462,
    "slotsRank1": 1,
    "elementHidden": true,
    "elementDamage": 120,
    "elementType": "Water",
    "sharpnessRed": 22,
    "sharpnessOrange": 13,
    "sharpnessYellow": 12,
    "sharpnessGreen": 20,
    "sharpnessBlue": 8
  },
  "crafting": {
    "craftable": false,
    "previous": 93,
    "branches": [
      95
    ],
    "craftingMaterials": [],
    "upgradeMaterials": [
      {
        "quantity": 8,
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
  },
  "sharpness": {
    "red": 22,
    "orange": 13,
    "yellow": 12,
    "green": 20,
    "blue": 8
  }
}
```

> A sample `Weapon` object. Some fields have been truncated for brevity.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the weapon
slug | String | A human readable unique identifier
name | String | The name of the weapon
type | [WeaponType](#weapon-types) | The weapon's type
rarity | Integer | The rarity of the weapon
slots | Array&lt;[Slot](#slot-objects)&gt; | An array containing slot information for the weapon
elements | Array&lt;[WeaponElement](#weapon-elements)&gt; | An array containing element damage info for the weapon
crafting | [WeaponCraftingInfo](#weapon-crafting-info) | Contains crafting information for the weapon
sharpness | [WeaponSharpness](#weapon-sharpness) | Contains sharpness information
attributes | [WeaponAttributes](#weapon-attributes) | See [WeaponAttributes](#weapon-attributes) for more information

### Weapon Types
A weapon's type can be one of the following values:

| | | |
|-|-|-|
great-sword | long-sword | sword-and-shield
dual-blades | hammer | hunting-horn
lance | gunlance | switch-axe
charge-blade | insect-glaive | light-bowgun
heavy-bowgun | bow

### Weapon Crafting Info
Field | Type | Description
----- | ---- | -----------
craftable | Boolean | Indicates whether or not the weapon may be directly crafted
previous | Integer &#124; Null | The ID of the weapon that this weapon is upgraded from, or `null` if nothing upgrades into this weapon
branches | Array&lt;Integer&gt; | An array of IDs that the weapon may be upgraded into
craftingMaterials | Array&lt;[CraftingCost](#craftingcost-objects)&gt; | An array containing the material cost to create the weapon; will always be empty if `craftable` is false
upgradeMaterials | Array&lt;[CraftingCost](#craftingcost-objects)&gt; | An array containing the material cost to upgrade the weapon identified by `previous` into this weapon; will always be empty if `previous` is null

### Weapon Elements
Field | Type | Description
----- | ---- | -----------
type | [ElementType](#element-types) | The element's damage type
damage | Integer | The power of the element
hidden | Boolean | Indicates whether or not the element is a hidden element

### Weapon Sharpness
Since MHW does not disclose actual sharpness values, sharpness is represented as a whole number out of 100, with 100 being the maximum possible sharpness a weapon can have. The total sharpness value is split across several different colors, indicating what percentage of the weapon's max sharpness belongs to each color.

It's easiest to visualize sharpness as a single bar, 100 pixels wide. For example, the great sword "<a href="https://mhw-db.com/weapons/6" target="_blank">Buster Sword 3</a>" has 25 red, 12 orange, 13 yellow, 20 green, and 5 blue. A bar representing that might look like the bar below.

<div class="sharpness-bar">
  <div class="red" style="width: 25px"></div>
  <div class="orange" style="width: 12px;"></div>
  <div class="yellow" style="width: 13px;"></div>
  <div class="green" style="width: 20px;"></div>
  <div class="blue" style="width: 5px;"></div>

  <div class="clearfix"></div>
</div>

All fields in the sharpness can be found in table below.

Field | Type | Description
----- | ---- | -----------
red | Integer | The red sharpness value
orange | Integer | The orange sharpness value
yellow | Integer | The yellow sharpness value
green | Integer | The green sharpness value
blue | Integer | The blue sharpness value

### Weapon Attributes
The weapon attributes object is a dictionary of attribute modifiers attached to a weapon. These fields are planned to be slowly phased out over several releases, and instead provided by specialized fields (such as `sharpness`).

Possible attribute keys are listed below.

Name | Type | Description
---- | ---- | -----------
ammoCapacities | [AmmoCapacities](#ammo-capacities) | For "light-bowgun" and "heavy-bowgun" weapons only
attack | Integer | The attack power of the weapon
affinity | Integer | The affinity of the weapon
boostType | [BoostType](#boost-types) | For "insect-glaive" weapons only
coatings | Array&lt;[Coating](#bow-coatings)&gt; | For "bow" weapons only
damageType | [DamageType](#damage-types) | The type of damage the weapon deals
deviation | [Deviation](#bowgun-deviation) | For "light-bowgun" and "heavy-bowgun" weapons only
elderseal | [Elderseal](#elderseal-types) | The elderseal type attributed to the weapon
phialType | [PhialType](#phial-types) | For "switch-axe" and "charge-blade" weapons only
shellingType | [ShellingType](#shelling-types) | For "gunlance" weapons only
specialAmmo | [SpecialAmmoType](#special-ammo-types) | For "light-bowgun" and "heavy-bowgun" weapons only
elementType | [ElementType](#element-types) | ([_deprecated_](#deprecation-schedule)) The primary element type of the weapon
elementDamage | Integer | ([_deprecated_](#deprecation-schedule)) The power of the weapon's primary element
elementHidden | Boolean | ([_deprecated_](#deprecation-schedule)) If true, indicates that the primary element is a hidden element
elementType2 | [ElementType](#element-types)) | ([_deprecated_](#deprecation-schedule)) The secondary element type of the weapon
elementDamage2 | Integer | ([_deprecated_](#deprecation-schedule)) The power of the weapon's secondary element
elementHidden2 | Boolean | ([_deprecated_](#deprecation-schedule)) If true, indicates that the secondary element is a hidden element
sharpnessRed | Integer | ([_deprecated_](#deprecation-schedule)) The size of the weapon's red sharpness bar
sharpnessOrange | Integer | ([_deprecated_](#deprecation-schedule)) The size of the weapon's orange sharpness bar
sharpnessYellow | Integer | ([_deprecated_](#deprecation-schedule)) The size of the weapon's yellow sharpness bar
sharpnessGreen | Integer | ([_deprecated_](#deprecation-schedule)) The size of the weapon's green sharpness bar
sharpnessBlue | Integer | ([_deprecated_](#deprecation-schedule)) The size of the weapon's blue sharpness bar
sharpnessWhite | Integer | ([_deprecated_](#deprecation-schedule)) The size of the weapon's white sharpness bar
slotsRank1 | Integer | ([_deprecated_](#deprecation-schedule)) The number of rank 1 slots available on the weapon
slotsRank2 | Integer | ([_deprecated_](#deprecation-schedule)) The number of rank 2 slots available on the weapon
slotsRank3 | Integer | ([_deprecated_](#deprecation-schedule)) The number of rank 3 slots available on the weapon

### Ammo Capacities
Light and heavy bowguns use the `attributes.ammoCapacities` field to specify ammo capacities for their various ammo types. In the `ammoCapacities` object, the key is the name of the ammo type, and the value is an array of capacities for each level of the ammo type.

Ammo Name | Levels |   | Ammo Name | Levels
--------- | :----: | - | --------- | :----:
normal | 3 | | flaming | 1
piercing | 3 | | water | 1
spread | 3 | | freeze | 1
sticky | 3 | | thunder | 1
cluster | 3 | | dragon | 1
recover | 2 | | slicing | 1
poison | 2 | | wyvern | 1
paralysis | 2 | | demon | 1
sleep | 2 | | armor | 1
exhaust | 2 | | tranq | 1

### Boost Types
An insect glaive's boost type may be one of the following values.

- Sever Boost
- Speed Bost
- Element Boost
- Health Boost
- Stamina Boost
- Blunt Boost

### Bow Coatings
A bow's coating may be one of the following values.

- Close Range
- Paralysis
- Poison
- Sleep
- Blast
- Power

### Bowgun Deviation
A bowgun's deviation may be one of the following values.

- None
- Low
- Average
- High

### Damage Types
A weapon's damage type will be one of the following values:

- blunt
- piercing
- slashing

### Elderseal Types
A weapon's elderseal type may be one of the following values:

- low
- average
- high

### Phial Types
A phial type is represented in one of two forms. The first of which is a simple form, which may be one of the following values.

- Impact Phial
- Element Phial
- Power Phial

The second is a dynamic form, for phial types that also include a strength. Such phial types may be one of the following values, followed by a number that indicates their strength (e.g. "Dragon Phial 300").

- Dragon Phial
- Exhaust Phial
- Para Phial
- Poison Phial

### Shelling Types
A gunlance's shelling type may be one of the following values, followed by a level indicator in the form "Lv#" (e.g. "Normal Lv2").

- Normal
- Long
- Wide

### Special Ammo Types
A light or heavy bowgun's special ammo type may be one of the following values.

- Wyvernblast
- Wyvernheart
- Wyvernsnipe

# Shared Types
Some types are shared between most or all of the objects in the API. Such types are documented below.

## CraftingCost Objects
```json
{
  "quantity": 1,
  "item": {
    "id": 231,
    "name": "Pukei-Pukei Sac",
    "description": "Pukei-Pukei material. Obtained ...",
    "rarity": 0,
    "carryLimit": 0,
    "sellPrice": 0,
    "buyPrice": 0
  }
}
```

> A sample `CraftingCost` object. Some fields have been truncated for brevity.

Field | Type | Description
----- | ---- | -----------
quantity | Integer | The quantity of the item needed for the craft
item | [Item](#item-objects) | The item to be consumed during crafting

## Element Types
An element type may be one of the following values.

| | | |
|-|-|-|
fire | water | ice
thunder | dragon | blast
poison | sleep | paralysis

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