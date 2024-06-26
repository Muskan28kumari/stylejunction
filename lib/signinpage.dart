import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylejunction/dashboard.dart';
import 'package:stylejunction/signuppage.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 225, 232),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  // Centered Logo
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'image/fashionlogo.png', // Replace with the path to your image asset
                        width: 350.0, // Set the width as needed
                        height: 250.0, // Set the height as needed
                      )),

                  SizedBox(height: 20.0), // Adjust the spacing as needed

                  //break
                  Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width:
                                  70.0, // Increase the size of the circular background as needed
                              height:
                                  70.0, // Increase the size of the circular background as needed
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .white, // Set the background color as needed
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person, // Replace with your person icon
                                  size: 36.0, // Set the size as needed
                                  color: Colors.red, // Set the color as needed
                                ),
                                Icon(
                                  Icons
                                      .arrow_forward, // Replace with your arrow icon
                                  size: 20.0, // Set the size as needed
                                  color:
                                      Colors.orange, // Set the color as needed
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0), // Adjust the spacing as needed

                  // "Enter phone number" input with received call icon
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: phoneNumberController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'[0-9]')), // Allow only numeric characters
                            ],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter phone number',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.wifi_calling_3_outlined,
                            color: Colors.grey,
                            // Replace with your received call icon
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement phone number verification logic and navigate to the OTP screen.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Text('Sign In'),
                  ),

                  SizedBox(height: 20.0),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text('Create New Account'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Implement "Terms" link logic here
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // "Skip" Button in Top-Right
            /*Positioned(
              top: 20.0,
              right: 20.0,
              child: TextButton(
                onPressed: () {
                  // Implement "Skip" button logic here
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.red, // Set the text color to red
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
