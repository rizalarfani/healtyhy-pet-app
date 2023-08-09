import 'package:flutter/cupertino.dart';

class BerandaProvider extends ChangeNotifier {
  final List<String> _listCategory = [
    'Vaccine',
    'Surgery',
    'SPA & Treatment',
    'Consultation',
  ];
  int _selectedCategory = 0;

  final List<Map<String, dynamic>> _listServices = [
    {
      "name": "Dr. Stone",
      "category": "Vaccine, Surgery",
      "distance": "10KM",
      "image": "assets/images/dr_1.jpg",
      "isDog": true,
      "isCat": true,
    },
    {
      "name": "Dr. Vannesa",
      "category": "Vaccine, Surgery",
      "distance": "15KM",
      "image": "assets/images/dr_2.png",
      "isCat": true,
    }
  ];

  List<String> get listCategory => _listCategory;
  int get selectedCategory => _selectedCategory;

  List<Map<String, dynamic>> get listServices => _listServices;

  set selectedCategory(int index) {
    _selectedCategory = index;
    notifyListeners();
  }
}
