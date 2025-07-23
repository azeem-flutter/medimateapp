class MFirebaseException implements Exception {
  final String code;
  MFirebaseException(this.code);

  String get message {
    switch (code) {
      // Firestore-specific
      case 'permission-denied':
        return 'You do not have permission to perform this action.';
      case 'unavailable':
        return 'Service is currently unavailable. Please try again later.';
      case 'not-found':
        return 'The requested document was not found.';
      case 'deadline-exceeded':
        return 'The operation timed out. Please try again.';
      case 'aborted':
        return 'The operation was aborted. Please try again.';

      // Firebase Storage
      case 'object-not-found':
        return 'No object exists at the specified path.';
      case 'bucket-not-found':
        return 'No storage bucket is configured.';
      case 'project-not-found':
        return 'Project not found. Check your Firebase configuration.';
      case 'unauthenticated':
        return 'You need to be authenticated to access this resource.';
      case 'unauthorized':
        return 'You are not authorized to access the requested resource.';
      case 'cancelled':
        return 'The operation was cancelled.';

      // Cloud Messaging / Functions
      case 'messaging/invalid-argument':
        return 'Invalid argument passed to Firebase Messaging.';
      case 'messaging/registration-token-not-registered':
        return 'This device is not registered for push notifications.';
      case 'messaging/internal-error':
        return 'Internal error in Firebase Messaging.';
      case 'function-not-found':
        return 'Requested cloud function was not found.';
      case 'internal':
        return 'An internal Firebase error occurred. Please try again.';

      // Realtime Database
      case 'disconnected':
        return 'The connection to the database was lost.';
      case 'network-error':
        return 'A network error occurred. Check your connection.';
      case 'max-retries':
        return 'Maximum retry limit reached. Try again later.';

      // General/Other
      case 'invalid-argument':
        return 'Invalid argument provided. Check your input.';
      case 'resource-exhausted':
        return 'Quota exceeded or resource exhausted.';
      case 'data-loss':
        return 'Data corruption or loss occurred.';
      case 'failed-precondition':
        return 'Operation was rejected due to failed preconditions.';
      case 'already-exists':
        return 'The resource already exists.';
      case 'unknown':
        return 'An unknown Firebase error occurred.';

      default:
        return 'Firebase operation failed. Please try again.';
    }
  }
}
