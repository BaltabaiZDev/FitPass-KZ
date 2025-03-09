import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitpass_kz/features/home/models/animal_model.dart';

class AnimalRepository {
  final _db = FirebaseFirestore.instance;

  // 🔵 Firestore-дан real-time жаңару үшін stream қолдану
  Stream<List<Animal>> getAnimalsStream() {
    return _db.collection("animals").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Animal.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  // 🔵 Firestore-дан жануарларды бір рет алу (real-time емес)
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

  // 🔵 Firestore-ға жаңа жануар қосу
  Future<void> addAnimal(Animal animal) async {
    try {
      DocumentReference docRef = await _db.collection("animals").add(animal.toMap());
      await docRef.update({"id": docRef.id});
    } catch (e) {
      throw Exception("❌ Мәліметтерді қосу қатесі: $e");
    }
  }
}
