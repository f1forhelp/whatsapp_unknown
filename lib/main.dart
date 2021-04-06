import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dimensions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: "+91");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions(context);
    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.boxWidth * 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.boxHeight * 10,
                ),
                FaIcon(
                  FontAwesomeIcons.whatsapp,
                  size: Dimensions.boxHeight * 10,
                  color: Colors.green,
                ),
                SizedBox(
                  height: Dimensions.boxHeight * 3,
                ),
                Text(
                  "Enter Your phone no along with country code to strat messaging on whatsapp without adding to contacts 🙂🙃.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Dimensions.boxHeight * 3,
                ),
                TextFormField(
                  controller: _textEditingController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.boxHeight * 5,
                ),
                GestureDetector(
                  onTap: () async {
                    var whatsappUrl =
                        "whatsapp://send?phone=${_textEditingController.text}";
                    if (await canLaunch(whatsappUrl)) {
                      await launch(whatsappUrl);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Unable To Open Whatsapp"),
                      ));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.green.shade800,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Add To WhatsApp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
