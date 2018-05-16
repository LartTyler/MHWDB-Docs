# Motion Values
## Get All Motion Values
```shell
curl "https://mhw-db.com/motion-values"
```

```javascript
fetch('https://mhw-db.com/motion-values')
    .then(response => response.json())
    .then(motionValues => {
        // your code here
    });
```

> The above command returns an array of [`MotionValue`](#motionvalue-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 1,
    "name": "Charged Slash Lv1",
    "weaponType": "great-sword",
    "damageType": "sever",
    "stun": null,
    "exhaust": null,
    "values": [...]
  }
]
```

This endpoint retrieves all motion values in the game.

### HTTP Request
`GET https://mhw-db.com/motion-values`

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of motion values. For field information, see the [MotionValue Fields](#motionvalue-fields) section.

## Get a Specific Motion Value
```shell
curl "https://mhw-db.com/motion-values/1"
```

```javascript
fetch('https://mhw-db.com/motion-values/1')
    .then(response => response.json())
    .then(motionValue => {
        // your code here
    });
```

> The above command returns a single [`MotionValue`](#motionvalue-fields) object. Some fields have been truncated for brevity.

```json
{
  "id": 1,
  "name": "Charged Slash Lv1",
  "weaponType": "great-sword",
  "damageType": "sever",
  "stun": null,
  "exhaust": null,
  "values": [...]
}
```

This endpoint retrieves a motion value by it's ID.

### HTTP Request
`GET https://mhw-db.com/motion-values/<id>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
id | Integer | The ID of the motion value to retrieve

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section

### Response
This endpoint returns a single motion value. For field information, see the [MotionValue Fields](#motionvalue-fields) section.

## Get Motion Values By Weapon
```shell
curl "https://mhw-db.com/motion-values/great-sword"
```

```javascript
fetch('https://mhw-db.com/motion-values/great-sword')
    .then(response => response.json())
    .then(motionValues => {
        // your code here
    });
```

> The above command returns an array of [`MotionValue`](#motionvalue-fields) objects. Some fields have been truncated for brevity.

```json
[
  {
    "id": 30,
    "name": "Charged Rising Slash Lv1",
    "weaponType": "great-sword",
    "damageType": "sever",
    "stun": null,
    "exhaust": null,
    "values": []
  }
]
```

This endpoint retrieves an array of motion values that belong to the specified weapon type.

### HTTP Request
`GET https://mhw-db.com/motion-values/<weaponType>`

### Path Parameters
Parameter | Type | Description
--------- | ---- | -----------
weaponType | [WeaponType](#weapon-types) | The weapon type to retrieve motion values for

### Query Parameters
Parameter | Required | Description
--------- | -------- | -----------
p | No | See the [Projecting Results](#projecting-results) section
q | No | See the [Searching the API](#searching-the-api) section

### Response
This endpoint returns an array of motion values. For field information, see the [MotionValue Fields](#motionvalue-fields) section.

## MotionValue Fields
```json
{
  "id": 119,
  "name": "Charged Big Bang",
  "weaponType": "hammer",
  "damageType": "blunt",
  "stun": null,
  "exhaust": 40,
  "hits": [
    15,
    76
  ]
}
```

> A sample `MotionValue` object.

Field | Type | Description
----- | ---- | -----------
id | Integer | The ID of the motion value
name | String | The name of the motion value
weaponType | [WeaponType](#weapon-types) | The weapon type that the motion value belongs to
damageType | [DamageType](#damage-types) | The type of damage that the motion value does
stun | Integer &#124; Null | The potency of the motion value's stun damage
exhaust | Integer &#124; Null | The potency of the motion value's exhaust damage
hits | Array&lt;Integer&gt; | An array of hits caused by the motion value; each hit is represented as a whole number precentage of the raw damage applied by the hit