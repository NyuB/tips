jq can convert any object to and from an array of key/value pairs
  $ echo '{"dish": "omelette", "ingredients": [{"name": "egg", "quantity": 4}]}' | jq 'to_entries'
  [
    {
      "key": "dish",
      "value": "omelette"
    },
    {
      "key": "ingredients",
      "value": [
        {
          "name": "egg",
          "quantity": 4
        }
      ]
    }
  ]
  $ echo '[{"key": "A", "value": 2}, {"key": "B", "value": 1}]' | jq 'from_entries'
  {
    "A": 2,
    "B": 1
  }
Error if missing "key" 
  $ echo '[{"oops": "A", "value": 1}]' | jq 'from_entries'
  jq: error (at <stdin>:1): Cannot use null (null) as object key
  [5]
null if missing "value"
  $ echo '[{"key": "A", "oops": 1}]' | jq 'from_entries'
  {
    "A": null
  }
