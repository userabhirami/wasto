import 'package:flutter/material.dart';
import 'package:wasto/utils/colorConstant.dart';

class TermsAndCondtions extends StatelessWidget {
  const TermsAndCondtions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions"),
        backgroundColor: ColorConstant.green,
        titleTextStyle: TextStyle(
          color: ColorConstant.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Text(
            "Terms and Conditions for Waste Management App \n 1. Acceptance of Terms \n By accessing or using the Waste Management App, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with any part of these terms, you may not use the app. \n 2. User Responsibilities \n You are responsible for the proper disposal of waste in accordance with local regulations. The app provides information and tools, but ultimate responsibility lies with the user. \n 3. Data Privacy \n We collect and process user data in accordance with our Privacy Policy. By using the app, you consent to the collection and use of your information as described in the Privacy Policy. \n 4. App Content \n All content provided by the app is for informational purposes only. We do not guarantee the accuracy, completeness, or usefulness of any information provided. \n 5. Prohibited Activities \n Users are prohibited from engaging in any unlawful or harmful activities while using the app. This includes but is not limited to the dissemination of harmful content, hacking, or any other illegal activities. \n 6. Intellectual Property \n The app and its original content, features, and functionality are owned by our company and are protected by international copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws. \n 7. Updates and Changes \n We reserve the right to modify or update these Terms and Conditions at any time without prior notice. Continued use of the app after any changes shall constitute your consent to such changes. \n 8. Termination \n We reserve the right to terminate or suspend your access to the app immediately, without prior notice or liability, for any reason, including breach of these Terms and Conditions. \n 9. Limitation of Liability \n In no event shall our company be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly. \n 10. Governing Law \n These Terms and Conditions shall be governed by and construed in accordance with the laws of our jurisdiction, without regard to its conflict of law principles. \n By using the Waste Management App, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
