class APIEndPoints {
  static const String baseUrl = "https://api.github.com";
  static const String search = "/search/repositories";                  //Needed
  static const String user = "/users/";
  static const String userRepos = "/repositories";                      //Needed
  static const String userStarred = "/starred";
  static const String userFollowers = "/followers";
  static const String userFollowing = "/following";
  static const String userGists = "/gists";
  static const String userEvents = "/events";
  static const String userOrgs = "/orgs";
  static const String userRepo = "/repos/";                             //Needed
  static const String userRepoStarred = "/starred";
  static const String userRepoWatching = "/subscriptions";
  static const String userRepoForks = "/forks";
  static const String userRepoCollaborators = "/collaborators";
  static const String userRepoComments = "/comments";
  static const String userRepoCommits = "/commits";
  static const String userRepoCompare = "/compare";
  static const String userRepoReleases = "/releases";
  static const String deps = "/deployments";
  static const String userRepoDepsState = "$deps/state";
  static const String userRepoDepsStateDeploy = "$userRepoDepsState/deploy";
  static const String userRepoDepsStateRollback = "$userRepoDepsState/rollback";
  static const String userRepoDepsStateSuccess = "$userRepoDepsState/success";
  static const String userRepoDepsStateFailure = "$userRepoDepsState/failure";
  static const String userRepoDepsStateActive = "$userRepoDepsState/active";
}
