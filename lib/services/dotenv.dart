import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> dotenvLoad() async {
  await dotenv.load();
}
