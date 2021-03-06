// ignore: unused_import
import 'dart:io' show Platform;


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dart_ipify/dart_ipify.dart';






Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyBQlxaOOmOAC7Obs28bA69zGIdSxCBTfkI",
      appId: "1:132062248422:android:8c7503ec54f489c78e2a27",
      databaseURL: "https://pvsk-buzzerapphandler-default-rtdb.europe-west1.firebasedatabase.app",
      messagingSenderId: "XXX",
      projectId: "pvsk-buzzerapphandler",
    ),
    
  );
  
  
  runApp(MaterialApp(home: MainPage()));
}

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
Future<AndroidDeviceInfo> androidDeviceInfo = deviceInfo.androidInfo; 
//String id =  DeviceInfoPlugin().deviceInfo as String;
//final ipv4 = Ipify.ipv4();

class MainPage extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  



  Future<String?> _getId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
  String? deviceId = await _getId();

  
}

  bool isBuzzerEnabled = true;

 

  @override
  Widget build(BuildContext context) {
    
Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }
    
    return MaterialApp(
      home: Scaffold(backgroundColor: Color.fromARGB(255, 30, 34, 41), 
      body:Column(
        
        

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
        
        
        
        Text('7b Klase', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'FuturaPT', fontSize: 50)), 
        Text('Points: Pubg Mobil', textAlign: TextAlign.center, style: TextStyle(color: Color.fromARGB(255, 106, 226, 37), fontFamily: 'FuturaPT', fontSize: 30)),
        Padding(
        padding: EdgeInsets.only(left: (00), right: 00, top: 100),
          child: ElevatedButton(style: (ElevatedButton.styleFrom(minimumSize: const Size(300, 300),  primary: Colors.red)), onPressed: isBuzzerEnabled
          ? () { (() => isBuzzerEnabled = false); DatabaseReference _testRef = FirebaseDatabase.instance.ref().child("test"); _testRef.set("CLASS 7b Klase BUZZED!"); }: null, child: const Text('')),
          
        ),
        Padding(
        padding: EdgeInsets.only(top: (80), left: (10)),
          child: TextButton(style:ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdminPage()),
            );
          }, child: Text('ADMIN PANEL'),),
        ),
      ],
      )
      
      


      ),
      
    );
  }

  
}

class AdminPage extends StatelessWidget{
final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
TextEditingController classController = new TextEditingController();


 String globalclassstring = 'Klasse be like'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 30, 34, 41),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        

        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: classController,
            decoration: const InputDecoration(
              fillColor: Color.fromARGB(255, 174, 178, 184), filled: true,
              border: UnderlineInputBorder(),
              labelText: 'Enter Class Name',
              
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: (15)),
          child: ElevatedButton(style: (ElevatedButton.styleFrom(primary: Colors.blueGrey)), onPressed: () {DatabaseReference _testRef = FirebaseDatabase.instance.ref('CLASS IDs').child(classController.text); _testRef.set(classController.text); }, child: Text('INPUT CLASS ID'),)
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OperatorPage()),
            );
          }
          ,
          child: const Text('Go-to Operator Panel(!)'),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          }
          ,
          child: const Text('Eu ko tu te dari? Ej atpaka??!!'),
          
        ),
        
        ]
      ),
    );
  }
}

class OperatorPage extends StatelessWidget{
final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color.fromARGB(255, 30, 34, 41),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
           Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
