# Data Types
## Scalar Data Types
Type | Description
---- | -----------
String | Text of any length
Integer | A normal integer
Percent | A percentage, formatted as a whole number without the trailing percent sign; may be negative
Boolean | A normal boolean (either `true` or `false`)
Enum(...) | One of any value listed between the parenthesis
Array&lt;T&gt; | An array containing zero more values of type `T`
DateTime | An [ISO8601](#https://en.wikipedia.org/wiki/ISO_8601#Combined_date_and_time_representations) string representing a date and time, in UTC
Null | Represents an empty value (usually used when a field has no value)

## Rank Types
A rank type may be one of the following values.

- `low`
- `high`
- `master`

## Element Types
An element type may be one of the following values.

| | | |
|-|-|-|
fire | water | ice
thunder | dragon | blast
poison | sleep | paralysis
stun | |

## Reward Condition Types
A reward condition type may be one of the following values.

- `carve`
- `investigation`
- `mining`
- `palico`
- `plunderblade`
- `reward`
- `siege reward`
- `shiny`
- `track`
- `wound`

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

## RewardCondition Objects
```json
{
  "type": "carve",
  "subtype": "body",
  "rank": "high",
  "quantity": 1,
  "chance": 15
}
```

> A sample `RewardCondition` object.

Field | Type | Description
----- | ---- | -----------
type | [RewardConditionType](#reward-condition-types) | The type identifier of the condition
subtype | String | A text description of the condition's subtype (i.e. "body" or "tail" for the `carve` type)
rank | [Rank](#rank-types) | The mission rank required to obtain the reward
quantity | Integer | The number of items granted if the condition is met
chance | Integer | The percent chance the reward will be granted if the condition is met (whole number between 1 and 100)