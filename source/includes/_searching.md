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
  "crafting.branches": {
    "$size": {
      "$gte": 1
    }
  }
}
```

> Applied to `/weapons`, returns any weapon that has at least one item it can be upgraded into.

```json
{
  "crafting.branches": {
    "$size": 0
  }
}
```

> Applied to `/weapons`, returns any weapon that can't be upgraded any further (i.e. is the final weapon in it's tree).

Any field whose values is an array of related objects (such as `Armor.skills` or `Charm.ranks`) can be filtered by it's length by using the `$size`operator on the field. This will work for ANY array of objects in the API, and supports filtering using more complicated operators, such as `$in` or `$gte`.

For examples, please see the example query documents to the right.

## Operators
```json
{
  "name": {
    "$like": "Negal%"
  },
  "rank": {
    "$in": ["high", "g"]
  }
}
```

An operator starts with a dollar sign, and allows you to perform more than just equality checks on data.

You can find a full list of supported operators in [this GitHub repository](https://github.com/LartTyler/doctrine-query-document#built-in-operators).