# Searching the API
Any endpoint can be searched by passing a `q` parameter in the URL, i.e. `/skills?q=...`. The value of `q` should be a MongoDB-style [query document](https://docs.mongodb.com/manual/tutorial/query-documents/). For those that are not familiar with Mongo query documents, a short explanation can be found below.

## Query Document
A "query document" is simply a JSON object that defines fields and values to search by. For example, a request to <a href='https://mhw-db.com/skills?q={"name":"Poison%20Resistance"}' target="_blank">`/skills?q={"name":"Poison Resistance"}`</a> would return a collection containing all skills whose name matched the string "Poison Resistance" exactly.

You can enhance your searches by using operators in your document, a list of which [can be found here](#operators). For example, a request to <a href='https://mhw-db.com/armor?q={"defense.base":{"$gt":50}}' target="_blank">`/armor?q={"defense.base":{"$gt":50}}`</a> would return any armor with a base defense that is greater than 50.

## Related Objects
```json
{
  "skill.ranks.modifiers.damageIce": {
    "$exists": true
  }
}
```

You can also search fields that are related or nested in an object. A request to <a href='https://mhw-db.com/skills?q={"ranks.level":3}' target="_blank">`/skills?q={"ranks.level":3} `</a> would return a collection containing all skills that have a rank of 3. A request to <a href='https://mhw-db.com/armor?q={"defense.base":40}' target="_blank">`/armor?q={"defense.base":40}`</a> would return all armor that has exactly 40 base defense.

Any field in the API that is an ID of another object or a collection of API objects (for example, the `skill` field on [Decorations](https://github.com/LartTyler/MHWDB-Docs/wiki/Decorations) or the `skills` field on [Charms](https://github.com/LartTyler/MHWDB-Docs/wiki/Charms)) can be searched as if it were an object, as is show in the example to the right.

## Related Object Arrays
```json
{
  "crafting.branches.length": {
    "$gte": 1
  }
}
```

> Applied to `/weapons`, returns any weapon that has at least one item it can be upgraded into.

```json
{
  "crafting.branches.length": 0
}
```

> Applied to `/weapons`, returns any weapon that can't be upgraded any further (i.e. is the final weapon in it's tree).

Any field whose values is an array of related objects (such as `Armor.skills` or `Charm.ranks`) can be filtered by it's length by adding `.length` after the field name in your search. This will work for ANY array of objects in the API, and supports filtering using any operator.

For examples, please see the example query documents to the right.

## Operators
An operator starts with a dollar sign, and allows you to perform more than just equality checks on data.

|Name|Description|
|:---|:---|
[$and](#and)|Joins query clauses with a logical **AND**.|
|[$or](#or)|Joins query clauses with a logical **OR**.|
|[$gt](#gt)|Matches values that are greater than the specified value.|
|[$gte](#gte)|Matches values that are greater than or equal to the specified value.|
|[$lt](#lt)|Matches values that are less than the specified value.|
|[$lte](#lte)|Matches values that are less than or equal to the specified value.|
|[$eq](#eq)|Matches values that are equal to the specified value.|
|[$neq](#neq)|Matches values that are not equal to the specified value.|
|[$in](#in)|Matches values that are equal to any of the values in the specified array.|
|[$nin](#nin)|Matches values that are not equal to any of the values in the specified array.|
|[$like](#like)|Matches values that match the provided comparison string.|
|[$nlike](#nlike)|Matches values that do not match the provided comparison string.|
|[$exists](#exists)|Matches values that match the given existence check.|

### $and
_Syntax_: `{"$and": [{expression1}, {expression2}, ..., {expressionN}]}`

The `$and` joins query clauses with a logical **AND**.

```json
{
  "$and": [
    {
      "rank": "high"
    },
    {
      "attributes.defense": 40
    }
  ]
}
```

The above query, applied to the `/armor` endpoint, would find only armor that has a `rank` equal to "high, and a defense attribute of 40.

By default, consecutive expressions are joined by an `$and` operator, so in most cases it's not necessary to use `$and` to join expressions. The above document could be shortened to the following, and would yield the same results.

```json
{
  "rank": "high",
  "attributes.defense": 40
}
```

### $or
_Syntax_: `{"$or": [{expression1}, {expression2}, ..., {expressionN}]}`

The `$or` joins query clauses with a logical **OR**.

```json
{
  "$or": [
    {
      "rank": "high"
    },
    {
      "attributes.defense": 40
    }
  ]
}
```

The example above would match any entity where `rank = "high" OR attributes.defense = 40`.

### $gt
_Syntax_: `{"field": {"$gt": value}}`

The `$gt` operator matches values that are greater than the specified value.

```json
{
  "attributes.defense": {
    "$gt": 40
  }
}
```

The example above would match any entity where `attributes.defense > 40`.

### $gte
_Syntax_: `{"field": {"$gte": value}}`

The `$gte` operator matches values that are greater than or equal to the specified value.

```json
{
  "attributes.defense": {
    "$gte": 40
  }
}
```

The example above would match any entity where `attributes.defense >= 40`.

### $lt
_Syntax_: `{"field": {"$lt": value}}`

The `$lt` operator changes the field comparison to less than.

```json
{
  "attributes.defense": {
    "$lt": 40
  }
}
```

The example above would match any entity where `attributes.defense < 40`.

### $lte
_Syntax_: `{"field": {"$lte": value}}`

The `$lte` operator matches values that are less than or equal to the specified value.

```json
{
  "attributes.defense": {
    "$lte": 40
  }
}
```

The example above would match any entity where `attributes.defense <= 40`.

### $eq
_Syntax_: `{"field": {"$eq": value}}` _or_ `{"field": value}`

The `$eq` operator matches values that are equal to the specified value.

```json
{
  "attributes.defense": 40
}
```

The example above would match any entity where `attributes.defense = 40`.

### $neq
_Syntax_: `{"field": {"$neq": value}}`

The `$neq` operator is the negated form of [`$eq`](#eq), and matches values that are not equal to the specified value.

```json
{
  "attributes.defense": 40
}
```

The example above would match any entity where `attributes.defense != 40`.

### $in
_Syntax_: `{"field": {"$in": [value1, value2, ..., valueN]}}`

The `$in` operator matches values that are equal to any value in the specified array.

```json
{
  "rank": {
    "$in": [
      "high",
      "g"
    ]
  }
}
```

The example above would match any entity where `rank IN ("high", "g")`.

### $nin
_Syntax_: `{"field": {"$nin": [value1, value2, ..., valueN]}}`

The `$nin` operator is the negated form of [`$in`](#in), and matches any values that are not equal to any value in the specified array.

```json
{
  "rank": {
    "$nin": [
      "low",
      "high"
    ]
  }
}
```

The example above would match any entity where `rank NOT IN ("low", "high")`.

### $like
_Syntax_: `{"field": {"$like": value}}`

The `$like` operator matches any value that matches the specified comparison string.

A comparison string may contain any character allowable in a normal string, but treats the following characters as metacharacters.

|Character|Description|
|:---|:---|
|`%`|Matches anything zero or more times|
|`_`|Matches anything once|

To use either character as their literal character and not a metacharacter, simply prefix them with a backslash, like so: `\%` or `\_`.

```json
{
  "name": {
    "$like": "Nergal%"
  }
}
```

The example above would match any entity where the name field begins with the string "Nergal" (`name LIKE "Nergal%"`).

### $nlike
_Syntax_: `{"field": {"$nlike": value}}`

The `$nlike` operator is the negated form of [`$like`](#like), and matches any value that does not match the specified comparison string. Please see the documentation for [`$like`](#like) for an explanation of comparison strings.

```json
{
  "name": {
    "$nlike": "Nergal%"
  }
}
```

The example above would match any entity where the name field does not begin with "Nergal" (`name NOT LIKE "Nergal%"`).

### $exists
_Syntax_: `{"field": {"$exists": boolean}}`

The `$exists` operator matches subfield existence. When the value of `$exists` is `true`, it will match any entity that has the specified field. When it is false, it will match any entity that does _not_ have the specified field.

```json
{
  "attributes.slotsRank2": {
    "$exists": true
  }
}
```

The example above would match any entity that has the provided field (or, in other words, where `attributes.slotsRank2 IS NOT NULL`).