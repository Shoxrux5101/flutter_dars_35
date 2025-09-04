import 'package:flutter/material.dart';
import 'package:untitled3/data/repository/profile/profile_repository.dart';

import '../../../data/models/profile_model.dart';


class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository profileRepository;

  ProfileViewModel({required this.profileRepository});

  ProfileModel? _profile;
  ProfileModel? get profile => _profile;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchProfile() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await profileRepository.fetchProfile();
    result.fold(
          (err) {
        _error = err.toString();
        _profile = null;
      },
          (data) {
        _profile = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}