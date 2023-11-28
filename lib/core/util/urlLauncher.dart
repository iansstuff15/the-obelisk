import 'package:the_obelisk/core/constants/appConstants.dart';
import 'package:url_launcher/url_launcher.dart';

class Launch {
  static void web({required String url}) async {
    Uri parsedUrl = Uri(
      scheme: 'mailto',
      path: myEmail,
      queryParameters: {
        'subject': "Feedback from the obelisk app",
        'body': "body here",
      },
    );
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void email() async {
    final Uri emailUri = Uri.parse('tel:${myPhone}');
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch Phone';
    }
  }

  static void phone() async {
    final Uri phoneUri = Uri.parse('tel:${myPhone}');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch Phone';
    }
  }

  static void sms() async {
    final Uri smsUri = Uri.parse('sms:${myPhone}?body:"message here"');
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch SMS';
    }
  }
}
