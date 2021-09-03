import 'package:test/test.dart';
import '../../lib/services/service_http.dart';

main(){
  test('request get query without parameters', ()async{
    expect(await ServiceHttp().jsonGetRequestHttp(url: 'https://reqres.in/api/users', parameters: {'page':"1", "per_page":"12"}),
         isMap);
  });


  test('request post query with parameters', ()async{
    expect(await ServiceHttp().jsonPostRequestHttp(url: 'https://reqres.in/api/users', parameters: {'name':"Prueba", "job":"leader"}),
         isMap);
  });


}