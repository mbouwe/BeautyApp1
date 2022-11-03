import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/api/api.dart';
import 'package:beautyapp/provider/google_sign_in.dart';
import 'package:beautyapp/screen/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animated_background/animated_background.dart';
import 'package:provider/provider.dart';
import '../../utils/constant.dart';
import '../Register/RegisterScreen.dart';
import '../home/home.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../restore/forgotpassword.dart';

enum Screen {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  //const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  bool _isloading = false;
  bool _secureText = true;




  ShowHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late ScaffoldState scaffoldState;


  Widget inputField(String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      child: SizedBox(
        height: 80,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
            validator: MultiValidator([
              RequiredValidator(errorText: 'Required'),
              EmailValidator(errorText: 'enter a your valid email'),
            ]),
          ),
        ),
      ),
    );
  }

  Widget inputField1(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      child: SizedBox(
        height: 80,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            obscureText: _secureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              suffixIcon: IconButton(
                onPressed: ShowHide,
                icon: _secureText
                    ? const Icon(
                        Icons.visibility_off,
                        size: 20,
                      )
                    : const Icon(
                        Icons.visibility,
                        size: 20,
                      ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
            validator: MultiValidator([
              MinLengthValidator(8, errorText: 'password is not good'),
              RequiredValidator(errorText: 'Required'),
            ]),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          if (_FormKey.currentState!.validate() && emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
            sudmitLogin();

            var snackBar = SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'congratulations!',
                message:
                'login successful!',

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.success,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            var snackBar = SnackBar(
              /// need to set following properties for best effect of awesome_snackbar_content
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'On Snap!',
                message:
                'the fields is required!',

                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                contentType: ContentType.failure,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: KSecondaryColor,
            shape: const StadiumBorder(),
            elevation: 8,
            shadowColor: Colors.black87),
        child: _isloading ? CircularProgressIndicator(color: Colors.white,):Text(
           title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget Logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.logo_facebook),
          ),
          const SizedBox(
            width: 24,
          ),
          IconButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const HomePage();
              }));
            },
            icon: const Icon(Ionicons.logo_google),
          ),
        ],
      ),
    );
  }

  Widget Forgotpassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ''
            'Forgot you password?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const ForgotPass();
              }));
            },
            child: const Text(
              ' Click Here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Forgotpassword2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ''
            'You not have a account?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return const RegisterScreen();
              }));
            },
            child: const Text(
              ' Register',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: KSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          spawnMaxRadius: 50,
          spawnMinSpeed: 10.00,
          particleCount: 28,
          spawnMaxSpeed: 50,
          minOpacity: 0.1,
          baseColor: Colors.white38,
        ),
      ),
      vsync: this,
      child: Stack(
        children: [
          const Positioned(
            top: 50,
            left: 115,
            child: Text(
              'Standard.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 90,
            left: 135,
            child: Text(
              'BEAUTY',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          const Positioned(
            top: 150,
            left: 24,
            child: Text(
              'Welcome\nBack',
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 240),
              child: Stack(
                children: [
                  Form(
                    key: _FormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        inputField(
                            'Email', Icons.mail_outline, emailcontroller),
                        inputField1('Password', Ionicons.lock_closed_outline,
                            passwordcontroller),
                        Forgotpassword(),
                        loginButton('Log In'),
                        Forgotpassword2(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  sudmitLogin() async {
    setState(() {
      _isloading = true;
    });
    var data = {
      'email': emailcontroller.text,
      'password': passwordcontroller.text,
    };
    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if (body['token']?.isNotEmpty == true) {
      SharedPreferences localstorage = await SharedPreferences.getInstance();
      localstorage.setString('contact',json.encode(body['contact'] ));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      }));
    } else {
      var snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Oups!',
          message:
          'this email is not exist!',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    setState(() {
      _isloading = false;
    });
  }
}
