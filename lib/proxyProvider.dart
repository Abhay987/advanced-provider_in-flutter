import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class Greet extends ChangeNotifier{
  String greetings="Good Morning";
  void doGreet(String value){
    greetings=value;
    notifyListeners();
  }
}
class Dgreet{
  Greet _myGreet;
  Dgreet(this._myGreet);
  void doAnotherGreet(){
    _myGreet.doGreet("Good Night");
  }
}
class ProxyPrvdr extends StatelessWidget {
  const ProxyPrvdr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<Greet>(create: (context)=>Greet()),
      ProxyProvider<Greet,Dgreet>(update: (context,myGreet,  anotherModel) => Dgreet(myGreet)),
    ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Proxy Provider'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<Greet>(builder: (context,myGreet,child){
                  return ElevatedButton(onPressed: (){
                      myGreet.doGreet('Good Afternoon');
                  }, child: const Text('Greetings'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(15)
                  ),
                  );
                }),
                const SizedBox(height: 10),
                Consumer<Greet>(builder: (context,myGreet,_){
                  return Text(myGreet.greetings,style: const TextStyle(fontSize: 40,color: Colors.green),);
                }),
                const SizedBox(
                  height: 10,
                ),
                Consumer<Dgreet>(builder: (context,dgreet,_){
                  return ElevatedButton(onPressed: (){
                   dgreet.doAnotherGreet();
                  }, child: const Text('Another Greetings'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        padding: const EdgeInsets.all(15)
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

