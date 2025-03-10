import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpass_kz/features/home/models/animal_model.dart';
import 'package:flutter/services.dart';

class AnimalRepository {
  final _db = FirebaseFirestore.instance;

  Stream<List<Animal>> getAnimalsStream() {
    return _db.collection("animals").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Animal.fromMap(doc.id, doc.data());
      }).toList();
    });
  }

  Future<void> addAnimalsFromJson() async {
    try {
      String jsonString = await rootBundle.loadString('assets/animals.json');
      List<dynamic> jsonData = json.decode(jsonString);

      for (var item in jsonData) {
        Animal animal = Animal.fromMap("", item);
        await _db.collection("animals").add(animal.toMap());
      }
    } catch (e) {
      throw Exception("❌ JSON-ды жүктеу қатесі: $e");
    }
  }

  Future<List<Animal>> fetchAnimals() async {
    try {
      QuerySnapshot snapshot = await _db.collection("animals").get();
      return snapshot.docs.map((doc) {
        return Animal.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("❌ Мәліметтерді жүктеу қатесі: $e");
    }
  }

  Future<void> addAnimal(Animal animal) async {
    try {
      DocumentReference docRef = await _db.collection("animals").add(animal.toMap());
      await docRef.update({"id": docRef.id});
    } catch (e) {
      throw Exception("❌ Мәліметтерді қосу қатесі: $e");
    }
  }

  Future<void> deleteAnimal(String animalId) async {
    try {
      await _db.collection("animals").doc(animalId).delete();
    } catch (e) {
      throw Exception("❌ Мәліметтерді жою қатесі: $e");
    }
  }
}
