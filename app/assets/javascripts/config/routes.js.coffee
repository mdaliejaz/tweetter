# Configure 'twitter' routing. The $stateProvider and $urlRouterProvider
# will be automatically injected into the configurator.
twitter.config ($stateProvider, $urlRouterProvider) ->

  # Make sure that any other request beside one that is already defined
  # in stateProvider will be redirected to root.
  $urlRouterProvider
    .otherwise("/")

  # Define 'twitter' states
  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "/assets/layouts/default.html.erb"

    # Tweets
    .state "tweets",
      parent: "default"
      url: "/tweets"
      views:
        "":
          controller: "TweetsController"
          templateUrl: "/assets/tweets/index.html.erb"

    .state "new",
      parent: "tweets"
      url: "/new"
      views:
        "@default":
          controller: "TweetsController"
          templateUrl: "/assets/tweets/new.html.erb"

    .state "edit",
      parent: "tweets"
      url: "/:tweetId/edit"
      views:
        "@default":
          controller: "TweetsController"
          templateUrl: "/assets/tweets/edit.html.erb"