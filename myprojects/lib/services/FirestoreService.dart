import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myprojects/DataModels/ChallengesModel.dart';
import 'package:myprojects/DataModels/CommunityChallengModel.dart';
import 'package:myprojects/DataModels/LearningThemesModel.dart';

class FireStoreService {
  final FirebaseFirestore instance = FirebaseFirestore.instance;

  Future<List<LearningThemesModel>> getServices() async {
    List<LearningThemesModel> themes = [];
    QuerySnapshot snapshot = await instance.collection('LearningThemes').get();

    for (var item in snapshot.docs) {
      var temp = item.data();
      themes.add(LearningThemesModel(temp['Image'], temp['LongDescription'],
          temp['ShortDescription'], temp['Tags'], temp['Theme'], item.id));
    }

    return themes;
  }

  Future<List<ChallengesModel>> getChallenges(String themeID) async {
    List<ChallengesModel> challenges = [];
    QuerySnapshot snapshot = await instance
        .collection('LearningThemes')
        .doc(themeID)
        .collection('Challenges')
        .get();

    for (var item in snapshot.docs) {
      var temp = item.data();
      challenges.add(ChallengesModel(temp['ChallengeTitel'],
          temp['ChallengeDescription'], temp['ID'], item.id));
    }
    challenges.sort((a, b) => a.iD.compareTo(b.iD));

    
    return challenges;
  }

  Future<List<CommunityChallengeModel>> getCommunityChallenges() async {
    List<CommunityChallengeModel> challenges = [];
    QuerySnapshot snapshot = await instance
        .collection('Community-Challenges')
        .get();

    for (var item in snapshot.docs) {
      var temp = item.data();
      challenges.add(CommunityChallengeModel(temp['ChallengeTitel'],
          temp['ChallengeDescription'], item.id, temp['Link']));
    }

    
    return challenges;
  }
}
