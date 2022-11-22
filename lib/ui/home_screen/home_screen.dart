import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proposal_generator/ui/custom_widgets/custom_text_fielld.dart';
import 'package:proposal_generator/ui/pdf_generator/list_of_table_data.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_textFields_entery.dart';
import '../pdf_generator/home_screen.dart';
import 'home_screen_provider.dart';

var listOfWidget = [
  customContainer(),
];
ListOfData listOfData = ListOfData();
List<ListOfData> listOfTable = [];

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeScreenProvider(),
        child: Consumer<HomeScreenProvider>(builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.grey,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.text.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          child: Text(
                                            "${controller.text}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              controller =
                                                  TextEditingController();
                                            });
                                          },
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: CustomTextFields(
                                          onSubmit: (v) {
                                            print("object");
                                            setState(() {});
                                          },
                                          myController: controller,
                                          hintText: 'Project Name',
                                        ),
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                      "Project Breakdown And cost Anylysis"),
                                ),
                                fillBycontroller.text.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          child: Row(
                                            children: [
                                              Text("Filled By:"),
                                              Text(
                                                "${fillBycontroller.text}",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              fillBycontroller =
                                                  TextEditingController();
                                            });
                                          },
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                        ),
                                        child: CustomTextFields(
                                          onSubmit: (v) {
                                            print("object");
                                            setState(() {});
                                          },
                                          myController: fillBycontroller,
                                          hintText: 'Filled By:',
                                        ),
                                      ),
                              ],
                            ),
                          ),

                          ///
                          /// indiction Row

                          Container(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: model.onTapValue == 1 ||
                                              model.estimateTimeLine == 1
                                          ? Colors.red
                                          : model.deleverableTabel == 1
                                              ? Colors.blue
                                              : Colors.blue,
                                      child: Text("1"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("OverView")
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          model.deleverableTabel == 1
                                              ? Colors.red
                                              : Colors.blue,
                                      child: Text("2"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Deleverable")
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Text("3"),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(" Project BreakDown")
                                  ],
                                ),
                              ],
                            ),
                          ),

                          ///
                          /// Date Container
                          Container(
                            child: Column(
                              children: [
                                CustomTextFields(
                                  myController: dateinput,
                                  readOnly: true,
                                  hintText: 'Select Data',
                                  myIcon: Icon(
                                    Icons.calendar_month_sharp,
                                    color: Colors.green,
                                  ),
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      model.dateInput(
                                          formattedDate); //set output date to TextField value.
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },
                                ),
                                budgetController.text.isNotEmpty
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: InkWell(
                                          child: Row(
                                            children: [
                                              Text("Budeget:"),
                                              Text(
                                                "${budgetController.text} (USD)",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            setState(() {
                                              budgetController =
                                                  TextEditingController();
                                            });
                                          },
                                        ),
                                      )
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: CustomTextFields(
                                          onSubmit: (v) {
                                            print("object");
                                            setState(() {});
                                          },
                                          myController: budgetController,
                                          hintText: 'Budget:(USD)',
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ///
                          /// list of Button
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Services",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'OverView',
                                  myICon: model.onTapValue == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.onTapValue == 1
                                        ? model.overViewToggle(0)
                                        : model.overViewToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Project TimeLine',
                                  myICon: model.estimateTimeLine == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.estimateTimeLine == 1
                                        ? model.estimateTimeLineToggle(0)
                                        : model.estimateTimeLineToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Deleverable Tabel',
                                  myICon: model.deleverableTabel == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.deleverableTabel == 1
                                        ? model.deleverableTabelToggle(0)
                                        : model.deleverableTabelToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Project BreakDown',
                                  myICon: model.projectBreakDown == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.projectBreakDown == 1
                                        ? model.projectBreakDownToggle(0)
                                        : model.projectBreakDownToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Frontend Design Development',
                                  myICon: model.frontEndDesign == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.frontEndDesign == 1
                                        ? model.frontEndDesignToggle(0)
                                        : model.frontEndDesignToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Back-end-Design Development',
                                  myICon: model.backEndDesign == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.backEndDesign == 1
                                        ? model.backEndDesignToggle(0)
                                        : model.backEndDesignToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Testing And Debuging',
                                  myICon: model.testingDebuging == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.testingDebuging == 1
                                        ? model.testingDebugingToggle(0)
                                        : model.testingDebugingToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Future Services',
                                  myICon: model.futureServices == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.futureServices == 1
                                        ? model.futureServicesToggle(0)
                                        : model.futureServicesToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'CopyRight and Liensing',
                                  myICon: model.copyRightLiensing == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.copyRightLiensing == 1
                                        ? model.copyRightLiensingToggle(0)
                                        : model.copyRightLiensingToggle(1);
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  buttonName: 'Other',
                                  myICon: model.other == 0
                                      ? Icons.add
                                      : Icons.minimize,
                                  onPressed: () {
                                    model.other == 1
                                        ? model.otherToggle(0)
                                        : model.otherToggle(1);
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),

                          ///
                          /// Textfields Area
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Container(
                              child: Column(
                                children: [
                                  model.onTapValue == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Breief OverView",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              myController: briefOverview,
                                              maxLine: 5,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  model.estimateTimeLine == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Estimatted TimeLine",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              myController: timelineestimation,
                                              maxLine: 1,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding table

                                  model.deleverableTabel == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Deleverable",
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Serial no",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Features",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  "Cost",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 200,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      listOfWidget.length,
                                                  itemBuilder: (context,
                                                          index) =>
                                                      customContainer(
                                                          onPress: () {
                                                        setState(() {
                                                          listOfWidget
                                                              .removeAt(index);
                                                        });
                                                      })),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  listOfWidget
                                                      .add(customContainer());
                                                  setState(() {});
                                                },
                                                child: Text("add rows")),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding project break down textfield
                                  ///
                                  model.projectBreakDown == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Project Breakdown",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              myController:
                                                  developmentProcedure,
                                              maxLine: 6,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding frontend design textfield
                                  ///
                                  model.frontEndDesign == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Front-end-Design",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              maxLine: 3,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding back-end- development texfield
                                  ///
                                  model.backEndDesign == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Back-end-Design",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              maxLine: 3,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding testing and debuging textfield
                                  ///
                                  model.testingDebuging == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Testing and Debuging",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              maxLine: 3,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding future services
                                  model.futureServices == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Future Services",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              myController: futureServices,
                                              maxLine: 3,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// adding CopyRighting licencing
                                  ///
                                  model.copyRightLiensing == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("CopyRight and Licencing",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              myController: copyLinenceAndRight,
                                              maxLine: 3,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  ///
                                  /// Adding textfields for other detail
                                  ///
                                  model.other == 1
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Other Detail",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                )),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomTextFieldsEntry(
                                              maxLine: 3,
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: InkWell(
                      child: Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber,
                          ),
                          child: Center(
                            child: Text(
                              "Generate Pdf",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterData()));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}

///
/// adding new rows to table
customContainer({Function()? onPress}) {
  print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
  return Container(
    margin: EdgeInsets.all(10),
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(border: Border.all()),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 100,
            child: TextFormField(
              controller: sNoController,
              decoration: InputDecoration(
                hintText: 'S.no',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 450,
            child: TextFormField(
              controller: featureController,
              decoration: InputDecoration(
                hintText: 'Feature',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            child: TextFormField(
              controller: budgetController,
              decoration: InputDecoration(
                hintText: 'Cost',
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            child: IconButton(
              onPressed: onPress,
              icon: Icon(Icons.delete),
            ),
          )
        ],
      ),
    ),
  );
}
