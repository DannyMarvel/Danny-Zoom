import 'package:danny_zoom/resources/auth_methods.dart';
import 'package:danny_zoom/utils/colors.dart';
import 'package:danny_zoom/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//Android SHA1 key
//gradlew signinReport then press CTRL + Enter

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();

  Future<void> signInWithGoogler() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await auth.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
//MainAxisAlignment.center starts with the centre, then moves up as more widgets are added
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            child: Image.asset('assets/images/google-meet.jpg'),
          ),
          CustomButton(
              text: 'Google Sign In',
              onPressed: () async {
                await signInWithGoogler();

                Navigator.pushNamed(context, '/home');
              }
              // () async {
              //   print('Sign hello');
              //   bool res = await _authMethods.signInWithGoogle(context);
              //   if (res == true) {
              //     Navigator.pushNamed(context, '/home');
              //   }
              // },
              ),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
              container(),
        ],
      ),
    );
  }
}
