import 'package:fitpass_kz/features/home/controllers/animal_controller.dart';
import 'package:fitpass_kz/features/home/screens/animals/add_animals.dart';
import 'package:fitpass_kz/features/home/screens/animals/animal_details.dart';
import 'package:fitpass_kz/features/home/screens/home/widgets/flow_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimalController controller = Get.put(AnimalController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: Colors.black),
            onPressed: () {
              controller.loadAnimalsFromJson();
              Get.snackbar("Жүктеу", "JSON-дағы жануарлар Firestore-ға жүктелді.");
            },
          ),
          ElevatedButton(onPressed: () => Get.to(const AddAnimalScreen()), child: const Text("Add"))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Тест қолданбасы", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Obx(() {
          if (controller.animals.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.animals.length,
            itemBuilder: (context, index) {
              var animal = controller.animals[index];
              return FlowCont(
                title: animal.title,
                subtitle: animal.subtitle,
                image: animal.image,
                onTap: () => Get.to(
                  () => AnimalDetailScreen(
                    title: animal.title,
                    image: animal.image,
                    description: animal.description,
                  ),
                ),
                onPressed: () => Get.defaultDialog(
                  title: "Delete",
                  middleText: "Are you sure delete?",
                  textConfirm: "Yes",
                  textCancel: "No",
                  confirmTextColor: Colors.white,
                  onConfirm: () {
                    controller.deleteAnimal(animal.id!);
                    Get.back();
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
