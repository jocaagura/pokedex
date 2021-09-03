import 'package:flutter_test/flutter_test.dart';

import '../../lib/blocs/bloc_central.dart';

void main() {
  /// shared preferences
  test('Save into shared preferences',()async{
    expect(await BlocCentral().saveIntoSharedPreferences("123456", 'Remolacha'), true);
    expect(await BlocCentral().getStringValue("123456"), "Remolacha");


    expect(await BlocCentral().saveIntoSharedPreferences("123456", 12345), true);
    expect(await BlocCentral().getIntValue("123456"), 12345);

    expect(await BlocCentral().saveIntoSharedPreferences("123456", ['Remolacha', 'true']), true);
    // expect(await BlocCentral().getListStringValue("123456"), ['Remolacha', 'true']);

    expect(await BlocCentral().saveIntoSharedPreferences("123456", ['Remolacha', true]), true);
    expect(await BlocCentral().getStringValue("123456"), '[Remolacha, true]');

    expect(await BlocCentral().saveIntoSharedPreferences("123456",
        {'Remolacha', true}), true);
    expect(await BlocCentral().getStringValue("123456"), '{Remolacha, true}');

    expect(await BlocCentral().saveIntoSharedPreferences("123456",
        {'Remolacha', 123456}), true);

    expect(await BlocCentral().saveIntoSharedPreferences("123456",
        1.253535), true);
    expect(await BlocCentral().getDoubleValue("123456"), 1.253535);
    expect(await BlocCentral().saveIntoSharedPreferences("123456",
        true), true);
    expect(await BlocCentral().getBooleanValue("123456"), true);
    expect(await BlocCentral().saveIntoSharedPreferences("123456",
        false), true);
    expect(await BlocCentral().getBooleanValue("123456"), false);





  });



  test('test valid url', () {
    expect(BlocCentral().validateUrl('https://anonimo.com.co'), true);
    expect(BlocCentral().validateUrl('http://anonimo.com.co'), true);
    expect(BlocCentral().validateUrl('https://www.anonimo.com.co'), true);
    expect(BlocCentral().validateUrl('http://www.anonimo.com.co'), true);
    expect(
        BlocCentral()
            .validateUrl('http://www.anonimo.com.co/shfkjhakjlghgdjfakghl'),
        true);
    expect(BlocCentral().validateUrl('https://localhost/'), false);
    expect(BlocCentral().validateUrl('192.168.190.2'), false);
    expect(BlocCentral().validateUrl('www.anonimo.com.co'), false);
    expect(BlocCentral().validateUrl('anonimo.com.co'), false);
    expect(BlocCentral().validateUrl(''), false);
  });

  test('test valid email', () {
    expect(BlocCentral().validateEmail('anonimo@anonimo.com.co'), true);
    expect(BlocCentral().validateEmail('anonimo@anonimo.com'), true);
    expect(BlocCentral().validateEmail('anonimo@anonimo.info'), true);
    expect(BlocCentral().validateEmail('anonimo@anonimo.co'), true);
    expect(BlocCentral().validateEmail('1234hola@anonimo.co'), true);
    expect(BlocCentral().validateEmail('1-anonimo@anonimo.com'), true);
    expect(BlocCentral().validateEmail('1_albert@anonimo.com.co'), true);

    expect(BlocCentral().validateEmail('anonimo.co'), false);
    expect(BlocCentral().validateEmail('a\$@anonimo.co'), false);
    expect(BlocCentral().validateEmail('#a@anonimo.co'), false);
    expect(BlocCentral().validateEmail(''), false);
  });

  group('httpRequests', (){
    test('request get query without parameters', ()async{
      expect(await BlocCentral().jsonGetRequestHttp(url: 'https://reqres.in/api/users', parameters: {'page':"1", "per_page":"12"}),
          isMap);
    });
  });

}
