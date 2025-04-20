import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> signInWithEmailPassword(String email, String password) async {
    return supabase.auth.signInWithPassword(email: email, password: password);
  }

  Future<AuthResponse> signUpWithEmailPassword(String email, String password) async {
    return supabase.auth.signUp(email: email, password: password);
  }

  Future<void> signOut() async {
    return supabase.auth.signOut();
  }

  String? getCurrentUserEmail() {
    final session = supabase.auth.currentSession;
    final user = session?.user;
    return user?.id;
  }

  Future<AuthResponse> googleSignIn() async {
    const webClientId = '330312646967-l7i1bdjlpc3ppak7081qda5ea013gdi9.apps.googleusercontent.com';
    const iosClientId = '330312646967-pigf8hi7epujl71l4h5tlmgbpem91595.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(clientId: iosClientId, serverClientId: webClientId);
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return supabase.auth.signInWithIdToken(provider: OAuthProvider.google, idToken: idToken, accessToken: accessToken);
  }
}
