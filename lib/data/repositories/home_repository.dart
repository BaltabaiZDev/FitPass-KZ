import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class HomeRepository extends GetxController {
  static HomeRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

}
