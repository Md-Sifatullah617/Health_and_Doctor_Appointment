import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CardModel {
  String doctor;
  int cardBackground;
  var cardIcon;

  CardModel(this.doctor, this.cardBackground, this.cardIcon);
}

List<CardModel> cards = [
  new CardModel("Cardiologist", 0xFFec407a, TablerIcons.heart),
  new CardModel("Dentist", 0xFF5c6bc0, TablerIcons.medical_cross),
  new CardModel("Eye Special", 0xFFfbc02d, TablerIcons.eye),
  new CardModel("Orthopaedic", 0xFF1565C0, Icons.wheelchair_pickup_sharp),
  new CardModel("Paediatrician", 0xFF2E7D32, Icons.child_friendly),
];
