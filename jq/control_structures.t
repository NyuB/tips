jq supports usual fp control structures
if <condition> then <iftrue> else <iffalse> end
  $ IF_KEY_A_OK_ELSE_KO='if .key == "A" then "ok" else "ko" end'
  $ echo '{"key": "A", "value": 1}' | jq "${IF_KEY_A_OK_ELSE_KO}"
  "ok"
  $ echo '{"key": "B", "value": 1}' | jq "${IF_KEY_A_OK_ELSE_KO}"
  "ko"
try <expression> catch <fallback>
  $ DIVIDE_BY_NESTED='2 / .very.nested.object'
  $ OOPS_JSON='{"very": {"oops": {"object": 2}}}'
  $ echo ${OOPS_JSON} | jq "${DIVIDE_BY_NESTED}"
  jq: error (at <stdin>:1): number (2) and null (null) cannot be divided
  [5]
  $ echo ${OOPS_JSON} | jq "try (${DIVIDE_BY_NESTED}) catch 0"
  0

Note that an 'if <expr> == null then <expr> else <default> end' construct can be shortened with the alternative operator '//'
  $ NAME_OR_DEFAULT='.name // "John Smith"'
  $ echo '{ "name": "Alice" }' | jq "${NAME_OR_DEFAULT}"
  "Alice"
  $ echo '{ "name": null }' | jq "${NAME_OR_DEFAULT}"
  "John Smith"
  $ echo '{ }' | jq "${NAME_OR_DEFAULT}"
  "John Smith"
