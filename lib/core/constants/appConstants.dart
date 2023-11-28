import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newsAPIBaseURL = 'https://newsapi.org/v2';
String newsAPIKey = dotenv.env['NEWS_API_KEY']!;
const String countryQuery = 'us';
const String categoryQuery = 'general';
DateTime now = DateTime.now();
const String kDefaultImage =
    "https://www.google.com/search?q=default+image&client=firefox-b-d&sxsrf=APq-WBskmtr-ix6NUAqqiHFNpsJX6JSOTg:1650026644151&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjEi_qfjJb3AhXvQd8KHd02BKUQ_AUoAXoECAEQAw#imgrc=A0pMe2lq2NT_jM";
const String curriculumVitaeLink =
    "https://syxkqmrzldbpptxswhpf.supabase.co/storage/v1/object/public/files/Powell-CV.pdf";
const String linkedInLink = "https://www.linkedin.com/in/diriangen-powell/";
const String githubLink = "https://github.com/iansstuff15/the-obelisk";
const String myPhone = "09604471706";
const String myEmail = "dlpowell35@gmail.com";
