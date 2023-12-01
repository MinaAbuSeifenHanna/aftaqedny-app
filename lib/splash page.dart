import 'package:flutter/material.dart';
import 'package:valligeapp/region/region%20screen.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  _SplashPageState createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  Future.delayed(const Duration(seconds: 4), () {
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => const RegionScreen()),
     );
   });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation:  0.0 ,
      ),// Set the background color as needed
      body: const Padding(
        padding:  EdgeInsets.all(15.0),
        child:  Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipOval(child: Image(image: AssetImage('assets/images/logo.png'))),
              Text('أفتقدني',
              style: TextStyle(
                color: Colors.black,
                fontSize: 70 ,
                fontWeight: FontWeight.bold ,
              ),
              ),
              Card(
                child: ListTile(
                  leading:CircleAvatar(
                    backgroundImage:  AssetImage('assets/images/me.png'),
                    radius: 30,
                  ),
                  title: Text('ENG.Mina AbuSeifen Hanna'),
                  subtitle : Text('Programmer of this application  \nMobile developer by Flutter\n01282017089© ') ,
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}

