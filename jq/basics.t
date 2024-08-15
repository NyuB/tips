Setup
  $ cp -r ${TESTDIR}/resources resources
jq is a tool to process json data
  $ cat resources/sample.json
  {
      "int_key": 42,
      "string_key": "Bob",
      "boolean_key": true,
      "int_array_key": [
          1,2,3,4
      ],
      "object_key": {
          "a": "b"
      },
      "object_array_key": [
          { "name": "Bob", "age": 24 },
          { "name": "Alice", "age": 53 },
          { "name": "Eleanor", "age": 36 }
      ]
  }

Data is refered by json path, '.' being the current object
A jq expression is a pipeline of path selection and function, the last block ofthe pipelinebeing the program output
The simplest usage of jq is therefore to return the input json object, acting as a json formatter
  $ cat resources/sample.json | jq '.'
  {
    "int_key": 42,
    "string_key": "Bob",
    "boolean_key": true,
    "int_array_key": [
      1,
      2,
      3,
      4
    ],
    "object_key": {
      "a": "b"
    },
    "object_array_key": [
      {
        "name": "Bob",
        "age": 24
      },
      {
        "name": "Alice",
        "age": 53
      },
      {
        "name": "Eleanor",
        "age": 36
      }
    ]
  }

We can select specific paths:
  $ cat resources/sample.json | jq '.int_key'
  42
  $ cat resources/sample.json | jq '.object_key.a'
  "b"
A non existing path element yields null
  $ cat resources/sample.json | jq '.oops'
  null
Instead of writing a full path we can chain selection with the pipeline operator '|'
  $ cat resources/sample.json | jq '.object_key | .a'
  "b"
Array access is done with [] indexing operator (note that arrays are 0-indexed)
  $ cat resources/sample.json | jq '.int_array_key[2]'
  3

Along with path, we can also use functions to transform the data (actually, path can be seen as basic access functions)
  $ cat resources/sample.json | jq '.string_key | ascii_upcase'
  "BOB"
  $ cat resources/sample.json | jq '.string_key | ascii_downcase'
  "bob"
Jq supports higher level functions, i.e. functions taking other functions as arguments
Usual fp functions such as sort_by or map are available
  $ cat resources/sample.json | jq '.object_array_key | map(.name)'
  [
    "Bob",
    "Alice",
    "Eleanor"
  ]
  $ cat resources/sample.json | jq '.object_array_key | sort_by(.name)'
  [
    {
      "name": "Alice",
      "age": 53
    },
    {
      "name": "Bob",
      "age": 24
    },
    {
      "name": "Eleanor",
      "age": 36
    }
  ]
