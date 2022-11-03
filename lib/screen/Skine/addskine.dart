import 'dart:convert';

import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/screen/Skine/SkineScreen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import '../../api/api.dart';
import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';

class AddSkine extends StatefulWidget {
  const AddSkine({Key? key}) : super(key: key);

  @override
  State<AddSkine> createState() => _AddSkineState();
}

class _AddSkineState extends State<AddSkine> with TickerProviderStateMixin{
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  var UserData;
  Widget topWidget(screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: LinearGradient(
                begin: Alignment(-0.2, -0.2),
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xB3BF8BE5),
                  Color(0xB3BE4EEE),
                ])),
      ),
    );
  }

  Widget inputField2(
      String hint, IconData iconData, TextEditingController controller) {
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
            controller: controller,
            autovalidateMode: AutovalidateMode.always,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
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
            ]),
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment(0.6, -1.1),
            end: Alignment(0.7, 0.8),
            colors: [
              Color(0xB3BF8BE5),
              Color(0xB3BE4EEE),
            ]),
      ),
    );
  }
  @override
  TextEditingController mediccontroller = TextEditingController();
  late bool isloading = false;
  void initState() {
    _getData();
    super.initState();
  }
  


  void _getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userjson = localStorage.getString('contact');
    var contact = json.decode(userjson!);
    setState(() {
      UserData = contact;
    });
  }
  
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          Centerwidget(size: screenSize),
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMaxRadius: 50,
                spawnMinSpeed: 10.00,
                particleCount: 68,
                spawnMaxSpeed: 50,
                minOpacity: 0.1,
                baseColor: Colors.white,
              ),
            ),
            vsync: this,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return SkineScreen();
                            }));
                      },
                      color: Colors.pink,
                    ),
                    const Text(
                      'Back',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: KPrimaryColor),
                    ),

                  ]),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.all(15)),
                        const Text(
                          'Add Skine Profile',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: KPrimaryColor),
                        ),
                        Form(
                          key: _FormKey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              inputField2('Add Skine Profile', Icons.sanitizer_rounded,mediccontroller),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {

                            print(UserData[0]['id']);
                            if (_FormKey.currentState!.validate() && mediccontroller.text.isNotEmpty) {
                              var data = {
                                'content': mediccontroller.text,
                              };
                              var res = await CallApi().postData(
                                  data, 'create_skin/${UserData[0]['id']}');
                              var body = json.decode(res.body);
                              if (body['success'] == true) {
                                var snackBar = SnackBar(
                                  /// need to set following properties for best effect of awesome_snackbar_content
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'yeah!',
                                    message: 'skine profile add successfuly!',
                                    contentType: ContentType.success,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                              } else {

                                var snackBar = SnackBar(
                                  /// need to set following properties for best effect of awesome_snackbar_content
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'Oups!',
                                    message: 'medication add failed!',

                                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                    contentType: ContentType.failure,
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else {
                              var snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Oups!',
                                  message: 'All the fields required!',
                                  contentType: ContentType.failure,
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              print('${UserData[0]['id']}');
                            }



                            },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 80),
                              backgroundColor: KSecondaryColor,
                              shape: const StadiumBorder(),
                              elevation: 8,
                              shadowColor: Colors.black87),
                          child: const Text(
                            'Add Skine Profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
