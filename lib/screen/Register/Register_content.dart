


import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/api/api.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:ionicons/ionicons.dart';
import 'package:animated_background/animated_background.dart';
import '../../utils/constant.dart';
import '../home/home.dart';
import '../login/LoginScreen.dart';
import 'package:http/http.dart' as http;
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
  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool _isloading = false;
  bool _secureText = true;
  ShowHide(){
    setState(() {
      _secureText = !_secureText;
    });
  }




  Widget inputField(String hint, IconData iconData,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),

              ),

              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
            validator: MultiValidator(
                [
                  RequiredValidator(errorText: 'Required'),
                  EmailValidator(errorText: 'enter a your valid email'),


                ]
            ),
          ),
        ),
      ),
    );
  }
  Widget inputField3(String hint, IconData iconData,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),

              ),

              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
            keyboardType: TextInputType.phone,
            validator: MultiValidator(
                [
                  RequiredValidator(errorText: 'Required'),



                ]
            ),
          ),
        ),
      ),
    );
  }
  Widget inputField2(String hint, IconData iconData,TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
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
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),

              ),

              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              prefixIcon: Icon(iconData),
            ),
            validator: MultiValidator(
                [
                  RequiredValidator(errorText: 'Required'),
                ]
            ),
          ),
        ),
      ),
    );
  }
  Widget inputField1(String hint, IconData iconData,TextEditingController controller ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
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
            obscureText : _secureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),

              ),
              suffixIcon:IconButton(
                onPressed: ShowHide,
                icon: _secureText
                    ? Icon(Icons.visibility_off,size: 20,)
                    : Icon(Icons.visibility,size: 20,),
              ),
              filled: true,
              fillColor: Colors.white,

              hintText: hint,
              prefixIcon: Icon(iconData),

            ),
            validator: MultiValidator(
                [
                  MinLengthValidator(8, errorText: 'password is not good'),
                  RequiredValidator(errorText: 'Required'),


                ]
            ),

          ),
        ),

      ),

    );

  }


  Widget loginButton(String title){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 135,vertical: 2),
      child: ElevatedButton(
        onPressed: (){
          if (_FormKey.currentState!.validate()) {
            if( emailController.text.isEmpty && passController.text.isEmpty &&  phoneController.text.isEmpty &&  nameController.text.isEmpty   ){
              var snackBar = SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'On Snap!',
                  message:
                  'All the fields is required!',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.failure,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }else{
              registerSubmit();
              var snackBar = SnackBar(
                /// need to set following properties for best effect of awesome_snackbar_content
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Congratulations!!',
                  message:
                  'registered successful!',

                  /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                  contentType: ContentType.success,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

            }

          }else{
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
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: KSecondaryColor,
            shape: const StadiumBorder(),
            elevation: 8,
            shadowColor: Colors.black87
        ),
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
    return AnimatedBackground(
      behaviour: RandomParticleBehaviour(
        options: const ParticleOptions(
          spawnMaxRadius: 50,
          spawnMinSpeed: 10.00,
          particleCount: 68,
          spawnMaxSpeed: 50,
          minOpacity: 0.1,
          baseColor: Colors.white38,

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
            top: 130,
            left: 24,
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),


          Padding(padding: const EdgeInsets.only(top: 180),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Form(
                    key: _FormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:  [
                        inputField('Email',Icons.mail_outline,emailController),
                        inputField2('firstname',Icons.person,nameController),
                        inputField2('Surname',Icons.person,surnameController),
                        inputField3('Phone',Icons.phone,phoneController),
                        inputField2('Address',Icons.home,addressController),
                        inputField1('Password',Ionicons.lock_closed_outline,passController),
                        loginButton('Sign Up'),
                        Forgotpassword(),

                      ],
                    ),
                  ),
                ),
              ],

            ),
          )
        ],
      ),
    );
  }

  registerSubmit() async {
    setState(() {
      _isloading = true;

    });

    var data = {
      'firstname' : nameController.text,
      'surname' : surnameController.text,
      'email' : emailController.text,
      'password' : passController.text,
      'cell_number' : phoneController.text,
      'address' : addressController.text,
    };
    var res = await CallApi().postData(data, 'create_contacts');
    var body = json.decode(res.body);
    if(body['exist'] == 'exist'){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'account is already exist, go to the login page ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
        ),
      );

    }else{
      if(body['token']?.isNotEmpty == true){
        SharedPreferences localstorage = await SharedPreferences.getInstance();
        localstorage.setString('token', body['token'].toString());
        localstorage.setString('contact', json.encode(body['contact']));
        var userjson = localstorage.getString('contact');
        var contact = json.decode(userjson!);
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
          return const LoginScreen();
        }));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Registration failed!!!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
          ),
        );

      }
    }

    setState(() {
      _isloading = false;

    });

  }

}
