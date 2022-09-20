
import 'dart:convert';

import 'package:beautyapp/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animated_background/animated_background.dart';
import '../../utils/constant.dart';
import '../home/home.dart';
import '../login/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Screen{
  createAccount,
  welcomeBack,
}

class RegisterContent extends StatefulWidget {
  const RegisterContent({Key? key}) : super(key: key);

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> with TickerProviderStateMixin {

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool _isloading = false;

  Widget inputField(String hint, IconData iconData,TextEditingController controller ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 5),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            controller: controller,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
          ),
        ),

      ),

    );

  }

  Widget loginButton(String title){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 135,vertical: 10),
      child: ElevatedButton(
        onPressed: _isloading? null : _handlelogin,
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: const StadiumBorder(),
            primary: KSecondaryColor,
            elevation: 8,
            shadowColor: Colors.black87
        ),
        child: Text(
          _isloading?'Creating' : title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 150,vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: KPrimaryColor,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child:Container(
              height: 1,
              color: KPrimaryColor,
            ) ,
          ),
        ],
      ),
    );


  }

  Widget Logo(){
    return Padding(padding: EdgeInsets.symmetric(vertical: 10),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.facebook_outlined),),
          IconButton(onPressed: (){}, icon:Icon(Ionicons.logo_google)),
        ],
      ),

    );

  }

  Widget Forgotpassword(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(''
              'You have a account?',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return const LoginScreen();
              }));

            },
            child: const Text(
              ' Log In',
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
    const currentScreen = Screen.createAccount;
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          spawnMaxRadius: 50,
          spawnMinSpeed: 10.00,
          particleCount: 68,
          spawnMaxSpeed: 50,
          minOpacity: 0.1,
          baseColor: Colors.pinkAccent,

        ),
      ),
      vsync: this,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            child: IconButton (
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginScreen();
                }));
              },
              color: KPrimaryColor,



            ),
          ),
          const Positioned(
            top: 50,
            left: 115,
            child:Text(

              'Standard.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 80,
            left: 135,
            child: Text(

              'BEAUTY',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          const Positioned(
            top: 120,
            left: 24,
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),


          Padding(padding: const EdgeInsets.only(top: 160),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [
                      inputField('Name',Icons.person_outline,nameController),
                      inputField('surname',Icons.person_outline,surnameController),
                      inputField('Email',Icons.mail_outline,emailController),
                      inputField('Phone',Icons.phone_android_outlined,phoneController),
                      inputField('Password',Ionicons.lock_closed_outline,passController),
                      inputField('Confirm',Ionicons.lock_closed_outline,confirmController),
                      loginButton('Sign Up'),
                      Forgotpassword(),
                      orDivider(),
                      Logo(),
                    ],
                  ),
                ),
              ],

            ),
          )
        ],
      ),
    );
  }
  void _handlelogin() async{
    setState(() {
      _isloading=true;
    });
    var data = {
      'firname' : nameController ,
      'surname' : surnameController ,
      'email' : emailController ,
      'phone' : phoneController ,
      'password' : passController ,
    };

    var res = await CallApi().postData(data, 'register');
    var body = json.decode(res.body);
    if(body['sucess']){
      SharedPreferences localsStorage = await SharedPreferences.getInstance();
      localsStorage.setString('token', body['token']);
      localsStorage.setString('user', json.decode(body['user']));


      var userJson = localsStorage.getString('user');
      var user = json.decode(userJson!);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
        return const HomePage();
      }));
    }

    setState(() {
      _isloading=false;
    });
  }
}
