import 'package:bmi_cal/Controllers/bmiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class HeigthSelector extends StatelessWidget {
  const HeigthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    BMIController bmiController = Get.put(BMIController());

    return  Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Heigth (CM)",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onBackground
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Obx(() => SfSlider.vertical(
                    min: 25,
                    max: 250,
                    value: bmiController.height.value,
                    interval: 25,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 5,
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    onChanged: (dynamic value) {
                      bmiController.height.value = value;
                    },
                  ),
                  )
              )
            ],
          ),
        )
    );
  }
}
