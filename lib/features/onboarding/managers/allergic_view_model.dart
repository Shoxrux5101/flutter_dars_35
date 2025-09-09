import 'package:flutter/foundation.dart';
import '../../../data/models/allergic_model.dart';
import '../../../data/repository/onboarding/allergic_repository.dart';


class AllergyViewModel extends ChangeNotifier {
  final AllergyRepository repository;

  AllergyViewModel({required this.repository});

  List<AllergyModel> _items = [];
  List<AllergyModel> get items => List.unmodifiable(_items);

  bool _loading = false;
  bool get loading => _loading;

  String? _error;
  String? get error => _error;

  final Set<int> _selectedIds = {};
  Set<int> get selectedIds => Set.unmodifiable(_selectedIds);

  Future<void> loadAllergies() async {
    _loading = true;
    _error = null;
    notifyListeners();

    final result = await repository.getAllergies();
    result.fold(
          (err) {
        _error = err.toString();
      },
          (data) {
        _items = data;
      },
    );

    _loading = false;
    notifyListeners();
  }

  void toggleSelected(int id) {
    if (_selectedIds.contains(id)) {
      _selectedIds.remove(id);
    } else {
      _selectedIds.add(id);
    }
    notifyListeners();
  }

  bool isSelected(int id) => _selectedIds.contains(id);

  void clearSelection() {
    if (_selectedIds.isNotEmpty) {
      _selectedIds.clear();
      notifyListeners();
    }
  }

  List<AllergyModel> get selectedItems =>
      _items.where((e) => _selectedIds.contains(e.id)).toList();
}
