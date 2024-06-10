import 'package:bmi_cal/Components/RactButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../Controllers/bmiController.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());
    //var percentageValue = bmiController.BMI.value / 100;

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                        Icons.arrow_back_ios_new_outlined,
                      size: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Text(
                        "Back"
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
            
                Row(
                  children: [
                    Obx(() => Text(
                      "Your BMI is ",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: bmiController.colorStatus.value,
                      ),
                    ),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 350,
                  child: Expanded(
                    child: Obx(() => CircularPercentIndicator(
                      animationDuration: 1000,
                      footer: Text(
                        "${bmiController.BMIStatus.value}",
                        style: TextStyle(
                            color: bmiController.colorStatus.value,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      radius: 140,
                      lineWidth: 30,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: bmiController.tempBMI.value /100,
                      center: new Text(
                          "${bmiController.BMI.value}%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: bmiController.colorStatus.value,
                        ),
                      ),
                      progressColor: bmiController.colorStatus.value,
                      backgroundColor: bmiController.colorStatus.value.withOpacity(0.2),
                    ),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Obx(() => Text(
                    "Your BMI is 20.7,"
                        " indicating your weight is"
                        " in the Normal category for adults of your height."
                        "  For your height, a normal weight range wouldbe"
                        " from 53.5 to 72 kilograms.Maintaining a healthy "
                        "weight may reduce the risk of chronic diseases associated"
                        " with overweight and obesity.",
                    style: TextStyle(
                        color: bmiController.colorStatus.value
                    ),
                  ),
                  )
                ),
                SizedBox(height: 20,),
                MyRactButton(
                    onpress: (){
                      Get.back();
                    },
                    btnName: "Find Out More",
                    icon: Icons.arrow_back_ios_new_outlined
                )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
