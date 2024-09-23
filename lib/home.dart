import "dart:ui";

import "package:flutter/material.dart";

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});
  @override
  State<HomeActivity> createState() => _HomeActivityState();
}
class _HomeActivityState extends State<HomeActivity> {

  Color cusGrey = const Color(0XFFcbcbcb);
  Color hubtelPrimary = const Color(0xFF01c7b1);

  List data = [
    {
      "time":"2022-05-24 14:45:00",
      "logoColor":Colors.yellow,
      "name":"Emmanuel Rockson Kwabena Uncle Ebo",
      "successful":true,
      "number":"0241231234",
      "amount":"500",
      "category":"Personal",
      "starred":true,
      "note":"Cool your heart wai"
    },
    {
      "time":"2022-05-24 14:45:00",
      "logoColor":Colors.red,
      "name":"Absa Bank",
      "successful":false,
      "number":"0241231234",
      "amount":"500",
      "category":"Personal",
      "starred":false,
      "note":"Cool your heart wai"
    },
    {
      "time":"2022-05-23 14:45:00",
      "logoColor":Colors.red,
      "name":"Absa Bank",
      "successful":false,
      "number":"0241231234",
      "amount":"500",
      "category":"Personal",
      "starred":false,
      "note":"Cool your heart wai"
    }
  ];
  int activeSection = 0;


  Widget d1(String label,bool isActive,dynamic callback) => Expanded(child: FilledButton(
    style: FilledButton.styleFrom(
        backgroundColor: isActive ? Colors.white : Colors.transparent,
        foregroundColor: Colors.black.withOpacity(!isActive ? 0.3 : 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))
        ),
      padding: EdgeInsets.zero
    ),
    onPressed: () {},
    child: Center(child: Text(label,style: TextStyle(
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        fontSize: 13
    ),),),
  ));

  Widget d2(String label, IconData icon, bool isHome, bool isIconHighlighted) => Container(
    width: 60,
    decoration: BoxDecoration(
      border: !isHome ? null : Border(right: BorderSide(color: cusGrey))
    ),
    child: FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )
      ),
      onPressed: () {},
      child: Column(children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            color: hubtelPrimary.withOpacity(isHome ? 0.5 : 0),
            borderRadius: BorderRadius.all(Radius.circular(48/2))
          ),
          child: Center(child: Icon(
            icon,
            color: Colors.black.withOpacity(isIconHighlighted || isHome ? 1 : 0.5),
          ),),
        ),
        Align(alignment: Alignment.center, child: Text(
          isHome ? "" : label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(isIconHighlighted ? 1 : 0.5),
            fontWeight: isIconHighlighted ? FontWeight.bold : null
          ),
        ),)
      ],),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [
        Container(
          width: double.maxFinite, height: 60,
          padding: EdgeInsets.symmetric(horizontal: 16,),
          margin: EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: cusGrey,)),
          ),
          child: Center(child: Container(
            width: double.maxFinite, height: double.maxFinite,
            decoration: BoxDecoration(
                color: cusGrey,
              borderRadius: BorderRadius.all(Radius.circular(4))
            ),
            margin: EdgeInsets.only(bottom: 16),
            padding: EdgeInsets.all(3),
            child: Row(children: [
              d1("History",activeSection == 0,() {}),
              d1("Transaction Summary",activeSection != 0,() {}),
            ],),
          ),),
        ),
        Container(
          width: double.maxFinite, height: 72,
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 0),
          child: Center(child: SizedBox(
            height: 42,
            child: Row(
              children: [
                Expanded(child: Container(
                  width: double.maxFinite, height: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: cusGrey
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search_rounded),
                      SizedBox(width: 10,),
                      Expanded(child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Search",style: TextStyle(color: Colors.black.withOpacity(0.3)),),
                      ))
                    ],
                  ),
                )),
                SizedBox(width: 10,),
                SizedBox(
                  width: 42, height: 42,
                  child: IconButton(
                    icon: Icon(Icons.display_settings_rounded),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),),
        ),
        Expanded(child: LayoutBuilder(builder: (_c,_d) => Stack(children: [
          SingleChildScrollView(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Column(children:
            [
              Row(children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: cusGrey,
                    borderRadius: BorderRadius.all(Radius.circular(30/2))
                  ),
                  child: Center(child: Text("May 23. 2022", style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.3)),),),
                ),
                Expanded(child: SizedBox())
                ],),
              SizedBox(height: 10,),
              Column(children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: cusGrey)
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(children: [
                    Align(alignment: Alignment.centerLeft,child: Text(
                      "12:32PM", style: TextStyle(color: Colors.black.withOpacity(0.3)),
                    ),),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42, height: 42,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                            borderRadius: BorderRadius.all(Radius.circular(42 / 2))
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Align(alignment: Alignment.centerLeft,child: Text(
                                    "Emmanuel Rockson"
                                ),),
                              )),
                              Container(
                                height: 30,
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.3),
                                    borderRadius: BorderRadius.all(Radius.circular(30/2))
                                ),
                                child: Center(child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle,color: Colors.green, size: 12,),
                                    SizedBox(width: 5,),
                                    Text("Successful", style: TextStyle(fontSize: 12, color: Colors.green),),
                                  ],
                                ),),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Align(alignment: Alignment.centerLeft,child: Text(
                                "024 123 1234",
                              ),)),
                              Text(
                                "GHS 500",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ],))
                      ],
                    ),
                    SizedBox(height: 12,),
                    Divider(height: 1,thickness: 1,color: cusGrey,),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 28, height: 28,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.3),
                            borderRadius: BorderRadius.all(Radius.circular(28/2))
                          ),
                          child: Center(child: Icon(Icons.person_rounded, size: 20, color: Colors.blue,),),
                        ),
                        SizedBox(width: 5,),
                        Text("Other"),
                        SizedBox(width: 5,),
                        Expanded(child: Align(alignment: Alignment.centerLeft, child: Text(
                          "• Cool your heart wai"
                        ),)),
                        Icon(Icons.star_rounded, size: 20, color: Colors.amber,)
                      ],
                    ),
                  ],),
                ),
              ],),
            ],),
          ),),
          Positioned(
            bottom: 0, left: 0,
            child: Container(
              width: _d.maxWidth,
              padding: EdgeInsets.only(bottom: 10),
              child: Align(alignment: Alignment.center,child: SizedBox(
                width: 150, height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hubtelPrimary,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: hubtelPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    padding: EdgeInsets.zero
                  ),
                  onPressed: () {},
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_rounded),
                      SizedBox(width: 10,),
                      Text("SEND NEW")
                    ],
                  ),),
                ),
              ),),
            )
          )
        ],),)),
        Container(
          width: double.maxFinite, height: 86,
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: cusGrey,))
          ),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              d2("Home", Icons.home_outlined, true, false),
              d2("Send", Icons.send_time_extension_outlined, false, false),
              d2("History", Icons.featured_play_list_outlined, false, true),
              d2("Scheduled", Icons.calendar_today_outlined, false, false),
            ],
          ),
        ),
      ],),),
    );
  }
}
