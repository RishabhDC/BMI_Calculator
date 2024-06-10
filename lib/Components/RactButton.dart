import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class MyRactButton extends StatelessWidget {
  final VoidCallback onpress;
  final String btnName;
  final IconData icon;

  const MyRactButton({
    super.key,
    required this.onpress,
    required this.btnName,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onpress,
        child: Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                SizedBox(width: 10,),
                Text(
                  btnName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                )
              ],
            ),
          ),
    );
  }
}
