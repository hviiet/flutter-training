import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/requestProvider.dart';

class DatabankPage extends StatelessWidget {
  const DatabankPage({super.key});

  Future<void> pickDate(BuildContext context) async{
    final provider = Provider.of<Requestprovider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: provider.selectedDate?? DateTime.now(),
      firstDate: DateTime(2020), 
      lastDate: DateTime(2030),
    );

    if(picked != null){
      provider.setDate(picked);
    }
  }

  // void sendRequest(){
  //   ScaffoldMessenger.of(context)
  //   .showSnackBar(
  //     SnackBar(content: content))
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('lib/assets/images/top.png', fit: BoxFit.cover,),
              ),

              SizedBox(height: 20,),

              Text("Request For Data", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

              SizedBox(height: 10,),

              Text("If you would like to download pollutant data, please place your request here. We'll share the AQI data along with a link to the Live Emission Visualiser - Data Bank dashboard.",
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),

              SizedBox(height: 20,),

              // email
              TextField(
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: "Your Email",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

              SizedBox(height: 16),

              TextField(
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  hintText: "Location",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 16),

              //select date
              InkWell(
                onTap: () => pickDate( context),
                child: Container(
                  height: 56,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(10)),
                  child: Consumer<Requestprovider>(builder: (context, Provider, child){
                    return Row(
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 12,),
                        Text(Provider.selectedDate == null ? "Select Date"
                          :"${Provider.selectedDate!.day}/${Provider.selectedDate!.month}/${Provider.selectedDate!.year}"
                        ),
                        Spacer(),
                        Icon(Icons.arrow_drop_down),
                      ],
                    );
                  }),
                ),
              ),

              //button
              SizedBox(height: 16,),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,

                        content: Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("Request Sent!",),
                          ],
                        )
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    )
                  ),
                  
                  child: Text("Get Started"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}