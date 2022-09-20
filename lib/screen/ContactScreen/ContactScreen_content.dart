import 'package:animated_background/animated_background.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
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
          padding: EdgeInsets.only(top: 5, left: 10, right: 10),
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

                    const SizedBox(
                      height: 10,
                    ),
                    // User card

                    SettingsGroup(
                      settingsGroupTitle: "Contact",
                      settingsGroupTitleStyle: const TextStyle(
                          color: KPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      items: [
                        SettingsItem(
                          onTap: () {
                            _launchUrl2();
                          },
                          icons: Icons.email,
                          iconStyle: IconStyle(
                            backgroundColor: Colors.pinkAccent,
                          ),
                          title: 'Email',
                          subtitle: "info@standard-beauty.co.za",
                          titleStyle: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitleStyle: TextStyle(
                            color: KPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SettingsItem(
                          onTap: () {
                            _launchUrl3();
                          },
                          icons: Icons.phone,
                          iconStyle: IconStyle(
                            iconsColor: Colors.white,
                            backgroundColor: Colors.pinkAccent,
                          ),
                          title: 'Phone Number',
                          subtitle: "+27 (63) 587-2734",
                          titleStyle: TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitleStyle: TextStyle(
                            color: KPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    // You can add a settings title
                    SettingsGroup(
                      settingsGroupTitle: "Social Network",
                      settingsGroupTitleStyle: TextStyle(
                          color: KPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      items: [
                        SettingsItem(
                          onTap: () {
                            _launchUrl();
                          },
                          icons: FontAwesomeIcons.instagram,
                          iconStyle:
                              IconStyle(backgroundColor: Colors.pinkAccent),
                          title: "Instagram",
                          subtitle: 'https://instagram.com/standard_beauty',
                          titleStyle: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitleStyle: const TextStyle(
                            color: KPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SettingsItem(
                          onTap: () {
                            _launchUrl1();
                          },
                          icons: FontAwesomeIcons.globe,
                          iconStyle:
                              IconStyle(backgroundColor: Colors.pinkAccent),
                          title: "WebSite",
                          subtitle: 'https://standard-beauty.co.za/',
                          titleStyle: const TextStyle(
                            color: Colors.pinkAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitleStyle: const TextStyle(
                            color: KPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
