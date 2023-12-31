import 'package:flutter/material.dart';
import 'package:ironsource_mediation/ironsource_mediation.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:weathery/localValues.dart';
import 'package:weathery/semiWidgets.dart';
import 'themeData.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool morningSaved = false;
  bool noonSaved = false;
  bool nightSaved = false;
  NotificationSettings carrierObj = NotificationSettings();

  @override
  initState() {
    super.initState();
    _init();
  }

  _init() async {
    await carrierObj.initPrefObj();
    setState(() {
      morningSaved = carrierObj.getMorningSavedStatus();
      noonSaved = carrierObj.getNoonSavedStatus();
      nightSaved = carrierObj.getNightSavedStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    IronSource.displayBanner();
    return Scaffold(
      drawer: const SideNavBar(),
      appBar: AppBar(
        titleTextStyle: headingStyle.copyWith(fontSize: 25),
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: NoGlowScrollBehaviour(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Notification Settings",
                  style: headingStyle.copyWith(fontSize: 26),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Select when you need weather update notifications to be delivered :",
                  style: captionStyle.copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 12.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Morning Updates",
                          style: headingStyle.copyWith(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          "Triggered at 06:30 AM Daily",
                          style: captionStyle.copyWith(fontSize: 17),
                        ),
                      ],
                    ),
                    Switch(
                      value: morningSaved,
                      activeColor: buttonColor,
                      onChanged: (value) async {
                        carrierObj.setMorningStatus(value);
                        setState(() {
                          morningSaved = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Noon Updates",
                          style: headingStyle.copyWith(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          "Triggered at 12:30 PM Daily",
                          style: captionStyle.copyWith(fontSize: 17),
                        ),
                      ],
                    ),
                    Switch(
                      value: noonSaved,
                      activeColor: buttonColor,
                      onChanged: (value) async {
                        carrierObj.setNoonStatus(value);
                        setState(() {
                          noonSaved = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Night Updates",
                          style: headingStyle.copyWith(fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          "Triggered at 08:00 PM Daily",
                          style: captionStyle.copyWith(fontSize: 17),
                        ),
                      ],
                    ),
                    Switch(
                      value: nightSaved,
                      activeColor: buttonColor,
                      onChanged: (value) async {
                        carrierObj.setNightStatus(value);
                        setState(() {
                          nightSaved = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
