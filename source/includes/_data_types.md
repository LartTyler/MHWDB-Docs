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
Null | Represents an empty value (usually used when a field has no value)

## Element Types
An element type may be one of the following values.

| | | |
|-|-|-|
fire | water | ice
thunder | dragon | blast
poison | sleep | paralysis

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