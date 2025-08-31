
///Interface that deal with the user
abstract class UserRepository {
  /// Request for recover password
  Future<void> recoverPassword(String email);

}