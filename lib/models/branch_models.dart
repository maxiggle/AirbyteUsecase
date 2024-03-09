import 'dart:convert';

class Branch {
  final String name;
  final bool isProtected;
  final String commitSha;
  final String commitUrl;
  final String repository;
  final bool isProtectionEnabled;

  Branch({
    required this.name,
    required this.isProtected,
    required this.commitSha,
    required this.commitUrl,
    required this.repository,
    required this.isProtectionEnabled,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      name: json['name'] ?? '',
      isProtected: json['protected'] ?? false,
      commitSha: json['commit']['sha'] ?? '',
      commitUrl: json['commit']['url'] ?? '',
      repository: json['repository'] ?? '',
      isProtectionEnabled: json['protection']['enabled'] ?? false,
    );
  }
}

class WeekData {
  final int tasksAccomplished;
  final int tasksCreated;
  final int tasksDeleted;
  final int weekStartUnixTimestamp;

  WeekData({
    required this.tasksAccomplished,
    required this.tasksCreated,
    required this.tasksDeleted,
    required this.weekStartUnixTimestamp,
  });

  factory WeekData.fromJson(Map<String, dynamic> json) {
    return WeekData(
      tasksAccomplished: json['a'] ?? 0,
      tasksCreated: json['c'] ?? 0,
      tasksDeleted: json['d'] ?? 0,
      weekStartUnixTimestamp: json['w'] ?? 0,
    );
  }
}

class GithubUserData {
  final String followingUrl;
  final String eventsUrl;
  final String url;
  final String receivedEventsUrl;
  final String repository;
  final String avatarUrl;
  final String roleName;
  final String type;
  final String organizationsUrl;
  final String reposUrl;
  final int id;
  final String subscriptionsUrl;
  final String starredUrl;
  final String gistsUrl;
  final bool siteAdmin;
  final Map<String, bool> permissions;
  final String login;
  final String nodeId;
  final String gravatarId;
  final String followersUrl;
  final String htmlUrl;

  GithubUserData({
    required this.followingUrl,
    required this.eventsUrl,
    required this.url,
    required this.receivedEventsUrl,
    required this.repository,
    required this.avatarUrl,
    required this.roleName,
    required this.type,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.id,
    required this.subscriptionsUrl,
    required this.starredUrl,
    required this.gistsUrl,
    required this.siteAdmin,
    required this.permissions,
    required this.login,
    required this.nodeId,
    required this.gravatarId,
    required this.followersUrl,
    required this.htmlUrl,
  });

  factory GithubUserData.fromJson(Map<String, dynamic> json) {
    return GithubUserData(
      followingUrl: json['following_url'],
      eventsUrl: json['events_url'],
      url: json['url'],
      receivedEventsUrl: json['received_events_url'],
      repository: json['repository'],
      avatarUrl: json['avatar_url'],
      roleName: json['role_name'],
      type: json['type'],
      organizationsUrl: json['organizations_url'],
      reposUrl: json['repos_url'],
      id: json['id'],
      subscriptionsUrl: json['subscriptions_url'],
      starredUrl: json['starred_url'],
      gistsUrl: json['gists_url'],
      siteAdmin: json['site_admin'],
      permissions: Map<String, bool>.from(json['permissions']),
      login: json['login'],
      nodeId: json['node_id'],
      gravatarId: json['gravatar_id'],
      followersUrl: json['followers_url'],
      htmlUrl: json['html_url'],
    );
  }
}

class Commit {
  final Committer author;
  final Committer committer;
  final Tree tree;
  final String message;
  final int commentCount;
  final Verification verification;
  final String url;

  Commit({
    required this.author,
    required this.committer,
    required this.tree,
    required this.message,
    required this.commentCount,
    required this.verification,
    required this.url,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      author: Committer.fromJson(json['author']),
      committer: Committer.fromJson(json['committer']),
      tree: Tree.fromJson(json['tree']),
      message: json['message'],
      commentCount: json['comment_count'],
      verification: Verification.fromJson(json['verification']),
      url: json['url'],
    );
  }
}

class Committer {
  final String date;
  final String email;
  final String name;

  Committer({
    required this.date,
    required this.email,
    required this.name,
  });

  factory Committer.fromJson(Map<String, dynamic> json) {
    return Committer(
      date: json['date'],
      email: json['email'],
      name: json['name'],
    );
  }
}

class Tree {
  final String sha;
  final String url;

  Tree({
    required this.sha,
    required this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) {
    return Tree(
      sha: json['sha'],
      url: json['url'],
    );
  }
}

class Verification {
  final String payload;
  final String signature;
  final String reason;
  final bool verified;

  Verification({
    required this.payload,
    required this.signature,
    required this.reason,
    required this.verified,
  });

  factory Verification.fromJson(Map<String, dynamic> json) {
    return Verification(
      payload: json['payload'] ?? '',
      signature: json['signature'] ?? '',
      reason: json['reason'] ?? '',
      verified: json['verified'] ?? false,
    );
  }
}

class Author {
  final int id;
  final String organizationsUrl;
  final String receivedEventsUrl;
  final String followingUrl;
  final String avatarUrl;
  final String login;
  final String subscriptionsUrl;
  final String nodeId;
  final String type;
  final String reposUrl;
  final String url;
  final String htmlUrl;
  final String eventsUrl;
  final bool siteAdmin;
  final String starredUrl;
  final String gistsUrl;
  final String gravatarId;
  final String followersUrl;

  Author({
    required this.id,
    required this.organizationsUrl,
    required this.receivedEventsUrl,
    required this.followingUrl,
    required this.avatarUrl,
    required this.login,
    required this.subscriptionsUrl,
    required this.nodeId,
    required this.type,
    required this.reposUrl,
    required this.url,
    required this.htmlUrl,
    required this.eventsUrl,
    required this.siteAdmin,
    required this.starredUrl,
    required this.gistsUrl,
    required this.gravatarId,
    required this.followersUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      organizationsUrl: json['organizations_url'],
      receivedEventsUrl: json['received_events_url'],
      followingUrl: json['following_url'],
      avatarUrl: json['avatar_url'],
      login: json['login'],
      subscriptionsUrl: json['subscriptions_url'],
      nodeId: json['node_id'],
      type: json['type'],
      reposUrl: json['repos_url'],
      url: json['url'],
      htmlUrl: json['html_url'],
      eventsUrl: json['events_url'],
      siteAdmin: json['site_admin'],
      starredUrl: json['starred_url'],
      gistsUrl: json['gists_url'],
      gravatarId: json['gravatar_id'],
      followersUrl: json['followers_url'],
    );
  }
}

// To parse this JSON data, do
//
//     final contributorFollower = contributorFollowerFromJson(jsonString);

List<ContributorFollower> contributorFollowerFromJson(String str) =>
    List<ContributorFollower>.from(
        json.decode(str).map((x) => ContributorFollower.fromJson(x)));

String contributorFollowerToJson(List<ContributorFollower> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContributorFollower {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  Type type;
  bool siteAdmin;

  ContributorFollower({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory ContributorFollower.fromJson(Map<String, dynamic> json) =>
      ContributorFollower(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: typeValues.map[json["type"]]!,
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": typeValues.reverse[type],
        "site_admin": siteAdmin,
      };
}

enum Type { USER }

final typeValues = EnumValues({"User": Type.USER});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// To parse this JSON data, do
//
//     final contributorFollowings = contributorFollowingsFromJson(jsonString);
List<ContributorFollowings> contributorFollowingsFromJson(String str) =>
    List<ContributorFollowings>.from(
        json.decode(str).map((x) => ContributorFollowings.fromJson(x)));

String contributorFollowingsToJson(List<ContributorFollowings> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContributorFollowings {
  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  ContributorFollowings({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory ContributorFollowings.fromJson(Map<String, dynamic> json) =>
      ContributorFollowings(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
      };
}
