twitter.controller "TweetsController", ($scope, $http, $location, $state, $stateParams, Tweet) ->

  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.tweets = {}
  $scope.tweet = {}

  # =========================================================================
  # Show
  # =========================================================================

  if $state.current.name == 'tweets'
    Tweet.query(
      {}

      # Success
    , (response) ->
      $scope.tweets = response

      # Error
    , (response) ->
    )

  if $state.current.name == 'show'
    Tweet.get
      tweetId: $stateParams['tweetId']

      # Success
    , (response) ->
      $scope.tweet = response

      # Error
    , (response) ->


  # =========================================================================
  # Create
  # =========================================================================

  $scope.create = ->
    Tweet.save(
      {}
    , tweet:
        tweetText: $scope.tweet.tweetText
        tweetId: $scope.tweet.tweetId
        username: "$scope.current_user"

      #success
    , (response) ->
      $location.path "/tweets"

      #Error
      (response) ->
    )

  # =========================================================================
  # Update
  # =========================================================================

  if $state.current.name == 'edit'
    Tweet.get
      tweetId: $stateParams['tweetId']

      # Success
    , (response) ->
      $scope.tweet = response

      # Error
    , (response) ->

  $scope.update = ->
    Tweet.update
      tweetId: $stateParams['tweetId']
    , tweet:
#        tweetId: $scope.tweet.tweetId
        tweetText: $scope.tweet.tweetText
        username: $scope.tweet.username

      # Success
    , (response) ->
      $location.path "/tweets"

      # Error
    , (response) ->

  # =========================================================================
  # Destroy
  # =========================================================================

  $scope.destroy = (tweetId) ->
    Tweet.delete
      tweetId: tweetId

      # Success
    , (response) ->
      i = 0
      while i < $scope.tweets.length
        if $scope.tweets[i]['tweetId'] is tweetId
          $scope.tweets.splice(i,1)
        i++

      # Error
    , (response) ->
