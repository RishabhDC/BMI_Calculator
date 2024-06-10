import 'package:bmi_cal/Controllers/bmiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onpress;

  const PrimaryButton({
    super.key,
    required this.icon,
    required this.btnName,
    required this.onpress
  });

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return  Expanded(
      child: InkWell(
        onTap: onpress,
        child: Obx(
            () => Container(
          height: 50,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: bmiController.Gender.value == btnName
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onBackground,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.background,
              ),
              SizedBox(width: 10,),
              Text(
                btnName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Theme.of(context).colorScheme.background,
                ),
              )
            ],
          ),
        ),
        )
      ),
    );
  }
}
