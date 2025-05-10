message("Hashing file " ${CMAKE_ARGV3})
FILE(SHA1 ${CMAKE_ARGV3} HASH_RESULT)
message(${HASH_RESULT})
