import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FutPrvdr extends StatelessWidget {
  const FutPrvdr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyWish>(create: (context)=>MyWish(),
    child: const MaterialApp(
      home: AdvcdFut(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}
class MyWish extends ChangeNotifier{
  String greet="Good Morning";
  Future<void> doSome()async{
    await Future.delayed(const Duration(seconds: 1));
    if(greet=="Good Night")
      {
        greet="Good Morning";
      }
    else {
      greet="Good Night";
    }
      notifyListeners();
    debugPrint(greet);

  }
}
class AdvcdFut extends StatelessWidget {
  const AdvcdFut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Consumer<MyWish>(
                builder: (context,mywish,_){
                  return ElevatedButton(onPressed: (){
                    mywish.doSome();
                  }, child: const Text('Greeting',style: TextStyle(
                    fontSize: 20,
                  )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      padding: const EdgeInsets.all(15)
                    ),
                  );
                },
              ),
            const SizedBox(height: 40,),
           Consumer<MyWish>(
                  builder: (context,mywish,_){
                    return Text(mywish.greet,style: const TextStyle(color:Colors.green,fontSize: 30,wordSpacing: 20),);
                  },
                ),

          ],
        ),
      ),
    );
  }
}

