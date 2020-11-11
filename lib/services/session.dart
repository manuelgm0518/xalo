import 'package:xalo/models/users/Company.dart';
import 'package:xalo/models/users/Talent.dart';
import 'package:xalo/services/firebase_service.dart';

class Session {
  static Company company;
  static Talent talent;
  static String loggedAs = 'none';

  Future<bool> logIn(String email, String password) async {
    final talentRes = await FirebaseService.to.getWhere('/talents', (ref) => ref.where('email', isEqualTo: email).where('password', isEqualTo: password));
    if (talentRes?.isNotEmpty ?? false) {
      talent = new Talent.fromMap(talentRes.single);
      loggedAs = 'talent';
      return true;
    } else {
      final companyRes = await FirebaseService.to.getWhere('/companies', (ref) => ref.where('email', isEqualTo: email).where('password', isEqualTo: password));
      if (companyRes?.isNotEmpty ?? false) {
        company = new Company.fromMap(companyRes.single);
        loggedAs = 'company';
        return true;
      }
    }
    loggedAs = 'none';
    return false;
  }
}
