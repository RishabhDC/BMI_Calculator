import 'package:bmi_cal/Components/AgeSelector.dart';
import 'package:bmi_cal/Components/HeightSelector.dart';
import 'package:bmi_cal/Components/PrimaryButton.dart';
import 'package:bmi_cal/Components/RactButton.dart';
import 'package:bmi_cal/Components/ThemeChangeBtn.dart';
import 'package:bmi_cal/Components/WeigthSelector.dart';
import 'package:bmi_cal/Controllers/ThemeController.dart';
import 'package:bmi_cal/Pages/ResultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../Controllers/bmiController.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    BMIController bmiController = Get.put(BMIController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
             ThemeChangeBtn(),
              Row(
                children: [
                  Text(
                    "Welcome 😊",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,

                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  PrimaryButton(
                    icon: Icons.male_outlined,
                    btnName: 'MALE',
                    onpress: () {
                      bmiController.genderHandel("MALE");
                    },
                  ),
                  SizedBox(width:  20,),
                  PrimaryButton(
                    icon: Icons.female_outlined,
                    btnName: 'FEMALE',
                    onpress: () {
                      bmiController.genderHandel("FEMALE");
                    },
                  ),
                ],
              ),
              SizedBox(height:  20,),
              Expanded(
                  child: Row(
                    children: [
                       HeigthSelector(),
                      SizedBox(width: 20,),
                     Expanded(
                         child: SingleChildScrollView(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                              WeigthSelector(),
                               SizedBox(height: 30,),
                               AgeSelector(),
                             ],
                           ),
                         )
                     )
                    ],
                  )
              ),
              SizedBox(height: 20,),
               MyRactButton(
                   icon: Icons.done_all_sharp,
                   btnName: "Lets Go",
                 onpress: () {
                     bmiController.CalculatorBmi();
                    Get.to( ResultPage());
                 },
               )
            ],
          ),
        ),
      ),
    );
  }
}
