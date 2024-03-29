import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stylejunction/dashboard.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  int remainingTime = 60; // Initial time in seconds
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    startCountdown(); // Start the countdown timer when the screen is initialized
  }

  void startCountdown() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel(); // Cancel the timer when time is up
        }
      });
    });
  }

  @override
  void dispose() {
    countdownTimer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

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
                  // Centered Logo
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'image/fashionlogo.png', // Replace with the path to your image asset
                      width: 450.0, // Set the width as needed
                      height: 250.0, // Set the height as needed
                    ),
                  ),

                  SizedBox(height: 10.0), // Adjust the spacing as needed

                  // Divider with Person and Arrow Icon
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
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.lock_outline,
                                  size: 36.0,
                                  color: Colors.black,
                                ),
                                Icon(
                                  Icons.password,
                                  size: 20.0,
                                  color: Colors.black,
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

                  SizedBox(height: 15.0), // Add spacing

                  // OTP input field
                  PinCodeTextField(
                    appContext: context,
                    length: 5,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onCompleted: (value) {
                      // Called when the user has completed entering the OTP
                      // You can implement OTP verification logic here
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      activeColor: Colors.black,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.black,
                    ),
                    autoFocus:
                        true, // This will automatically focus the first digit
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onChanged: (value) {
                      // Handle OTP input as it changes
                    },
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // You can adjust this as needed
                  ),

                  SizedBox(height: 5.0), // Add spacing

                  // Countdown Timer Display
                  Center(
                    child: Text(
                      'Resend code in 00:$remainingTime', // Display remaining time
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  // Continue button
                  ElevatedButton(
                    onPressed: () {
                      // Implement OTP verification logic here
                      // If valid OTP, navigate to the dashboard
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Text('Continue'),
                  ),

                  SizedBox(height: 20.0), // Add spacing

                  // Footer text
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('By continuing, you agree to our'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Implement "Terms" link logic here
                            },
                            child: Text('Terms & Conditions'),
                          ),
                          Text('and'),
                          TextButton(
                            onPressed: () {
                              // Implement "Privacy Policy" link logic here
                            },
                            child: Text('Privacy Policy'),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            // "Skip" Button in Top-Right
            /* Positioned(
              top: 20.0,
              right: 20.0,
              child: TextButton(
                onPressed: () {
                  // Implement "Skip" button logic here
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.red,
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
