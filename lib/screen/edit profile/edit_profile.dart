import 'dart:convert';
import 'dart:io';
import 'package:animated_background/animated_background.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:beautyapp/api/api.dart';
import 'package:beautyapp/screen/edit%20profile/medication.dart';
import 'package:beautyapp/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import '../../utils/constant.dart';
import '../center_widget/center_widget.dart';

class edit_profil extends StatefulWidget {
  edit_profil({Key? key}) : super(key: key);

  @override
  State<edit_profil> createState() => _edit_profilState();
}

class _edit_profilState extends State<edit_profil>
    with TickerProviderStateMixin {
  var UserData;
  var long,data,taille;
  int? long1=0;
  var name, surname, address, phone, email;

  Widget inputField(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
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

  Widget inputField2(String hint, IconData iconData, TextEditingController controller) {
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

            ]),
          ),
        ),
      ),
    );
  }

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

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  late String text ='';

  void initState() {
    _getData();
    emailController = TextEditingController(text:UserData[0]['email']);
    nameController = TextEditingController(text:UserData[0]['firstname']);
    surnameController = TextEditingController(text:UserData[0]['surname']);
    addressController = TextEditingController(text:UserData[0]['address']);
    phoneController = TextEditingController(text:UserData[0]['phone']);
    super.initState();
  }

  void _getData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userjson = localStorage.getString('contact');
    var contact = json.decode(userjson!);
    setState(() {
      UserData = contact;
    });
    long = UserData[0]['id'];
    _getmedication();
  }

  void _getmedication() async{
    var res = await CallApi().getData('get_medication/${long}');
    var body = json.decode(res.body);
    if(body['success']==true){
      setState(() {
        data = body;
        taille = data['contact']['medication'];
        var i=0;
        for(var ted in taille){
          i++;
        }
        long1 = i;

      });
    }

  }


  bool isLoading = false;
  bool pick = false;

  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    _pickedFile =
        (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile?;
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
        pick = true;
      });
    }
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
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(
                  top: 30, left: 5, right: 5, bottom: 10),
              children: [
                Container(
                  child: Row(children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return HomePage();
                        }));
                      },
                      color: Colors.pink,
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: KPrimaryColor),
                    )
                  ]),
                ),
                Container(
                  height: 720,
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(
                          top: 5, left: 10, right: 10, bottom: 100),
                      children: [
                        Stack(
                            children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: KPrimaryColor,
                              radius: 70,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.all(0), // Border radius
                                  child: Container(
                                    // Border width
                                    decoration: const BoxDecoration(
                                        color: KPrimaryColor,
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                      child: SizedBox.fromSize(
                                        size:
                                            const Size.fromRadius(66), // Image radius
                                        child: Container(
                                          decoration:  const BoxDecoration(
                                            shape:BoxShape.circle ,
                                            image: DecorationImage(
                                                image: NetworkImage('http://standard-beauty.afrixcel.co.za/storage/app/customer/images/WhatsApp%20Image%202022-08-30%20at%204.06.12%20PM-1663790574.jpeg')
                                            )
                                          ),
                                        )
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 190,
                            child: IconButton(
                              onPressed: () {
                                _pickImage();
                              },
                              icon: const Icon(Icons.camera_alt_rounded),
                              color: Colors.black,
                              iconSize: 40,
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 20,
                        ),

                        Container(
                          height: 500,
                          width: 200,
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    'Email',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor,
                                        fontSize: 16),
                                  ),
                                ),
                                inputField(
                                    UserData[0]['email'] != null
                                        ? '${UserData[0]['email']}'
                                        : '',
                                    Icons.mail_outline,
                                    emailController),
                                const Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    'Firstname',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor,
                                        fontSize: 18),
                                  ),
                                ),
                                inputField(
                                    UserData[0]['firstname'] != null
                                        ? '${UserData[0]['firstname']}'
                                        : '',
                                    Icons.person,
                                    nameController),
                                const Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    'Surname',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor,
                                        fontSize: 18),
                                  ),
                                ),
                                inputField(
                                    UserData[0]['surname'] != null
                                        ? '${UserData[0]['surname']}'
                                        : '',
                                    Icons.person,
                                    surnameController),
                                const Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    'phone Number',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor,
                                        fontSize: 18),
                                  ),
                                ),
                                inputField(
                                    UserData[0]['cell_number'] != null
                                        ? '${UserData[0]['cell_number']}'
                                        : '',
                                    Icons.phone,
                                    phoneController),
                                const Padding(
                                  padding: EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    'Address',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: KPrimaryColor,
                                        fontSize: 18),
                                  ),
                                ),
                                inputField(
                                    UserData[0]['address'] != null
                                        ? '${UserData[0]['address']}'
                                        : '',
                                    Icons.phone,
                                    addressController),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 80.0,right: 80),
                          child: ElevatedButton(
                            onPressed: () {
                              registerSubmit();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: KSecondaryColor,
                                shape: const StadiumBorder(),
                                elevation: 8,
                                shadowColor: Colors.black87),
                            child: const Text(
                              'Edit profile',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                             Text('On Medication',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: KPrimaryColor),),

                            ]),
                        const SizedBox(height: 20,),

                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          height: 180,
                          width: 200,
                          decoration: BoxDecoration(
                              color: KPrimaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const SizedBox(height: 10,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(

                                  children:  [
                                    const SizedBox(height: 20,),
                                    for (var j=0;j<long1!;j++ )
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Card(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Padding(
                                                padding: const EdgeInsets.all( 12.0),
                                                child: Text(data['contact']['medication'][j]['medication'],style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),),
                                              ),
                                              IconButton(
                                                  onPressed: () async {
                                                    var res = await CallApi().delete('delete_medication/}');
                                                    var body = json.decode(res.body);
                                                    if(body['success']==true){
                                                      var snackBar = SnackBar(
                                                        /// need to set following properties for best effect of awesome_snackbar_content
                                                        elevation: 0,
                                                        behavior: SnackBarBehavior.floating,
                                                        backgroundColor: Colors.transparent,
                                                        content: AwesomeSnackbarContent(
                                                          title: 'yeah!',
                                                          message:
                                                          'medication delete successfuil !',

                                                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                                          contentType: ContentType.success,
                                                        ),
                                                      );
                                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                      Navigator.pop(context);
                                                    }

                                                  }, icon: const Icon(Icons.delete,color: Colors.pink,))
                                            ],
                                          ),
                                        ),
                                      ),



                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 120),
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (BuildContext context) {
                                          return Medication();
                                        }));

                                  },
                                  label: const Text('Add Medication'),
                                  icon: const Icon(Icons.add),
                                  backgroundColor: Colors.pink,

                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  registerSubmit() async {


      var fullUrl =  'http://api.standard-beauty.afrixcel.co.za/api/update_contacts/${UserData[0]['id']}';
      var request = http.MultipartRequest('PATCH',Uri.parse(fullUrl) );
      request.fields['firstname'] = nameController.text;
      request.fields['surname'] = surnameController.text;
      request.fields['address'] = addressController.text;
      request.fields['cell_number'] = phoneController.text;
      if(_image!.path !=''){
        request.files.add(await http.MultipartFile.fromPath('picture',_image!.path));
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
            message: 'edit profile successfully!!!!',
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
            message: 'Edit profile failed!!!!',
            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
      }


    }



  }

