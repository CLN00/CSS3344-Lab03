import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    imagePath: 'assets/rajang.jpg',
    description:
    'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. '
        'Cruise past historic temples, timber hubs, and traditional waterfront settlements '
        'while experiencing authentic Sarawakian hospitality.',
    ratingCount: 43,
    isStarred: false,
  );

  // Senarai Pakej Cruise (mengikut keperluan Lab 03)
  final List<String> packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  String _selectedPackage = 'Sunset Cruise';
  DateTime _selectedDate = DateTime(2026, 11, 15);
  bool _isDarkMode = false;

  // Getters
  String get selectedPackage => _selectedPackage;
  DateTime get selectedDate => _selectedDate;
  bool get isDarkMode => _isDarkMode;

  // Toggle Star Rating (untuk screenshot Before & After)
  void toggleStar() {
    destination.isStarred = !destination.isStarred;
    if (destination.isStarred) {
      destination.ratingCount++;
    } else {
      destination.ratingCount--;
    }
    notifyListeners();
  }

  // Kemaskini Tarikh Lawatan
  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  // Kemaskini Pakej Cruise
  void updatePackage(String? newPackage) {
    if (newPackage != null) {
      _selectedPackage = newPackage;
      notifyListeners();
    }
  }

  // Tukar Light / Dark Theme
  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}