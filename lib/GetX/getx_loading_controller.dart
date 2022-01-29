import 'package:get/get.dart';

class GetxLoadingController extends GetxController {
  bool _showProgressForButton = false;

  bool get showProgressForButton => _showProgressForButton;

  void setProgressForButton(bool value) {
    _showProgressForButton = value;
    update();
  }
}
