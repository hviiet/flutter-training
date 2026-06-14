import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          SizedBox(
            height: 220,
            width: double.infinity,
            child: Image.asset("lib/assets/images/background.png", fit: BoxFit.cover,), 
          ),
          SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("lib/assets/images/avata.png"),
                // child: Icon(Icons.person, size: 50,),
              ),
        
              SizedBox(height: 10,),
        
              Text(
                "Anamoul",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              Text("anamoulrouf.bd@gmail.com"),
        
              SizedBox(height: 20,),
      
              
        
        
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ) ,
                      child: Divider( thickness: 1,),
                    ),
      
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Profile"),
                        trailing: Icon(Icons.chevron_right),
                        
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("Saved Location"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.help),
                        title: Text("FAQ"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
      
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ) ,
                      child: Divider( thickness: 1,),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.diamond),
                        title: Text("About Us"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.contact_phone),
                        title: Text("Contact Us"),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ),
        
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        trailing: Icon(Icons.chevron_right),
                        onTap: (){Navigator.pop(context);},
                      ),
                    ),
      
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ) ,
                      child: Divider(),
                    ),
      
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Icon(Icons.eco, size: 40, color: Colors.green,),
                        Column(
                          children: [
                            Text("Air AQ", style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("Version: 1.1", style: TextStyle(color: Colors.grey),)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                )
              ),
            ],
          )
          
        ),
        ]
      ),
    );
  }
}