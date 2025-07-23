class MFirebaseAuthException implements Exception {
  final String code;

  MFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      // Common account creation / login errors
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please contact support.';
      case 'weak-password':
        return 'The password is too weak. Please use a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';

      // Phone Auth errors
      case 'invalid-verification-code':
        return 'The SMS verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'missing-verification-code':
        return 'The SMS code is missing.';
      case 'missing-verification-id':
        return 'The verification ID is missing.';
      case 'session-expired':
        return 'The SMS code has expired. Please request a new code.';
      case 'quota-exceeded':
        return 'SMS quota exceeded. Please try again later.';
      case 'captcha-check-failed':
        return 'Recaptcha verification failed. Please try again.';

      // Credential and linking errors
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired.';
      case 'provider-already-linked':
        return 'This provider is already linked to the user.';
      case 'email-already-exists':
        return 'The email address is already in use.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';

      // Token/session/auth state errors
      case 'user-token-expired':
        return 'Your session has expired. Please log in again.';
      case 'invalid-user-token':
        return 'Your authentication token is invalid. Please log in again.';
      case 'user-mismatch':
        return 'The credentials do not correspond to the current user.';
      case 'token-expired':
        return 'Authentication token has expired. Please try again.';
      case 'null-user':
        return 'No user is currently signed in.';

      // Miscellaneous / system errors
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'network-request-failed':
        return 'A network error occurred. Please check your connection.';
      case 'internal-error':
        return 'An internal error occurred. Please try again.';
      case 'app-not-authorized':
        return 'App is not authorized to access Firebase Authentication.';
      case 'web-context-cancelled':
        return 'The sign-in operation was cancelled.';
      case 'popup-blocked':
        return 'The popup was blocked by the browser.';
      case 'popup-closed-by-user':
        return 'The popup was closed before completing the sign-in.';
      case 'unauthorized-domain':
        return 'This domain is not authorized for OAuth operations.';

      // Edge or rarely encountered
      case 'argument-error':
        return 'An invalid argument was provided.';
      case 'missing-email':
        return 'Email address is required.';
      case 'missing-password':
        return 'Password is required.';
      case 'user-signed-out':
        return 'The user is signed out. Please sign in again.';
      case 'web-storage-unsupported':
        return 'Your browser does not support web storage required for authentication.';
      case 'admin-restricted-operation':
        return 'This operation is restricted to administrators only.';
      case 'app-deleted':
        return 'The authentication app instance was deleted.';

      default:
        return 'A Firebase error occurred. Please try again.';
    }
  }
}
