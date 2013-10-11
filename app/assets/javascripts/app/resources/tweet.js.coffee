twitter.factory "Tweet", ($resource, apiPrefix) ->
  $resource( apiPrefix + "/tweets/:id",
    id: "@id"
  ,
    update:
      method: "PUT"
  )