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
      id: $stateParams['id']

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
        username: $scope.tweet.username

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
      id: $stateParams['id']

      # Success
    , (response) ->
      $scope.tweet = response

      # Error
    , (response) ->

  $scope.update = ->
    Tweet.update
      id: $stateParams['id']
    , tweet:
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

  $scope.destroy = (id) ->
    Tweet.delete
      id: id

      # Success
    , (response) ->
      i = 0
      while i < $scope.tweets.length
        if $scope.tweets[i]['id'] is id
          $scope.tweets.splice(i,1)
        i++

      # Error
    , (response) ->
