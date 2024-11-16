import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:registration/widgets/logo.dart';
import 'package:registration/widgets/back_button.dart';

// The RegistrationScreen class serves as the main screen for user registration.
// It dynamically adjusts the layout and AppBar based on whether the app is being used on mobile or web.
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determines if the app is running on a web platform.
    bool isWeb = kIsWeb;

    return Scaffold(
      appBar:isWeb ? _buildWebAppBar(context) : _buildMobileAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isWeb ? _buildWebLayout(context) : _buildMobileLayout(context),
      ),
    );
  }

  // Builds the AppBar for web. 
  AppBar _buildWebAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 50, 109, 150),
      title: Logo(),
          centerTitle: false,
    );
  }

  // Builds the AppBar for mobile.
  AppBar _buildMobileAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 50, 109, 150),
      title: Row(
        children: [
        //Calls the BackButton and the Logo widget
        BackButtonWidget(),
        const SizedBox(width: 110),
        Logo()
          ],
      ),
    );
  }

  // Builds the web layout for the body content.
  Widget _buildWebLayout(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start ,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Register As",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, 
        ),
        ),
        const SizedBox(height: 30), 
        
        
        Expanded(
          // Creates a grid of registration options.
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: screenWidth/12,
            mainAxisSpacing: screenHeight/12,
            childAspectRatio: screenWidth / screenHeight,
            padding:  EdgeInsets.only(left:screenWidth/6,  right:screenWidth/6),
            
            children: [
              // Each grid item is built using the _buildOptionWeb method.
              _buildOptionWeb(context, "Patient/Member", "assets/patient.png", () {
                Navigator.pushNamed(context, '/patient_registration_screen');
              },requiresValidation: false),
              _buildOptionWeb(context, "Doctor", "assets/doctor.png", () {
                Navigator.pushNamed(context, '/doctor_registration_screen');
              }, requiresValidation: true),
              _buildOptionWeb(context, "Pharmacy", "assets/pharmacy.png", () {
                Navigator.pushNamed(context, '/pharmacy_registration_screen');
              }, requiresValidation: true),
              _buildOptionWeb(context, "Lab", "assets/microscope.png", () {
                Navigator.pushNamed(context, '/lab_registration_screen');
              }, requiresValidation: true),
            ],
          ),
        ),
      ],
        );
  }

  // Builds the mobile layout for the body content.
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start ,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Register As:",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center, 
        ),
        ),
        const SizedBox(height: 40), 
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40,
            childAspectRatio: 1.5,

            children: [
              // Each grid item is built using the _buildOptionMobile method.
              _buildOptionMobile(context, "Patient/Member", "assets/patient.png", () {
                Navigator.pushNamed(context, '/patient_registration_screen');
              },requiresValidation: false),
              _buildOptionMobile(context, "Doctor", "assets/doctor.png", () {
                Navigator.pushNamed(context, '/doctor_registration_screen');
              }, requiresValidation: true),
              _buildOptionMobile(context, "Pharmacy", "assets/pharmacy.png", () {
                Navigator.pushNamed(context, '/pharmacy_registration_screen');
              }, requiresValidation: true),
              _buildOptionMobile(context, "Lab", "assets/microscope.png", () {
                Navigator.pushNamed(context, '/lab_registration_screen');
              }, requiresValidation: true),
            ],
          ),
        ),
      ],
        );
  }

  // Builds a grid item for the web layout.          
  Widget _buildOptionWeb(BuildContext context, String title, String iconPath, VoidCallback onTap, {bool requiresValidation = false}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth / 4,
        height: screenHeight/4,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 50, 109, 150), width: 1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),  // Shadow color with transparency
              offset: Offset(0, 5),                 // Position the shadow
              blurRadius: 10,                       // Blurring for soft shadow
              spreadRadius: 1,                      // Spread to expand the shadow
            ),
        ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: screenWidth/12, height: screenHeight/12),
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth/50,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (requiresValidation)
               Text(
                "*Requires Validation*",
                style: TextStyle(
                  fontSize: screenWidth/85,
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Builds a grid item for the mobile layout.
  Widget _buildOptionMobile(BuildContext context, String title, String iconPath, VoidCallback onTap, {bool requiresValidation = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 50, 109, 150), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 50, height: 50),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (requiresValidation)
              const Text(
                "*Requires Validation*",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
