import 'package:a/controllers/person_controller.dart';
import 'package:get/get.dart';

class DependencyInjector {
  static void initializeControllers() {
    //Injecting controllers

    Get.put(PersonController());
  }

  static void deleteControllers() {
    Get.deleteAll();
  }
}
