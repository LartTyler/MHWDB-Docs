## Searching
Any endpoint can be searched by passing a `q` URL parameter, i.e. `/skills?q=...`. The value of `q` should be a MongoDB-style
[query document](https://docs.mongodb.com/manual/tutorial/query-documents/). For those that are not familiar with Mongo
query documents, a short explanation can be found below.

## Query Document
A "query document" is simply a JSON object that defines fields and values to search by. For example, a request to
`http://mhw-db.com/skills?q={"name":"Poison%20Resistance"}` would return a collection containing all skills whose name
matched the string "Poison Resistance" exactly.

You can also search fields that are related or nested in an object. A request to `http://mhw-db.com/skills?q={"ranks.level":3}`
would return a collection containing all skills that have a rank of 3. A request to
`http://mhw-db.com/armor?q={"attributes.defense":40}` would return all armor that has exactly 40 defense.

You can enhance your searches by using operators in your document, a list of which [can be found here](#operators). For example,
a request to `http://mhw-db.com/armor?q={"attributes.defense":{"$gt":50}}` would return any armor with a defense that is
greater than 50.

## Operators
Coming soon.
