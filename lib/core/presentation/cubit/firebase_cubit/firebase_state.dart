part of 'firebase_cubit.dart';

class FirebaseState extends Equatable {
  const FirebaseState({
    required this.status,
    this.fcmToken,
  });

  final FirebaseStatus status;
  final String? fcmToken;

  @override
  List<Object?> get props => [
        status,
        fcmToken,
      ];
}

enum FirebaseStatus {
  initial,
  loading,
  completed,
  networkError,
  unknownError,
}
