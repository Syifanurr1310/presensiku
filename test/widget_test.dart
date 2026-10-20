
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('PresensiKu app dapat dibuka', (WidgetTester tester) async {
    await tester.pumpWidget(const PresensiKuApp());

    expect(find.text('PresensiKu'), findsOneWidget);
  });
}
