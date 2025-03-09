import 'package:fitpass_kz/features/home/controllers/animal_controller.dart';
import 'package:fitpass_kz/features/home/models/animal_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAnimalScreen extends StatelessWidget {
  const AddAnimalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimalController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Жаңа жануар қосу")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: controller.titleController, decoration: const InputDecoration(labelText: "Атауы")),
            TextField(
                controller: controller.subtitleController, decoration: const InputDecoration(labelText: "Сипаттама")),
            TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: "Толық ақпарат")),
            TextField(
                controller: controller.imageController, decoration: const InputDecoration(labelText: "Сурет URL")),
            const SizedBox(height: 20),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        Animal newAnimal = Animal(
                          title: controller.titleController.text,
                          subtitle: controller.subtitleController.text,
                          description: controller.descriptionController.text,
                          image: controller.imageController.text,
                        );

                        await controller.addAnimal(newAnimal);
                        Get.back(); // 🔵 Артқа қайту
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // 🔵 Кнопканы толық еніне созу
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white) // 🔵 Күту индикаторы
                    : const Text("Жануарды қосу"), // 🔵 Кәдімгі батырма
              ),
            ),
          ],
        ),
      ),
    );
  }
}
