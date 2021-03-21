import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inspeech/constants/LoadingAnimation.dart';
import 'package:inspeech/constants/background-painter.dart';
import 'package:inspeech/constants/colors.dart';
import 'package:inspeech/constants/grey-painter.dart';
import 'package:inspeech/onboarding/signin.dart';
import 'package:inspeech/screens/speech/speech-detail.dart';
import 'package:inspeech/services/auth.dart';
import 'package:inspeech/services/database.dart';
import 'package:inspeech/services/helperfunctions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neumorphic/neumorphic.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

String _username = "";

class _DashboardState extends State<Dashboard> {

  QuerySnapshot searchSnapshot;
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  getUserInfo() async{
    _username = await HelperFunctions.getUserNameSharedPreference();
    initiateSearch();
  }

  initiateSearch() {
    databaseMethods.getSpeeches(_username).then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  Widget SpeechList() {
    return searchSnapshot.docs.length != 0
        ? ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: searchSnapshot.docs.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SpeechTile(
            name: searchSnapshot.docs[index].data()["name"],
            content: searchSnapshot.docs[index].data()["content"],
          );
        })
        : Align(
      alignment: Alignment.topCenter,
      child: noSpeeches(),
    );
  }

  Widget SpeechTile({String name, String content}) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SpeechDetail(name, content)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        padding: EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 12),
        decoration: BoxDecoration(
          color: lightbackground,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[500],
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0, -4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 225,
              child: Hero(
                tag: name,
                child: Text(name, style: TextStyle(
                  decoration: TextDecoration.none,
                  color: secondaryText,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.lightBlue[600],
                      Colors.lightBlue[500],
                      Colors.lightBlue[400],
                      Colors.lightBlue[300],
                    ],
                    stops: [
                      0, 0.1, 0.3, 1
                    ]
                ),

              ),
              child: Text("Review", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400
              ),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    getUserInfo();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightbackground,
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: CustomPaint(
              painter: GreyPainter(),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome Back,", style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: darktext,
                ),),
                Text(_username, style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 27,
                  color: darktext,
                ),),
              ],
            ),
          ),
          Positioned(
              top: 45,
              right: 50,
              child: Container(
                //padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 6),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){
                    authMethods.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  icon: Icon(MdiIcons.logout, color: darktext, size: 23,),
                ),
              )
          ),
          Positioned(
            top: 140,
            left: 0,
            child: Stack(
              children: [
                Container(
                  height: 55,
                  width: size.width*0.75,
                  decoration: BoxDecoration(
                    color: paletteBlue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(17),
                        bottomRight: Radius.circular(17)),
                  ),
                ),
                Container(
                  height: 55,
                  width: size.width*0.705,
                  child: CustomPaint(
                    painter: BluePainter(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 5),
                  height: 55,
                  width: size.width*0.75,
                  decoration: BoxDecoration(
                    //color: Colors.redAccent
                  ),
                  child: Center(
                    child: Text("Speech Dashboard", style: TextStyle(
                        fontFamily: "OpenSansBold",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 185,
            child: Container(
              width: size.width,
              child: searchSnapshot == null ? LoadingProperties() : SpeechList(),
            ),
          ),
        ],
      ),
    );
  }

  noSpeeches(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 160,
                width: 23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    bottomLeft: Radius.circular(17),
                  ),
                  color: blueText,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ],
                )
            ),
            Container(
                height: 160,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(17),
                    bottomRight: Radius.circular(17),
                  ),
                  color: lightbackground,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                  ],
                ),
                child: Icon(Icons.cancel_outlined,
                  color: secondaryText.withOpacity(0.8),
                  size: 80,
                )
            ),
          ],
        ),
        SizedBox(height: 20,),
        Text("No Speeches", style: TextStyle(
          color: secondaryText,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),)
      ],
    );
  }
}

class LoadingProperties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.grey[300],
      child: Align(
        alignment: Alignment.bottomCenter,
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(blueText),
        ),
      ),
    );
  }
}