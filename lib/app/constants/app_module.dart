import '../../main.dart';
import '../data/progress_dialog_utils.dart';
import '../service/firebase_service.dart';

void setUp() {
  getIt.registerSingleton<CustomDialogs>(CustomDialogs());
  getIt.registerSingleton<FirebaseService>(FirebaseService());
}
