import 'package:analog_css/src/template_parser.dart';
import 'package:analog_css/src/generator.dart';
import 'package:analog_css/src/markup_parser.dart';
import 'package:analog_css/src/template_class.dart';

void main() async {
  List<String> files = ['index.html'];
  List<String> inputCssFiles = ['input.scss'];

  while (true) {
    List<String> userClassNames = getClassesFromFiles(files);

    List<TemplateClass> templateClasses = TemplateParser().getTemplateClassesFromFiles(inputCssFiles);
    
    for (String userClass in userClassNames) {
        for (TemplateClass templateClass in templateClasses) {
          Generator generator = Generator(templateClass);

          List<String> matchedClasses = generator.findMatchingCssClasses(userClassNames);
          for (String _class in matchedClasses) {
            print(generator.generateAnalogClass(_class));
          }
        }
    }
    
    await Future.delayed(Duration(seconds: 1));
  }
  
}