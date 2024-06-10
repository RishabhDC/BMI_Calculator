
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';

class BMIController extends GetxController{
RxString Gender = "MALE".obs ;
RxInt weight = 12.obs;
RxInt age = 12.obs;
RxDouble height = 100.0.obs;
RxString BMI = "".obs;
RxDouble tempBMI = 0.0.obs;
RxString BMIStatus = "".obs;
Rx<Color> colorStatus = Color(0xff246AFE).obs;


  void genderHandel(String gender){
    Gender.value = gender;
  }

  void CalculatorBmi(){
    var Hmeter = height/100;
     tempBMI.value = weight / (Hmeter*Hmeter);
     BMI.value = tempBMI.toStringAsFixed(2);
     tempBMI.value = double.parse(BMI.value);
     findStatus();
  }

  void findStatus(){
    if(tempBMI.value < 18.5){
      BMIStatus.value = "UnderWeight";
      colorStatus.value = Color(0xff246AFE);
    }
    if(tempBMI.value >= 18.5 && tempBMI.value < 24.9){
      BMIStatus.value = "Normal";
      colorStatus.value = Colors.green;
    }
    if(tempBMI.value >= 25.0 && tempBMI.value < 29.9){
      BMIStatus.value = "OverWeigth";
      colorStatus.value = Colors.yellow;
    }
    if(tempBMI.value >= 30.0 && tempBMI.value < 34.9){
      BMIStatus.value = "OBESE";
      colorStatus.value = Colors.red.shade300;
    }
    if(tempBMI.value >= 35.0){
      BMIStatus.value = "Extremely OBESE";
      colorStatus.value = Colors.red;

    }
  }

}