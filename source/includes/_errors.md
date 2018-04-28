# Errors
> Error responses will always look something like this:

```json
{
    "error": {
        "code": "error.code_type",
        "message": "A more verbose, human-readable error message"
    }
}
```

Any response that does not use the 200 range of HTTP status codes will, in almost every case, include a description
of the error that occurred in the response body. Every error response will follow the same format.

Error responses will ALWAYS have, at minimum, an `error` key, which will contain an object. The error object will always
have a `code` key and a `message` key. The `code` key acts like an identifier; it will always be the same for the same
kind of error, and may be used for error handling in your code. The `message` key will be a description of what happened,
and may change slightly. It should be used by you, the developer, to help debug what went wrong.

## Error Codes
Code | Description
---- | -----------
not_found | No object could be found with the ID or slug provided
search.malformed_query | Your query object was invalid; check your syntax and try again
search.empty_params | Your search query must include at least one field to search by
search.error | An unhandled error occurred while executing your search
slug_not_supported | This resource cannot be retrieved using a slug

