import 'package:flutter/material.dart';
import 'package:poc_firebase_analytics/analytics/analytics_enum.dart';
import 'package:poc_firebase_analytics/analytics/analytics_events.dart';
import 'package:poc_firebase_analytics/analytics/analytics_screen_enum.dart';
import 'package:poc_firebase_analytics/analytics/firebase_screen_observer.dart';
import 'package:poc_firebase_analytics/screen/firebase%20_analytics_screen.dart';
import 'package:poc_firebase_analytics/repo.dart';
import 'package:poc_firebase_analytics/utils/helper_methods.dart';
import 'package:poc_firebase_analytics/utils/text_style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with RouteAwareAnalytics {


    @override
  // TODO: implement route
  AnalyticsRoute get route =>AnalyticsRoute.example;
  

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();
  FocusNode buttonFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "login",
            style: CommonTextStyle.buttonTxt,
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(18),
            child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "email",
                      style: CommonTextStyle.normalTxt,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      ///validate email input field
                      validator: HelperMethods.isValidEmail,
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "enter email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      focusNode: emailFocus,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(passFocus);
                      },
                    ),
                    SizedBox(height: 10),
                    Text(
                      "password",
                      style: CommonTextStyle.normalTxt,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: HelperMethods.isValidPass,
                      controller: passController,
                      decoration: InputDecoration(
                        hintText: "enterpassword",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      focusNode: passFocus,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(buttonFocus);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  bool? isloginresult = await AuthRepo()
                      .loginUsingEmailAndPassword(
                          emailController.text, passController.text);
                  if (isloginresult == true) {
                    Map<String, dynamic> parameters = {
                      'user_id': "userId",
                    };
                    AnalyticsEvents.logEvent(EventName.loginEvent, parameters);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirebaseAnalyticsScreen()));
                  } else {
                    debugPrint("Error during login");
                  }
                  setState(() {
                    _isLoading = true;
                  });
                }
              },
              child: const Text("login"))
        ],
      ),
    );
  }


}
