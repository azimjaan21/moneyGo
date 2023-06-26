import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final totalLimitPercentage;
  const ProgressBar(this.totalLimitPercentage,{super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: FractionallySizedBox(
                widthFactor: totalLimitPercentage / 100,
                heightFactor: 1.8,
                child: Container(
                  height: 14,
                  width: 90,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff7356f7),
                        Color.fromARGB(255, 88, 54, 238),
                        Color.fromARGB(255, 86, 180, 247),
                        Color(0xff7356f7),
                        Color.fromARGB(255, 88, 54, 238),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff7356f7),
                        offset: Offset(1, 1),
                        blurRadius: 10,
                        spreadRadius: 0.5,
                      ),
                      BoxShadow(
                        color: Color(0xff7356f7),
                        offset: Offset(-1, -1),
                        blurRadius: 10,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                ),
              ),
            );
  }
}