import 'package:flutter/material.dart';

class Dermatologists extends StatefulWidget {
  @override
  _DermatologistsState createState() => _DermatologistsState();
}

class _DermatologistsState extends State<Dermatologists> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'list of skin doctors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MySkinDoctors(),
    );
  }
}

class MySkinDoctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dermatologists'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.location_pin),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),
        children: <Widget>[
          ProductBox(
              name: "Bhavya Skin &VD Clinic",
              address:
                  "Lic Office Side Road, Danavaipeta, Lic Office Side Road, Vijayawada, Andhra Pradesh 520003",
              mobile_number: 08662437848,
              image: "1.png"),
          ProductBox(
              name: "LaBelle Slimming, Skin and Hair Clinic",
              address:
                  "NO.- 36, Ground floor V V Prasad Complex H, 14-1, Siddhartha College Rd, Jamechettu, Vijayawada, Andhra Pradesh 520010",
              mobile_number: 08019002020,
              image: "2.png"),
          ProductBox(
              name: "BEST Skin & Hair Clinic",
              address:
                  " 11-120, Chaparala, Pamula Vari St, Tulasi Nagar, Sanath Nagar, Vijayawada, Andhra Pradesh 520007",
              mobile_number: 08367744744,
              image: "3.png"),
          ProductBox(
              name: "Soundarya Skin & Cosmetology Clinic",
              address:
                  "Nakkala Rd, Venkatswara Rao Street, Governor Peta, Vijayawada, Andhra Pradesh 520002",
              mobile_number: 09848110965,
              image: "3.png"),
          ProductBox(
              name: "Dr. Rajashekar Skin Hair & Cosmetology Clinic",
              address:
                  "Shop No.29-14, 27, Kodandarami Reddy St, Venkatswara Rao Street, Governor Peta, Vijayawada, Andhra Pradesh 520002",
              mobile_number: 08662435445,
              image: "1.png"),
          ProductBox(
              name: "Magic Skin, Hair and Laser Centre",
              address:
                  "Plot no- 41, near M Hotel, Vinayaka Theater, Ring Rd, Srinivasa Nagar Bank Colony, Vijayawada, Andhra Pradesh 10",
              mobile_number: 09912014666,
              image: "1.png"),
          ProductBox(
              name: "Dr. Bhargavi's Skin Clinic",
              address:
                  " 57-14-25, Panta Kaluva Rd, New Postal Colony-2, Patamata, Benz Circle, Vijayawada, Andhra Pradesh 520010",
              mobile_number: 09849278309,
              image: "1.png"),
          ProductBox(
              name: "Dr Neelakanta Skin Hair & Laser Centre",
              address:
                  " 29-8-35/1 Chiluku Durgaiah Street (First left street in Nakkala Rd from vijayatalkies centre, Suryaraopeta, Governor Peta, Vijayawada, Andhra Pradesh 520002",
              mobile_number: 09963234094,
              image: "1.png"),
          ProductBox(
              name:
                  "Dr Hima's Twacha Skin, Hair & Cosmetology Clinic in Vijayawada",
              address:
                  " Aayush Hospital, #48-13-6A, Nagarjuna Nagar, 3 lane, Road, Vijayawada, Andhra Pradesh 520008",
              mobile_number: 08340923333,
              image: "1.png"),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.address, this.mobile_number, this.image})
      : super(key: key);
  final String name;
  final String address;
  final int mobile_number;
  final String image;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 110,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/" + image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.address),
                    Text("Address: " + this.mobile_number.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
