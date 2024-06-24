import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'dart:ui';

void main() {
  runApp(CekKhodamApp());
}

class CekKhodamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cek Khodam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/macan.png',
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: Text(
              'Cek Khodam',
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'Pacifico',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController _nameController = TextEditingController();
  String _khodam = '';
  bool _isLoading = false;
  bool _hasChecked = false;
  final List<String> _khodamList = [
    'Ikan Nemo', 'Kucing', 'Anjing', 'Rusdi', 'Ban Dalam',
    'Oli Gardan', 'Oli Samping', 'Ambatron', 'Trenggiling', 'Tikus','Bagas Drible','Beruang Drible','Messi',
    'Ronaldo','Mudryk','Antony','Setan Merah','Beruang seccond choice','Ambatukam','Suharto','Putin','donald trump','Macan Filipina','Bakwan Jagung'
    'Tianmetal','Icikiwir','Albert Einsten','Reza Arap','Anang & Friends','Atta','Kobo Kanaeru','Pace Yunus','BEM UI','Tandon Air','MotherBoard','Rel Kereta',
    'Odading','Teh Poci','Lalapan','Nikola Tesla','Mark Zuckerberg','Uni Bakwan','Kak Gem','Ferdy Sambo','Marselino','Mario Dandy','Fiersa Bersari','Kopling','RX King',
    'Ban Luar','Mio Mirza','Gojo Satoru','Sakura','Roti O stasiun Lempuyangan','Aspal tol Cipularang','Si Imut','Buaya Darat','Panda Second Choice','Alok','Layla','Miya','Nahida',
    'Aqua','Cilok','Farhan Kebab','Rehan wangsaf','Cilok','Siomay','Biawak','Tuyul','Miaw Aug','Windah Basudara','Cireng','Ojol','Mas Fuad','Jokowi','Gibran','Kaesang','Ganjar','Anis','Amien Rais',
    'Tahu Bulat','Antony Gasing','El Dear God','Real Madrid','Spatula','Gorengan','Cicak','Kaori','Sule','KKB','OPM','Mas Wiranto','Tegar Bejir','Zeus','Rafael struik','Jay Idzes','Ernando','Braithwaite','Alpard','Mayor Teddy',
    'Telur dadar','Jarwo','Sopo','Denis','Dontol','Kemaluan Pria','Kanjut Badag','Tobrut','Ceker Babat','Rohingnya','Bung Towel','Coach Justin','Wilie Salim','Baim Wong','Harimau Sumatra','Prabowo','Kim Jong Un','Megawati','Puan Maharani',
    'Roger Sumatra','Naga Putih','Mas Berto','Naruto','Sasuke','Baut','Pelek','Obeng','Orang Hytam','Ishowspeed','Orang Sigma','Thomas Shelby','Plafon','Septic Tank','Kairi','Harddisk','Krisna','Masha & the Bear','Plankton','Fajar skali','Fajar Sadboy','Kipli',
    'Madun','Ronaldowati','Ace','Optimus Prime','Erik Ten Hag','MU','Chelsea','Barcelona','Seblak','Naga Hytam','Tikus Got','Wajan','Panci','Helm Bogo','Ahok','Wibu','Hu Tao','Furina','Freya','Zee','DN Aidit','Hirohito','Evos Kak Gem','Adolf Hitler','Ivan Gunawan','Ragil',
    'Luffy','Big Mom','Kaporit','Formalin','Kulkas LG 2 Pintu','Sigit Rendang','Kumalala','Garox','Gak Punya khodam','Senku','Lord Rangga','STY','Saman brembo','Vixion','Dedeinoen','Bobon Santoso','Tanboy kun','Taylor swift','Xi Jinping','Sukuna','Tandon Air','Pragos','Minyak Jelantah',
    'Astolfo drible','Femboy','Lucinta Luna','Radiator','Jeroan','Martabak','Sate Ayam','Rendang','Ayam Sayur','Ayam Jantan','Ayam Betina','Nathan tjoe a on','Telur Mata sapi','lumpia','Mayones','Kraby Patty','Chum Bucket','Max Varstappen','Katak bhizer','Javier Story','Gilga','Sate Kambing',
    'Tang','Kunci Inggris','Standar','Aki','Tzy','꧁ℭ℟Åℤ¥༒₭ÏḼḼ℥℟꧂','Elon Musk','Mobile Legend','Cap Badak','Pertamax','Pertalite','Solar','Pertamax Turbo','Kopikap','Bakso beranak','Mie Gacoan','udang','Hercules','Super Dede','Jawa','pace','Madura','Keris','Celurit','Sekop','Linggis','Cipung','Rafathar',
    'Timoty Ronald','Kripto','Dadang','Boboboy','Adudu','Sotong','Kebab Puki','Suki','NPC','GBK','Jembatan Suramadu','Green flag','Red flag','Burung Kuntul','Burung Unta','Biawak','Kuman','Hengker','Bocil Free fire','Shiva','Ikan Asin','Ikan tenggiri','acul'
    
  ];

  void _generateKhodam() {
    if (_nameController.text.isEmpty) {
      _showAlertDialog('Anda belum memasukkan nama');
      return;
    }
    setState(() {
      _isLoading = true;
      _hasChecked = true;
    });
    Timer(Duration(seconds: 3), () {
      final random = Random();
      final khodam = _khodamList[random.nextInt(_khodamList.length)];
      setState(() {
        _khodam = khodam;
        _isLoading = false;
      });
    });
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Peringatan'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _reset() {
    setState(() {
      _nameController.clear();
      _khodam = '';
      _hasChecked = false;
    });
  }

  Future<void> _shareKhodam() async {
    final text = 'Khodam yang ada di dalam dirimu adalah: $_khodam';
    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Cek Khodam', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35)),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/macan.png', // Add your background image
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Cek khodam yang ada di dalam diri kamu',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  if (!_hasChecked)
                    Card(
                      color: Colors.white.withOpacity(0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Tulis nama kamu di sini',
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            ElevatedButton(
                              onPressed: _generateKhodam,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: TextStyle(fontSize: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text('CHECK'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_isLoading)
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        CircularProgressIndicator(),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Kami sedang memeriksa khodam yang ada di dirimu',
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  if (_khodam.isNotEmpty && !_isLoading)
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Khodam yang ada di dalam diri ${_nameController.text} adalah:',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                _khodam,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Text(
                                'Jangan lupa share ke temanmu agar mereka tahu wujud aseli yang ada di dalam dirimu',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.04,
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        ElevatedButton(
                          onPressed: _shareKhodam,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text('Share'),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        ElevatedButton(
                          onPressed: _reset,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.deepPurple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text('Ulangi'),
                        ),
                      ],
                    ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'developed by tegar',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
