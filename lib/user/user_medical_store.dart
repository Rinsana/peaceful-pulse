import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse/constants/custom_colors.dart';
import 'package:peaceful_pulse/services/database_methods.dart';
import 'package:peaceful_pulse/user/user_medicine_info.dart';

class UserMedicalStore extends StatefulWidget {
  const UserMedicalStore({super.key});

  @override
  State<UserMedicalStore> createState() => _UserMedicalStoreState();
}

class _UserMedicalStoreState extends State<UserMedicalStore> {

  Stream? medicineStream;
  getOnLoad()async{
    medicineStream= await DataBaseMethods().getMedicineDetails();
    setState(() {});
  }
  @override
  void initState() {
    getOnLoad();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Medicines",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SearchAnchor(builder:
                      (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      onTap: () {
                        controller.openView();
                      },
                    );
                  }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List.generate(5, (int index) {
                      final String item = 'item $index';
                      return ListTile(
                        title: Text(item),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  }),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            children: [
              SizedBox(
                width: 25,
              ),
              Text(
                "Categories",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Fever"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Suger"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Pressure"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Painkiller"),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
            child: StreamBuilder(
              stream: medicineStream,
              builder: (context, snapshot) {
                return snapshot.hasData? GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserMedicineInfo()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.grey,
                            child: Text(ds["Name"]),
                          ),
                        ),
                      );
                    }
                ): Container();
              }
            ),
          ),
          // SizedBox(
          //     height: MediaQuery.of(context).size.height / 1.5,
          //     child: GridView.count(
          //       mainAxisSpacing: 5,
          //       crossAxisSpacing: 5,
          //       padding: EdgeInsets.all(10),
          //       crossAxisCount: 2,
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => const UserMedicineInfo()));
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.all(8),
          //             color: Colors.grey,
          //             child: const Text("Paracetamol"),
          //           ),
          //         ),
          //       ],
          //     ))
        ],
      ),
    );
  }
}
