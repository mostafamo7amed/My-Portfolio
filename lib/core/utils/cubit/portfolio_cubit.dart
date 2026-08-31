import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../data/my_data.dart';
import '../../models/experience_model.dart';
import '../../models/project_model.dart';
import '../../models/review_model.dart';
import '../../services/firestore_service.dart';

abstract class PortfolioDataState {
  final List<ExperienceModel> experiences;
  final List<ProjectModel> projects;
  final List<ReviewModel> reviews;
  final String cvLink;

  PortfolioDataState({
    required this.experiences,
    required this.projects,
    required this.reviews,
    required this.cvLink,
  });
}

class PortfolioDataLoaded extends PortfolioDataState {
  PortfolioDataLoaded({
    required super.experiences,
    required super.projects,
    required super.reviews,
    required super.cvLink,
  });
}

class PortfolioCubit extends Cubit<PortfolioDataState> {
  final FirestoreService _firestoreService;
  StreamSubscription<List<ExperienceModel>>? _expSub;
  StreamSubscription<List<ProjectModel>>? _projSub;
  StreamSubscription<List<ReviewModel>>? _revSub;
  StreamSubscription<String>? _cvSub;

  PortfolioCubit(this._firestoreService)
      : super(PortfolioDataLoaded(
          experiences: experiences,
          projects: projects,
          reviews: reviews,
          cvLink: myData.cvLink,
        )) {
    init();
  }

  void init() {
    _firestoreService.seedInitialDataIfNeeded();

    _expSub = _firestoreService.getExperiencesStream().listen((exps) {
      if (exps.isNotEmpty) {
        emit(PortfolioDataLoaded(
          experiences: exps,
          projects: state.projects,
          reviews: state.reviews,
          cvLink: state.cvLink,
        ));
      }
    });

    _projSub = _firestoreService.getProjectsStream().listen((projs) {
      if (projs.isNotEmpty) {
        emit(PortfolioDataLoaded(
          experiences: state.experiences,
          projects: projs,
          reviews: state.reviews,
          cvLink: state.cvLink,
        ));
      }
    });

    _revSub = _firestoreService.getReviewsStream().listen((revs) {
      if (revs.isNotEmpty) {
        emit(PortfolioDataLoaded(
          experiences: state.experiences,
          projects: state.projects,
          reviews: revs,
          cvLink: state.cvLink,
        ));
      }
    });

    _cvSub = _firestoreService.getCvLinkStream().listen((link) {
      if (link.isNotEmpty) {
        emit(PortfolioDataLoaded(
          experiences: state.experiences,
          projects: state.projects,
          reviews: state.reviews,
          cvLink: link,
        ));
      }
    });
  }

  Future<void> submitUserReview({
    required String name,
    required String role,
    required String company,
    required String comment,
    required double rating,
  }) async {
    final newReview = ReviewModel(
      name: name,
      role: role,
      company: company,
      comment: comment,
      rating: rating,
      date: 'Just now',
      order: 0,
    );

    final updated = [newReview, ...state.reviews];
    emit(PortfolioDataLoaded(
      experiences: state.experiences,
      projects: state.projects,
      reviews: updated,
      cvLink: state.cvLink,
    ));

    await _firestoreService.addReview(newReview);
  }

  @override
  Future<void> close() {
    _expSub?.cancel();
    _projSub?.cancel();
    _revSub?.cancel();
    _cvSub?.cancel();
    return super.close();
  }
}
