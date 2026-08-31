import 'package:cloud_firestore/cloud_firestore.dart';
import '../data/my_data.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/review_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String experiencesCollection = 'experiences';
  static const String projectsCollection = 'projects';
  static const String reviewsCollection = 'reviews';
  static const String settingsCollection = 'settings';
  static const String profileDocId = 'profile';

  /// Stream of experiences ordered by 'order' ascending
  Stream<List<ExperienceModel>> getExperiencesStream() {
    return _firestore
        .collection(experiencesCollection)
        .orderBy('order')
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return experiences;
      }

      final seen = <String>{};
      final uniqueList = <ExperienceModel>[];

      for (final doc in snapshot.docs) {
        final exp = ExperienceModel.fromMap(doc.data(), doc.id);
        final key =
            '${exp.title.trim().toLowerCase()}_${exp.company.trim().toLowerCase()}';
        if (key.isNotEmpty && seen.add(key)) {
          uniqueList.add(exp);
        }
      }

      return uniqueList.isNotEmpty ? uniqueList : experiences;
    }).handleError((_) {
      return experiences;
    });
  }

  /// Stream of projects ordered by 'order' ascending
  Stream<List<ProjectModel>> getProjectsStream() {
    return _firestore
        .collection(projectsCollection)
        .orderBy('order')
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return projects;
      }

      final seen = <String>{};
      final uniqueList = <ProjectModel>[];

      for (final doc in snapshot.docs) {
        final proj = ProjectModel.fromMap(doc.data(), doc.id);
        final key = proj.title.trim().toLowerCase();
        if (key.isNotEmpty && seen.add(key)) {
          uniqueList.add(proj);
        }
      }

      return uniqueList.isNotEmpty ? uniqueList : projects;
    }).handleError((_) {
      return projects;
    });
  }

  /// Stream of reviews ordered by 'order' ascending
  Stream<List<ReviewModel>> getReviewsStream() {
    return _firestore
        .collection(reviewsCollection)
        .orderBy('order')
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return reviews;
      }

      final uniqueList = <ReviewModel>[];
      for (final doc in snapshot.docs) {
        uniqueList.add(ReviewModel.fromMap(doc.data(), doc.id));
      }

      return uniqueList.isNotEmpty ? uniqueList : reviews;
    }).handleError((_) {
      return reviews;
    });
  }

  /// Stream of CV link / profile settings from Firestore
  Stream<String> getCvLinkStream() {
    return _firestore
        .collection(settingsCollection)
        .doc(profileDocId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        final link = snapshot.data()!['cvLink'] as String?;
        if (link != null && link.isNotEmpty) {
          return link;
        }
      }
      return myData.cvLink;
    }).handleError((_) {
      return myData.cvLink;
    });
  }

  /// Submit a new user review directly to Firestore
  Future<void> addReview(ReviewModel review) async {
    try {
      final docRef = _firestore.collection(reviewsCollection).doc();
      await docRef.set(review.toMap());
    } catch (e) {
      rethrow;
    }
  }

  /// Update CV link in Firestore
  Future<void> updateCvLink(String newCvLink) async {
    await _firestore
        .collection(settingsCollection)
        .doc(profileDocId)
        .set({'cvLink': newCvLink}, SetOptions(merge: true));
  }

  /// Syncs the latest code dataset in `my_data.dart` directly to Firestore collections
  Future<void> seedInitialDataIfNeeded() async {
    try {
      // 1. Sync Experiences
      final expSnapshot =
          await _firestore.collection(experiencesCollection).get();
      final expBatch = _firestore.batch();

      for (final doc in expSnapshot.docs) {
        expBatch.delete(doc.reference);
      }

      for (int i = 0; i < experiences.length; i++) {
        final docRef =
            _firestore.collection(experiencesCollection).doc('exp_$i');
        expBatch.set(docRef, experiences[i].toMap());
      }
      await expBatch.commit();

      // 2. Sync Projects
      final projSnapshot =
          await _firestore.collection(projectsCollection).get();
      final projBatch = _firestore.batch();

      for (final doc in projSnapshot.docs) {
        projBatch.delete(doc.reference);
      }

      for (int i = 0; i < projects.length; i++) {
        final docRef =
            _firestore.collection(projectsCollection).doc('proj_$i');
        projBatch.set(docRef, projects[i].toMap());
      }
      await projBatch.commit();

      // 3. Sync Reviews (if empty, seed initial high quality reviews)
      final reviewSnapshot =
          await _firestore.collection(reviewsCollection).limit(1).get();
      if (reviewSnapshot.docs.isEmpty) {
        final reviewBatch = _firestore.batch();
        for (int i = 0; i < reviews.length; i++) {
          final docRef =
              _firestore.collection(reviewsCollection).doc('rev_$i');
          reviewBatch.set(docRef, reviews[i].toMap());
        }
        await reviewBatch.commit();
      }

      // 4. Sync Settings / Profile (cvLink)
      final settingsDoc = await _firestore
          .collection(settingsCollection)
          .doc(profileDocId)
          .get();
      if (!settingsDoc.exists ||
          (settingsDoc.data()?['cvLink'] as String? ?? '').isEmpty) {
        await _firestore
            .collection(settingsCollection)
            .doc(profileDocId)
            .set({'cvLink': myData.cvLink}, SetOptions(merge: true));
      }
    } catch (_) {
      // Fallback
    }
  }
}
