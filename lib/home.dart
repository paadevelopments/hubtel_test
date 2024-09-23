// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import "package:flutter/material.dart";
import "package:intl/intl.dart";

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});
  @override
  State<HomeActivity> createState() => _HomeActivityState();
}
class _HomeActivityState extends State<HomeActivity> {

  Color cusGrey = const Color(0XFFcbcbcb);
  Color hubtelPrimary = const Color(0xFF01c7b1);
  bool isLoading = true;

  /// Sample data.
  List data = [
    {
      "time":"2022-05-24 14:45:00",
      "logoColor":Colors.yellow, /// Will be replaced with item logo file name
      "name":"Emmanuel Rockson Kwabena Uncle Ebo",
      "successful":true,
      "number":"0241231234",
      "amount":"GHS 500",
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
      "amount":"GHS 500",
      "category":"Personal",
      "starred":false,
      "note":"Cool your heart wai"
    },
    {
      "time":"2022-05-23 14:45:00",
      "logoColor":Colors.yellow,
      "name":"Emmanuel Rockson",
      "successful":true,
      "number":"0241231234",
      "amount":"GHS 500",
      "category":"Other",
      "starred":true,
      "note":"Cool your heart wai"
    },
    {
      "time":"2022-05-23 14:45:00",
      "logoColor":Colors.yellow,
      "name":"Emmanuel Rockson",
      "successful":true,
      "number":"0241231234",
      "amount":"GHS 500",
      "category":"Other",
      "starred":true,
      "note":""
    },
  ];

  /// Indicator for active header tab.
  int activeSection = 0;

  /// Imported code {https://www.geeksforgeeks.org/flutter-find-the-number-of-days-between-two-dates/}
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  /// Day-label date parser.
  String parseLabelDate(DateTime date) {
    String month = DateFormat("MMMM").format(date).substring(0, 3);
    return "$month ${DateFormat("dd").format(date)}.${DateFormat("yyyy").format(date)}";
  }

  /// Item time parser.
  String parseItemTime(DateTime date) => DateFormat("HH:mmaa").format(date);

  /// Reusable widget for the header tab buttons.
  /// Such widgets will be in a dedicated [widgets] folder when implementing a VMMV project structure.
  Widget HeaderSwitchButton(String label,bool isActive,dynamic callback) => Expanded(child: FilledButton(
    style: FilledButton.styleFrom(
        backgroundColor: isActive ? Colors.white : Colors.transparent,
        foregroundColor: Colors.black.withOpacity(!isActive ? 0.3 : 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))
        ),
      padding: EdgeInsets.zero
    ),
    onPressed: callback,
    child: Center(child: Text(label,style: TextStyle(
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        fontSize: 13
    ),),),
  ));

  /// Reusable widget for the bottom navigation buttons.
  Widget BottomNavigationButton(String label, IconData icon, bool isHome, bool isIconHighlighted) => Container(
    width: 60,
    decoration: BoxDecoration(
      border: !isHome ? null : Border(right: BorderSide(color: cusGrey))
    ),
    child: FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )
      ),
      onPressed: () {},
      child: Column(children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            color: hubtelPrimary.withOpacity(isHome ? 0.5 : 0),
            borderRadius: const BorderRadius.all(Radius.circular(48/2))
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {

      /// Simulate a loading action
      await Future.delayed(const Duration(seconds: 2));
      setState(() { isLoading = false; });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(child: Column(children: [
        Container(
          width: double.maxFinite, height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          margin: const EdgeInsets.only(top: 24),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: cusGrey,)),
          ),
          child: Center(child: Container(
            width: double.maxFinite, height: double.maxFinite,
            decoration: BoxDecoration(
                color: cusGrey,
              borderRadius: const BorderRadius.all(Radius.circular(4))
            ),
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(3),
            child: Row(children: [
              HeaderSwitchButton("History",activeSection == 0,() => setState(() {
                activeSection = 0;
              })),
              HeaderSwitchButton("Transaction Summary",activeSection != 0,() => setState(() {
                activeSection = 1;
              })),
            ],),
          ),),
        ),
        Container(
          width: double.maxFinite, height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0),
          child: Center(child: SizedBox(
            height: 42,
            child: Row(
              children: [
                Expanded(child: Container(
                  width: double.maxFinite, height: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: cusGrey
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.search_rounded),
                      SizedBox(width: 10,),
                      Expanded(child: Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: false,
                            hintText: "Search",
                            contentPadding: EdgeInsets.symmetric(vertical: 12.5),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0,color: Colors.transparent)),
                            border: OutlineInputBorder(borderSide: BorderSide(width: 0,color: Colors.transparent)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0,color: Colors.transparent)),
                          ),
                          style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
                        ),
                      ))
                    ],
                  ),
                )),
                const SizedBox(width: 10,),
                SizedBox(
                  width: 42, height: 42,
                  child: IconButton(
                    icon: const Icon(Icons.display_settings_rounded),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),),
        ),
        Expanded(child: LayoutBuilder(builder: (_c,_d) => Stack(children: [
          SingleChildScrollView(child: isLoading
        ? const SizedBox(
            width: double.maxFinite,
            child: Center(child: CircularProgressIndicator(),),
          )
          : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Column(children: data.asMap().entries.map((listItem) {
                bool addDateLabel = listItem.key == 0 ? true : daysBetween(DateTime.parse(listItem.value["time"]), DateTime.parse(data[listItem.key - 1]["time"])) > 0;
                return Column(
                  children: [
                    addDateLabel ? Column(children: [
                      Row(children: [
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                              color: cusGrey,
                              borderRadius: const BorderRadius.all(Radius.circular(30/2))
                          ),
                          child: Center(child: Text(parseLabelDate(DateTime.parse(listItem.value["time"])), style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.3)),),),
                        ),
                        const Expanded(child: SizedBox())
                      ],),
                      const SizedBox(height: 10,)
                    ],) : const SizedBox(),
                    Padding(padding: const EdgeInsets.only(bottom: 16),child: Column(children: [
                      Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            border: Border.all(color: cusGrey)
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(children: [
                          Align(alignment: Alignment.centerLeft,child: Text(
                            parseItemTime(DateTime.parse(listItem.value["time"])), style: TextStyle(color: Colors.black.withOpacity(0.3)),
                          ),),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 42, height: 42,
                                decoration: BoxDecoration(
                                    color: listItem.value["logoColor"],
                                    borderRadius: const BorderRadius.all(Radius.circular(42 / 2))
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Expanded(child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Align(alignment: Alignment.centerLeft,child: Text(listItem.value["name"]),),
                                    )),
                                    Container(
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                          color: (listItem.value["successful"] ? Colors.green : Colors.red).withOpacity(0.3),
                                          borderRadius: const BorderRadius.all(Radius.circular(30/2))
                                      ),
                                      child: Center(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            listItem.value["successful"] ? Icons.check_circle : Icons.cancel,
                                            color: listItem.value["successful"] ? Colors.green : Colors.red,
                                            size: 12,
                                          ),
                                          const SizedBox(width: 5,),
                                          Text(
                                            listItem.value["successful"] ? "Successful" : "Failed",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: listItem.value["successful"] ? Colors.green : Colors.red
                                            ),),
                                        ],
                                      ),),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: Align(alignment: Alignment.centerLeft,child: Text(
                                      listItem.value["number"],
                                      style: TextStyle(color: Colors.black.withOpacity(0.3)),
                                    ),)),
                                    Text(
                                      listItem.value["amount"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                ),
                              ],))
                            ],
                          ),
                          const SizedBox(height: 12,),
                          Divider(height: 1,thickness: 1,color: cusGrey,),
                          const SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 28, height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.3),
                                    borderRadius: const BorderRadius.all(Radius.circular(28/2))
                                ),
                                child: const Center(child: Icon(Icons.person_rounded, size: 20, color: Colors.blue,),),
                              ),
                              const SizedBox(width: 5,),
                              Text(listItem.value["category"]),
                              const SizedBox(width: 5,),
                              listItem.value["note"].toString().isNotEmpty
                                  ? Expanded(child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("• ${listItem.value["note"]}"),
                              ))
                                  : const SizedBox(),
                              listItem.value["starred"]
                                  ? const Icon(Icons.star_rounded, size: 20, color: Colors.amber,)
                                  : const SizedBox()
                            ],
                          ),
                        ],),
                      ),
                    ],),),
                  ],
                );
              }).toList()),
            ),
          ),),
          Positioned(
            bottom: 0, left: 0,
            child: Container(
              width: _d.maxWidth,
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(alignment: Alignment.center,child: SizedBox(
                width: 150, height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: hubtelPrimary,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: hubtelPrimary,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))
                    ),
                    padding: EdgeInsets.zero
                  ),
                  onPressed: () {},
                  child: const Center(child: Row(
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
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavigationButton("Home", Icons.home_outlined, true, false),
              BottomNavigationButton("Send", Icons.send_time_extension_outlined, false, false),
              BottomNavigationButton("History", Icons.featured_play_list_outlined, false, true),
              BottomNavigationButton("Scheduled", Icons.calendar_today_outlined, false, false),
            ],
          ),
        ),
      ],),),
    );
  }
}
