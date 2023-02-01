// class ProfileKeys {
//   static String profileId = 'PROFILEID';
//   static String email = 'PROFILEEMAIL';
//   static String password = 'PROFILEPASSWORD';
// }

enum ProfileKeys { profileId, profileEmail, profilePassword, isSaved, newTry }

extension ProfileKEysExtension on ProfileKeys {
  String get path => name.toUpperCase();
}
