app.controller "TweetsController", ($scope, $http, $location, $state, $stateParams) ->

  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.tweets = {}
  if $state.current.name == 'tweets'
    $http.get("/api/tweets"

      # success
    ).then ((response) ->
      $scope.tweets = response.data

      # failure
    ), (error) ->

  $scope.tweet = {}
  if $state.current.name == 'edit'
    $http.get("/api/tweet/#{$stateParams['user_id']}"

      # success
    ).then ((response) ->
      $scope.task = response.data

      # failure
    ), (error) ->

  # =========================================================================
  # Create
  # =========================================================================

  $scope.create = ->
    $http.post("/api/tweets",
      tweet:
        username: $scope.tweet.username
        tweet: $scope.tweet.tweet

      # success
    ).then ((response) ->
      $location.path "/tweets"

      # failure
    ), (error) ->

  # =========================================================================
  # Update
  # =========================================================================

  $scope.update = ->
    $http.put("/api/tweets/#{$scope.tweet.user_id}",
      tweet:
        username: $scope.tweet.username
        tweet: $scope.tweet.tweet

      # success
    ).then ((response) ->
      $location.path "/tweets"

      # failure
    ), (error) ->

  # =========================================================================
  # Destroy
  # =========================================================================

  $scope.destroy = (user_id) ->
    $http.delete("/api/tweets/#{user_id}"

      # success
    ).then ((response) ->
      $http.get("/api/tweets").then ((response) ->
        $scope.tweets = response.data
      ), (error) ->

        # failure
    ), (error) ->

  return false
