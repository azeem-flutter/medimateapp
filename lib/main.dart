import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medimate_app/app.dart';
import 'package:medimate_app/data/repositories/authentication/authentication_repository.dart';
import 'package:medimate_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:medimate_app/firebase_options.dart';

void main() async {
  // Widgets bindings
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //Add Get local Storage
  await GetStorage.init();
  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  await Hive.initFlutter();
  // Load all the Material Design
  runApp(MediMateApp());
}
