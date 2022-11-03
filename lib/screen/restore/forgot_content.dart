

import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../utils/constant.dart';
import '../login/LoginScreen.dart';


enum Screen{
  createAccount,
  welcomeBack,
}

class ForgotContent extends StatefulWidget {
  const ForgotContent({Key? key}) : super(key: key);

  @override
  State<ForgotContent> createState() => _ForgotContentState();
}

class _ForgotContentState extends State<ForgotContent> with TickerProviderStateMixin {
  Widget inputField(String hint, IconData iconData) {
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


  Widget loginButton(String title){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 135,vertical: 16),
      child: ElevatedButton(
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(
                  'your are received the link for restore your password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
          );
        },
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: KSecondaryColor,
            shape: const StadiumBorder(),
            elevation: 8,
            shadowColor: Colors.black87
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider(){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 150,vertical: 8),
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
    return Padding(padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon:Icon(Icons.facebook_outlined),),
          const SizedBox(width: 24,),
          IconButton(onPressed: (){}, icon:Icon(Icons.grid_on),),
        ],
      ),

    );

  }

  Widget Forgotpassword(){
    return Padding(padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(''
              'Forgot you password? restore here',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400
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
            top: 60,
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
            top: 100,
            left: 130,
            child: Text(

              'BEAUTY',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          const Positioned(
            top: 220,
            left: 30,
            child: Text(
              'Restore\n Password',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(padding: const EdgeInsets.only(top: 350),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children:  [

                      Forgotpassword(),
                      SizedBox(height: 10,),
                      inputField('Email',Icons.mail_outline),
                      loginButton('Send'),

                    ],
                  )
                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}
