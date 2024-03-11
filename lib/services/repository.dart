import 'dart:convert';
import 'package:airbyteconnect/const.dart';
import 'package:airbyteconnect/models/branch_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

abstract class _Repository {
  Future<void> getBranches();
  Future<void> getCommits();
  Future<void> getPullRequests();
  Future<void> getComments();
  Future<void> getContributorsActivity();
  Future<void> getIssues();
  Future<void> getCollaborators();
}

class DataBaseRepository extends _Repository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<String>> getDocumentIds(String id) async {
    final snapshot = await db.collection(id).get();
    final List<String> documentIds =
        snapshot.docs.map((doc) => doc.id).toList();
    return documentIds;
  }

  @override
  Future<Branch> getBranches() async {
    final snapshot = db.collection(kCollectionName2);
    final data = await snapshot.get();
    return Branch.fromJson(data.docs.first.data());
  }

  @override
  Future<List<GithubUserData>> getCollaborators() async {
    final snapshot = db.collection(kCollectionName1);
    final List<String> documentIds = [
      'fo21XQkRV6wJmWYfCp8B',
      'io2Ccg9IGcgA6Usse8UU'
    ];

    final allDocs =
        await snapshot.where(FieldPath.documentId, whereIn: documentIds).get();
    List<GithubUserData> collaborators = [];
    allDocs.docs.forEach((doc) {
      final data = doc.data();
      collaborators.add(GithubUserData.fromJson(data));
    });
    return collaborators;
  }

  @override
  Future<void> getComments() {
    final snapshot = db.collection(kCollectionName6).doc();
    final data = snapshot.get();
    return data;
  }

  @override
  Future<List<Commit>> getCommits() async {
    try {
      final data = await getDocumentIds(kCollectionName3);
      final snapshot = db.collection(kCollectionName3);
      final allDocs =
          await snapshot.where(FieldPath.documentId, whereIn: data).get();
      List<Commit> commits = [];
      allDocs.docs.forEach((doc) {
        final data = doc.data();
        Map<String, dynamic>? decoded = jsonDecode(jsonEncode(data));
        if (decoded != null && decoded.containsKey('commit')) {
          commits.add(Commit.fromJson(decoded['commit']));
        }
      });
      return commits;
    } catch (e, stackTrace) {
      print('Error fetching commits: $e\n$stackTrace');
      return [];
    }
  }

  @override
  Future<List<WeekData>> getContributorsActivity() async {
    final snapshot = db.collection(kCollectionName8);
    final data = await snapshot.get();
    List<WeekData> weekData = [];
    final decodedData = data.docs.first.data();
    if (decodedData['weeks'] != null) {
      List<dynamic> weeksJson = decodedData['weeks'];
      weekData = weeksJson.map((week) => WeekData.fromJson(week)).toList();
    }
    return weekData;
  }

  @override
  Future<void> getIssues() {
    final snapshot = db.collection(kCollectionName7).doc();
    final data = snapshot.get();
    return data;
  }

  @override
  Future<void> getPullRequests() async {
    final data = await getDocumentIds(kCollectionName4);
    final snapshot = db.collection(kCollectionName4);
    final allDocs =
        await snapshot.where(FieldPath.documentId, whereIn: data).get();
    // return data;
  }

  //contributor one followers
  Future<http.Response> getFollowers(String name) async {
    final url = Uri.parse('https://api.github.com/users/$name/followers');
    final response = await http.get(url);
    return response;
  }

  Future<http.Response> getFollowings(String name) async {
    final url = Uri.parse('https://api.github.com/users/$name/following');
    final response = await http.get(url);
    return response;
  }
}
