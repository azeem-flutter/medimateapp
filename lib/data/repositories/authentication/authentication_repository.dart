import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medimate_app/core/common/wrapper/wrap_navigationbar.dart';
import 'package:medimate_app/core/utils/Loader/loader.dart';
import 'package:medimate_app/core/utils/exception/firebase_auth_exception.dart';
import 'package:medimate_app/core/utils/exception/firebase_exception.dart';
import 'package:medimate_app/core/utils/exception/format_exception.dart';
import 'package:medimate_app/core/utils/exception/platform_exception.dart';
import 'package:medimate_app/features/auth/presentation/screens/login/login.dart';
import 'package:medimate_app/features/auth/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:medimate_app/features/auth/presentation/screens/signup/signup.dart';
import 'package:medimate_app/features/auth/presentation/screens/signup/verify_email.dart';
import 'package:medimate_app/features/home/presentation/home_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  //Called From main.dart on app lanch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show Relevent Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => MainWrapper());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnboardingScreen());
    }
  }

  /* -----------------------Email & Password sign-in ------------------------*/
  //[EmailAuthentication]- Signin
  Future<UserCredential> loginwithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong . Please try again';
    }
  }

  //[EmailAuthentication]- Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong . Please try again';
    }
  }

  /*------------------------------- socail sign-in --------------------------------------*/

  //[GoogleAuthentication] - Google

  /* Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong . Please try again';
    }
  }   */

  //[EMail Verification] - Email Verification Function
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //[LogoutUser] valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Delete account
  Future<void> delete() async {
    try {
      await FirebaseAuth.instance.currentUser?.delete();
      MLoader.successSnackBar(
        title: 'Account Deleted',
        message: 'You can sign up again with the same email',
      );
    } catch (e) {
      MLoader.errorSnackBar(
        title: 'Error',
        message: 'could not delete account. Please try again.',
      );
    }
  }
}
