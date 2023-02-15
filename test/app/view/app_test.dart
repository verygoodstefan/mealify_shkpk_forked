import 'package:flutter_test/flutter_test.dart';
import 'package:mealify_shkpk/app/app.dart';
import 'package:mealify_shkpk/ideas/views/ideas.dart';

void main() {
  group('App', () {
    testWidgets('renders Ideas Page', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(Ideas), findsOneWidget);
    });
  });
}
