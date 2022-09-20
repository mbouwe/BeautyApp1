import 'package:beautyapp/provider/google_sign_in.dart';
import 'package:beautyapp/screen/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screen/login/LoginScreen.dart';
import 'utils/constant.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:animated_background/animated_background.dart';
import 'package:page_transition/page_transition.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (contect) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Standard Beauty',
          theme: ThemeData(
            scaffoldBackgroundColor: KBackgroundColor,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: KPrimaryColor,
                ),
          ),
          debugShowCheckedModeBanner: false,
          home:  Splashscreen(),
        ),
      );
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);


  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: AnimatedBackground(
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
        child: Column(
          children: [
            Lottie.asset('Images/lottie.json'),
             SizedBox(
              height: 5,
            ),
             Text(
              'Standard.',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
             CircularProgressIndicator(
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ),
      backgroundColor: KBackgroundColor,
      nextScreen: _isloggedIn ? HomePage() : LoginScreen(),
      splashIconSize: 550,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
    );
  }
  bool _isloggedIn = false;
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }
  void _checkIfLoggedIn () async {
    SharedPreferences localsStorage = await SharedPreferences.getInstance();
    var token = localsStorage.getString('token');
    if(token!=null){
      _isloggedIn=true;
    }
  }
}


