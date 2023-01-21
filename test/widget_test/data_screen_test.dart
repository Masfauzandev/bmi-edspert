import 'package:bmi/main.dart';
import 'package:bmi/views/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("BMI Data Screen Test Widget", (tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1200, 2200);
    await tester.pumpWidget(const DataScreenTest());

    final findMaleIcon = find.byIcon(Icons.male);
    final findFemaleIcon = find.text("Female");
    final findChecksIcon = find.byIcon(Icons.check_circle);

    expect(findMaleIcon, findsOneWidget);
    expect(findFemaleIcon, findsOneWidget);
    expect(findChecksIcon, findsNWidgets(2));

    final findHitung = find.text("Hitung BMI");
    expect(findHitung, findsOneWidget);
    await tester.tap(findHitung);
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(findMaleIcon, findsNothing);
  });
}

class DataScreenTest extends StatelessWidget {
  const DataScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiDataScreen(),
    );
  }
}
