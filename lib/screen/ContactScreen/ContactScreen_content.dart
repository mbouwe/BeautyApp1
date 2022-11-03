import 'package:animated_background/animated_background.dart';
//import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:beautyapp/screen/Navigator/Drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../utils/constant.dart';

class ContactScreenContent extends StatefulWidget {
  const ContactScreenContent({Key? key}) : super(key: key);

  @override
  State<ContactScreenContent> createState() => _ContactScreenContentState();
}

class _ContactScreenContentState extends State<ContactScreenContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Contact Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const MultiDrawer(),
      body: const contact(),
    );
  }
}

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
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
        child: ListView(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          children: [
            Container(
              height: 700,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('Images/logo.jpeg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Beauty, cosmetics and care',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const Text(
                            'Affordable high-quality skincare that works',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          const Text(
                            'Organic, fragrance-free,#crueltyfree',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                          const Text(
                            '@superbalist @weare_egg @takealotcom',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ],
                      ),
                    ),

                    const Divider(
                      height: 10,
                      color: KPrimaryColor,
                      thickness: 2,
                    ),
                    Text(
                      'Contact',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        height: 160,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.email,
                                        size: 28,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text('info@standard-beauty.co.za',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: KPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(right: 5.0, left: 25),
                                  child: IconButton(
                                    onPressed: _launchUrl2,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: KPrimaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        Icons.phone,
                                        size: 28,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Phone Number',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text('+27 (63) 587-2734',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: KPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(right: 5.0, left: 80),
                                  child: IconButton(
                                    onPressed: _launchUrl3,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: KPrimaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Social Network',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        height: 160,
                        width: 300,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        FontAwesomeIcons.instagram,
                                        size: 28,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Instagram',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                        'https://instagram.com/standard_beauty',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: KPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only(right: 5.0, left: 25),
                                  child: IconButton(
                                    onPressed: _launchUrl,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: KPrimaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Divider(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: const Icon(
                                        FontAwesomeIcons.globe,
                                        size: 28,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'WebSite',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.pink,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text('https://standard-beauty.co.za/',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: KPrimaryColor,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.only( left: 80),
                                  child: IconButton(
                                    onPressed: _launchUrl1,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: KPrimaryColor,
                                    ),
                                    alignment: AlignmentDirectional.centerEnd,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _launchUrl() async {
  final Uri _url = Uri.parse('https://instagram.com/standard_beauty');

  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

void _launchUrl1() async {
  final Uri _url = Uri.parse('https://standard-beauty.co.za/');

  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

void _launchUrl2() async {
  final Uri _url = Uri.parse('mailto:info@standard-beauty.co.za');

  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

void _launchUrl3() async {
  final Uri _url = Uri.parse('tel:+27 (63) 587-2734');

  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
