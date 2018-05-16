# Projecting Results
```shell
curl -G "https://mhw-db.com/weapons" \
    -d 'p={"id":true, "name": true, "type": true, "crafting.branches": true}'
```

```javascript
const url = new URL('https://mhw-db.com/weapons');
url.searchParams.set('p', JSON.stringify({
    id: true,
    name: true,
    type: true,
    'crafting.branches': true,
}));

fetch(uri)
    .then(response => response.json())
    .then(weapons => {
        // your code here
    });
```

> The above command returns an array of partial [`Weapon`](#weapon-fields) objects, whose fields are defined by the `p` query parameter.

```json
[
  {
    "id": 1,
    "name": "Buster Sword 1",
    "type": "great-sword",
    "crafting": {
      "branches": [
        2
      ]
    }
  }
]
```

You can specify which fields the API should return, called "projecting", by providing the `p` query parameter.

The value of `p` should be a JSON object, where the key is the field path to project, and the value is a boolean indicating whether or not the field should be either `true` if the field should be included, or `false` if it should be excluded. Please note that you cannot mix inclusions and exclusions in a single projection.

Field paths should be the dot-notation identifier of a field. For example, weapons have a `crafting` field, which in turn contains a `craftingMaterials` field, which contains a `quantity` field. It's dot-notation form would be `crafting.craftingMaterials.quantity`. When projecting fields, any unrecognized field name will be silently ignored.