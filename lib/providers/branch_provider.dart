import 'dart:convert';
import 'dart:developer';

import 'package:airbyteconnect/models/branch_models.dart';
import 'package:airbyteconnect/services/firebase_repository/repository.dart';
import 'package:flutter/material.dart';

class BranchProvider extends ChangeNotifier {
  final DataBaseRepository _db = DataBaseRepository();

  List<Branch>? _branches;
  List<Branch>? get currentBranch => _branches;
  void fetchBranches() async {
    final result = await _db.getBranches();
    _branches?.add(result);
    notifyListeners();
  }

  List<GithubUserData>? _collaborators = [];
  List<GithubUserData>? get getCollaborators => _collaborators;
  void fetchCollaborators() async {
    final result = await _db.getCollaborators();
    log(result[1].htmlUrl);
    _collaborators?.addAll(result);
    notifyListeners();
  }

  List<Commit>? _commits = [];
  List<Commit>? get getCommits => _commits;
  void fetchCommits() async {
    final result = await _db.getCommits();
    log(result.map((e) => e.author.name).toList().toString());
    _commits?.addAll(result);
    notifyListeners();
  }

  List<WeekData> _weekData = [];
  List<WeekData> get weekData => _weekData;
  void fetchContributorActivity() async {
    final result = await _db.getContributorsActivity();
    _weekData.addAll(result);
    notifyListeners();
  }

  List<ContributorFollower>? _followers = [];
  List<ContributorFollower>? get getFollowers => _followers;
  void getPeterFollowers(String name) async {
    final resp = await _db.getFollowers(name);
    if (resp.statusCode == 200) {
      List<dynamic> json = jsonDecode(resp.body);
      _followers?.addAll(json.map((e) => ContributorFollower.fromJson(e)));
      log(_followers.toString());
      notifyListeners();
    }
  }

  List<ContributorFollower>? _maxFollowers = [];
  List<ContributorFollower>? get getMaxFollowers => _maxFollowers;
  void fetchMaxFollowers(String name) async {
    final resp = await _db.getFollowers(name);
    if (resp.statusCode == 200) {
      List<dynamic> json = jsonDecode(resp.body);
      _maxFollowers?.addAll(json.map((e) => ContributorFollower.fromJson(e)));
      log(_followers.toString());
      notifyListeners();
    }
  }

  List<ContributorFollowings>? _maxFollowings = [];
  List<ContributorFollowings>? get getMaxFollowings => _maxFollowings;
  void fetchMaxFollowings(String name) async {
    final resp = await _db.getFollowings(name);
    if (resp.statusCode == 200) {
      List<dynamic> json = jsonDecode(resp.body);
      _maxFollowings
          ?.addAll(json.map((e) => ContributorFollowings.fromJson(e)));
      log(_followings.toString());
      log(getFollowings!.length.toString());
      notifyListeners();
    }
  }

  List<ContributorFollowings>? _followings = [];
  List<ContributorFollowings>? get getFollowings => _followings;
  void getPeterFollowings(String name) async {
    final resp = await _db.getFollowings(name);
    if (resp.statusCode == 200) {
      List<dynamic> json = jsonDecode(resp.body);
      _followings?.addAll(json.map((e) => ContributorFollowings.fromJson(e)));
      log(_followings.toString());
      log(getFollowings!.length.toString());
      notifyListeners();
    }
  }
}
