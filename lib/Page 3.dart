import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    List favoriteProduct = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Product"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff3165ED),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:5, right:5),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: favoriteProduct.map((e) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, 'page2', arguments: [
                      e['image'],
                      e['favorite'],
                      e['productName'],
                      e['rating'],
                      e['des'],
                      e['price'],
                      e['cart'],
                      e,
                    ]);
                  },
                  child: Container(
                    height: 100,
                    width: W,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: W / 6,
                            child: Image(
                              image: AssetImage(e['image']),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                e['productName'],
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff3064ED),
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                              ),
                              Image(
                                height: 15,
                                image: AssetImage(e['rating']),
                              ),
                              Text(
                                "₹ ${e['price']}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      backgroundColor: const Color(0xff3165ED),
    );
  }
}
