import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({
    Key? key,
    required this.bmi,
    //this.bmiCalculator,
  }) : super(key: key);
  final double bmi;
  //final BmiCalculator? bmiCalculator;

  // String determineBmiCategory(double bmiValue) {
  //   String category = "";
  //   if (bmiValue < 16.0) {
  //     category = underweightSevere;
  //   } else if (bmiValue < 17) {
  //     category = underweightModerate;
  //   } else if (bmiValue < 18.5) {
  //     category = underweightMild;
  //   } else if (bmiValue < 25) {
  //     category = normal;
  //   } else if (bmiValue < 30) {
  //     category = overweight;
  //   } else if (bmiValue < 35) {
  //     category = obeseI;
  //   } else if (bmiValue < 40) {
  //     category = obeseII;
  //   } else if (bmiValue >= 40) {
  //     category = obeseIII;
  //   }

  //   return category;
  // }

  // String getHealRiskDescription(String categoryName) {
  //   String desc = "";
  //   switch (categoryName) {
  //     case underweightSevere:
  //     case underweightModerate:
  //     case underweightMild:
  //       desc = "Possible nutritional deficiency and osteoporosis.";
  //       break;

  //     case normal:
  //       desc = "low risk (healty range).";
  //       break;
  //     case overweight:
  //       desc =
  //           "Moderate risk of developing heart disease, high blood pressire, stroke, diabetes mellitus.";
  //       break;
  //     case obeseI:
  //     case obeseII:
  //     case obeseIII:
  //       desc =
  //           "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus, Metabolic Syndrom.";
  //       break;
  //     default:
  //   }
  //   return desc;
  // }

  @override
  Widget build(BuildContext context) {
    final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
    //final bmiCategory =
    bmiCalculator.determineBmiCategory();
    //final bmiDesc =
    bmiCalculator.getHealRiskDescription();

    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text("Hasil Hitung BMI"),
        ),
        body: Column(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  "YOUR RESULT",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BmiCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        // (bmiCalculator.bmiCategory ==null) "" :bmiCalculator.bmiCategory
                        bmiCalculator.bmiCategory ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        bmiCalculator.bmiDescription ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 60,
                color: const Color.fromARGB(255, 248, 15, 15),
                child: const Center(
                    child: Text(
                  "RE-CALCULATION",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              ),
            )
          ],
        ));
  }
}
