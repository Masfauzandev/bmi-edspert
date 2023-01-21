import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BmiCalculator calculator;
  calculator = BmiCalculator(height: 100, weight: 50);

  group("Obese test", () {
    test("Test bmi calculator: obese category calculation", () {
      final result = calculator.calculateBmi();
      expect(result, 50);
    });

    test("test bmi calculator : obese category text", () {
      final result = calculator.determineBmiCategory();
      expect(result, contains("Obese"));
    });

    test("test bmi calculator : obese healt description", () {
      final BmiCalculator = calculator.calculateBmi();
      final result = calculator.getHealRiskDescription();
      expect(result, contains("Metabolic Syndrom"));
    });
  });

  group("Normal Test dengan hasil desimal", () {
    test("Test bmi calculator: normal category calculation", () {
      calculator.height = 150;
      calculator.weight = 50;
      final result = calculator.calculateBmi();
      final convertedResult = result.toStringAsFixed(1);
      expect(convertedResult, "22.2");
    });

    test("test bmi calculator : normal category text", () {
      final result = calculator.determineBmiCategory();
      expect(result, contains("Normal"));
    });

    test("test bmi calculator : normal healt description", () {
      final BmiCalculator = calculator.calculateBmi();
      final result = calculator.getHealRiskDescription();
      expect(result, contains("healty range"));
    });
  });
}
