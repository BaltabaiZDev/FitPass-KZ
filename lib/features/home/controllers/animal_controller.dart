import 'package:fitpass_kz/data/repositories/animal_repository.dart';
import 'package:fitpass_kz/features/home/models/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimalController extends GetxController {
  static AnimalController get instance => Get.find();

  final AnimalRepository _animalRepository = AnimalRepository();

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  var isLoading = false.obs;

  var animals = <Animal>[].obs;

  @override
  void onInit() {
    fetchAnimals();
    super.onInit();
  }

  void fetchAnimals() async {
    try {
      var result = await _animalRepository.fetchAnimals();
      animals.value = result;
    } catch (e) {
      Get.snackbar("Қате", "Мәліметтерді жүктеу сәтсіз аяқталды.");
    }
  }

  void clearFields() {
    titleController.clear();
    subtitleController.clear();
    descriptionController.clear();
    imageController.clear();
  }

  Future<void> addAnimal(Animal animal) async {
    try {
      isLoading.value = true;
      await _animalRepository.addAnimal(animal);
      fetchAnimals();
      clearFields();
    } catch (e) {
      Get.snackbar("Қате", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadAnimalsFromJson() async {
    await _animalRepository.addAnimalsFromJson();
    fetchAnimals();
  }

  Future<void> deleteAnimal(String animalId) async {
    try {
      isLoading.value = true;
      await _animalRepository.deleteAnimal(animalId);
      fetchAnimals();
    } catch (e) {
      Get.snackbar("Қате", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
