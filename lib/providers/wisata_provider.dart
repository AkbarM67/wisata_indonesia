import 'package:flutter/material.dart';
import 'package:wisata_indonesia/models/model_wisata.dart';

class WisataProvider with ChangeNotifier {
  final List<Wisata> _savedWisata = [];

  List<Wisata> get savedWisata => _savedWisata;

  void toggleSave(Wisata wisata) {
    if (_savedWisata.contains(wisata)) {
      _savedWisata.remove(wisata);
    } else {
      _savedWisata.add(wisata);
    }
    notifyListeners();
  }

  bool isSaved(Wisata wisata) {
    return _savedWisata.contains(wisata);
  }
}
