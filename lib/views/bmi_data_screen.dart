import 'package:bmi/constants/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({super.key});

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  // double calculateBmi() {
  // double heightInMeter = height / 100;

  // final h = pow(height, 2);
  // final h = (heightInMeter * heightInMeter);
  // final bmi = weight / h;

  // return bmi;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color(0xff808080),
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    gender = "male";

                    setState(() {});
                  },
                  child: BmiCard(
                    borderColor: (gender == "male")
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : primaryColor,
                    child: Stack(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: GenderIconText(
                              icon: Icons.male,
                              title: 'Male',
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Icon(
                            Icons.check_circle,
                            color: (gender == "male")
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";

                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "female")
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : primaryColor,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: GenderIconText(
                                icon: Icons.female,
                                title: 'Female',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "female")
                                  ? const Color.fromARGB(255, 255, 255, 255)
                                  : primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$height",
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 200,
                    inactiveColor: const Color.fromARGB(255, 89, 87, 87),
                    thumbColor: Colors.white,
                    activeColor: Colors.grey,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(children: [
            Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    Text(
                      "$weight",
                      style: numberTextStyle,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            weight += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: Colors.white,
                          constraints: const BoxConstraints.tightFor(
                            width: 40,
                            height: 40,
                          ),
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 10),
                        RawMaterialButton(
                          onPressed: () {
                            weight -= 1;
                            setState(() {});
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: Colors.white,
                          constraints: const BoxConstraints.tightFor(
                            width: 40,
                            height: 40,
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: labelTextStyle,
                    ),
                    Text(
                      "$age",
                      style: numberTextStyle,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            age += 1;
                            setState(() {});
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: Colors.white,
                          constraints: const BoxConstraints.tightFor(
                            width: 40,
                            height: 40,
                          ),
                          child: const Icon(Icons.add),
                        ),
                        const SizedBox(width: 10),
                        RawMaterialButton(
                          onPressed: () {
                            age -= 1;
                            setState(() {});
                          },
                          elevation: 0,
                          shape: const CircleBorder(),
                          fillColor: Colors.white,
                          constraints: const BoxConstraints.tightFor(
                            width: 40,
                            height: 40,
                          ),
                          child: const Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ])),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBmi();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 60,
              color: const Color.fromARGB(255, 248, 15, 15),
              child: const Center(
                  child: Text(
                "CALCULATION",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xffffa500),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor!),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
