twitter.factory "Tweet", ($resource, apiPrefix) ->
  $resource( apiPrefix + "/tweets/:tweetId",
    tweetId: "@tweetId"
  ,
    update:
      method: "PUT"
  )