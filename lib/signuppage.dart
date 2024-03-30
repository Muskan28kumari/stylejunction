import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stylejunction/otppage.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: '91',
      countryCode: 'IN',
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'India',
      example: 'India',
      displayName: 'India',
      displayNameNoCountryCode: 'IN',
      e164Key: '');

  @override
  Widget build(BuildContext context) {
    //for number to be in correct ord er
    phoneNumberController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneNumberController.text.length));
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
                    //padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            controller: phoneNumberController,
                            onChanged: (value) {
                              setState(() {
                                phoneNumberController.text = value;
                              });
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'[0-9]')), // Allow only numeric characters
                            ],
                            keyboardType: TextInputType.phone,
                            cursorColor: Colors.amber, //for color of the cursor
                            decoration: InputDecoration(
                                hintText: 'Enter phone number',
                                hintStyle: TextStyle(fontSize: 15),
                                //border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                ), // Outline InputBorder

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black12),
                                ), // OutlineInputBorder

                                prefixIcon: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () {
                                      showCountryPicker(
                                          context: context,
                                          countryListTheme:
                                              const CountryListThemeData(
                                                  bottomSheetHeight: 550),
                                          onSelect: (value) {
                                            setState(() {
                                              selectedCountry = value;
                                            });
                                          });
                                    },
                                    child: Text(
                                      "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                suffixIcon: phoneNumberController.text.length >
                                        9
                                    ? Container(
                                        padding: EdgeInsets.all(8),
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green), // BoxDecorat

                                        child: const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 20,
                                        ), // Icon
                                      )
                                    : Container(
                                        padding: const EdgeInsets.all(12.0),
                                        child: const Icon(
                                          Icons.wifi_calling_3_outlined,
                                          color: Colors.grey,
                                          // Replace with your received call icon
                                          size: 24.0,
                                        ),
                                      )
                                //sffixIcon: phone
                                ),
                          ),
                        ),
                        /*Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.wifi_calling_3_outlined,
                            color: Colors.grey,
                            // Replace with your received call icon
                            size: 24.0,
                          ),
                        ),*/
                      ],
                    ),
                  ),

                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Implement phone number verification logic and navigate to the OTP screen.
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpScreen()));
                    },
                    child: Text('Continue'),
                  ),

                  SizedBox(height: 20.0),
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
