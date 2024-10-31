import 'package:flutter_test/flutter_test.dart';
import 'package:daftar_kontak/main.dart';

void main() {
  testWidgets('Menampilkan judul aplikasi', (WidgetTester tester) async {
    // Build aplikasi dan trigger frame.
    await tester.pumpWidget(MyApp());

    // Verifikasi judul aplikasi.
    expect(find.text('Daftar Kontak'), findsOneWidget);
  });
}
