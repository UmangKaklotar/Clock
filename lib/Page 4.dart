import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int totalPrice = 0;
  var display = 0;
  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    List addCart = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff3165ED),
      ),
      body: (display == 0) ? Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: H,
            width: W,
            child: Padding(
              padding: const EdgeInsets.only(left:5, right:5),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: addCart.map((e) {
                    totalPrice = totalPrice + int.parse(e['price']);
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
                            addCart
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
          ),
          Container(
            height: H / 3.6,
            width: W,
            child:  Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Price",
                          style: TextStyle(
                            fontSize: 23,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "₹ $totalPrice",
                          style: const TextStyle(
                            fontSize: 23,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Discount Price",
                          style: TextStyle(
                            fontSize: 23,
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "- ₹ ${(totalPrice * 15) / 100}",
                          style: const TextStyle(
                            fontSize: 23,
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Payable Amount",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "₹ ${totalPrice - (totalPrice * 15) / 100}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: (){
                        setState(() {
                          // addCart.clear();
                          totalPrice = 0;
                          display = 1;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: W,
                        decoration: BoxDecoration(
                          color: const Color(0xff3165ED),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text("Checkout",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Center(
        child: InkWell(
          onTap: (){
            setState(() {
              display = 0;
            });
          },
          child: const Image(image: AssetImage('build/fashionWear/Approve.gif'),
          ),
        ),
      ),
      backgroundColor: (display == 0) ? const Color(0xff3165ED) : const Color(0xffE6F2FE),
    );
  }
}
