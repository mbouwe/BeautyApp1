import 'dart:convert';
import 'dart:io';



import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/screen/joinChallenge/joinchallenge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';

class ChallengeProgress extends StatefulWidget {
  int? value;
  ChallengeProgress({Key? key, required this.value}) : super(key: key);

  @override
  State<ChallengeProgress> createState() => _ChallengeProgressState();
}

class _ChallengeProgressState extends State<ChallengeProgress> with TickerProviderStateMixin {
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  var UserData;
  File? image;

  Widget topWidget(screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: const LinearGradient(
                begin: Alignment(-0.2, -0.2),
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xB3BF8BE5),
                  Color(0xB3BE4EEE),
                ])),
      ),
    );
  }

  Widget inputField2(String hint, IconData iconData,
      TextEditingController controller) {
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

  Widget inputField(String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 4),
      child: SizedBox(
        height: 180,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            autovalidateMode: AutovalidateMode.always,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,

            ),
            validator: MultiValidator([
              RequiredValidator(errorText: 'Required'),
            ]),
          ),
        ),
      ),
    );
  }

  TextEditingController commentcontroller = TextEditingController();
  late bool isloading = false;

  Future pickImagegallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImagecamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }


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
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
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
            child: SingleChildScrollView(
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
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return joinChallenge();
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Padding(padding: EdgeInsets.all(15)),
                            const Text(
                              'Load Progress Challenge',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: KPrimaryColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 150,
                              width: 150,
                              color: KPrimaryColor,
                              child: image != null
                                  ? Image.file(
                                File(image!.path), fit: BoxFit.cover,)
                                  : const Center(child: Text('No Image ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    pickImagegallery();
                                  },
                                  icon: const Icon(Icons.image),
                                  //icon data for elevated button
                                  label: Text("Gallery"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: KPrimaryColor), //label text
                                ),
                                const SizedBox(width: 20,),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    pickImagecamera();
                                  },
                                  icon: const Icon(Icons.camera_alt_rounded),
                                  //icon data for elevated button
                                  label: const Text("Camera"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: KPrimaryColor), //label text
                                ),

                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: _FormKey,
                              child: Column(
                                children: [
                                  inputField('Comment', commentcontroller),

                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if(commentcontroller.text.isNotEmpty){
                                  submit();
                                }else{
                                  var snackBar = SnackBar(
                                    /// need to set following properties for best effect of awesome_snackbar_content
                                    elevation: 0,
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    content: AwesomeSnackbarContent(
                                      title: 'yeah!',
                                      message: 'skine profile add successfuly!',
                                      contentType: ContentType.failure,
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }


                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 80),
                                  backgroundColor: KSecondaryColor,
                                  shape: const StadiumBorder(),
                                  elevation: 8,
                                  shadowColor: Colors.black87),
                              child: const Text(
                                'Load Progress Challenges',
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


 submit() async {


    var fullUrl =  'http://api.standard-beauty.afrixcel.co.za/api/save_challenges_progress/${UserData[0]['id']}/${widget.value}';
    var request = http.MultipartRequest('POST',Uri.parse(fullUrl) );
    request.fields['comment'] = commentcontroller.text;
    if(image!.path !=''){
      request.files.add(await http.MultipartFile.fromPath('picture',image!.path));
    }
    request.headers.addAll(
        {
          'Content-type' : 'application/json',
          'Accept' : 'application/json',
        }
    );
    var response = await request.send();
    if(response.statusCode == 200){
      var snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'yeah!',
          message: 'Challenge progress save successfully!!!!',
          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar);
    }else{
      var snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'yeah!',
          message: 'Challenge progress save failed!!!!',
          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar);
    }


  }
}