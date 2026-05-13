import 'package:flutter/material.dart';

void main() {
  runApp(JobApp());
}

class JobApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobApplicationPage(),
    );
  }
}

class JobApplicationPage extends StatefulWidget {
  @override
  _JobApplicationPageState createState() => _JobApplicationPageState();
}

class _JobApplicationPageState extends State<JobApplicationPage> {

  final _formKey = GlobalKey<FormState>();

  String selectedPosition = "Mobil Geliştirici";
  String experience = "0-1 Yıl";
  bool accepted = false;

  final List<String> positions = [
    "Mobil Geliştirici",
    "Frontend Developer",
    "Backend Developer",
    "UI/UX Designer"
  ];

  final List<String> experiences = [
    "0-1 Yıl",
    "1-3 Yıl",
    "3-5 Yıl",
    "5+ Yıl"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("İş Başvuru Formu"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    Icon(
                      Icons.work,
                      size: 60,
                      color: Colors.white,
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Kariyer Başvurusu",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ad Soyad",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ad Soyad giriniz";
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-posta",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "E-posta giriniz";
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Telefon",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Telefon giriniz";
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),

              DropdownButtonFormField(
                // ignore: deprecated_member_use
                value: selectedPosition,

                items: positions.map((position) {
                  return DropdownMenuItem(
                    value: position,
                    child: Text(position),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    selectedPosition = value.toString();
                  });
                },

                decoration: InputDecoration(
                  labelText: "Pozisyon",
                  prefixIcon: Icon(Icons.work_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deneyim",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Column(
                children: experiences.map((exp) {
                  return RadioListTile(
                    title: Text(exp),
                    value: exp,
                    // ignore: deprecated_member_use
                    groupValue: experience,

                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      setState(() {
                        experience = value.toString();
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 10),

              TextFormField(
                maxLines: 4,

                decoration: InputDecoration(
                  labelText: "Kendinizden Bahsedin",
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.description),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  filled: true,
                  fillColor: Colors.white,
                ),
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {},

                  icon: Icon(Icons.upload_file),

                  label: Text(
                    "CV Yükle",
                    style: TextStyle(fontSize: 16),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              CheckboxListTile(
                value: accepted,

                onChanged: (value) {
                  setState(() {
                    accepted = value!;
                  });
                },

                title: Text(
                  "Kullanım şartlarını kabul ediyorum"
                ),
              ),

              SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {

                    if (_formKey.currentState!.validate()) {

                      if (!accepted) {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Sözleşmeyi kabul etmelisiniz"
                            ),
                          ),
                        );

                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Başvuru başarıyla gönderildi"
                          ),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: Text(
                    "Başvuruyu Gönder",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}