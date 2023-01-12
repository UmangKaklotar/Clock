import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  int quantity = 1, price = 0;

  @override
  Widget build(BuildContext context) {
    double H = MediaQuery.of(context).size.height;
    double W = MediaQuery.of(context).size.width;
    List selectProduct = ModalRoute.of(context)!.settings.arguments as List;
    if(price == 0)
    {
      price = int.parse(selectProduct[5]);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: H,
            width: W,
            color: Colors.grey,
            alignment: const Alignment(0,-1),
            child: Image(
              height: 250,
              image: AssetImage(selectProduct[0]),
            ),
          ),
          Container(
            height: H / 1.8,
            width: W,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: selectProduct[1] == '1' ? const Color(0xff3165ED) : const Color(0xffEBF0FD),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.favorite,
                        color: selectProduct[1] == '1' ? const Color(0xffEBF0FD) : const Color(0xff3165ED),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      selectProduct[2],
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image(
                      height: 16,
                      image: AssetImage(selectProduct[3]),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      selectProduct[4],
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Quantity",
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            (quantity > 1) ? quantity-- : 1;
                            (price > 0) ? price = price - int.parse(selectProduct[5]) : 0;
                            print(price);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: const Color(0xff2F65EE),
                              width: 2,
                            ),
                          ),
                          child: const Icon(Icons.remove, color: Color(0xff2F65EE)),
                        ),
                      ),
                      Container(
                        width: 70,
                        alignment: Alignment.center,
                        child: Text(
                          "$quantity",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            quantity++;
                            price = price + int.parse(selectProduct[5]);
                            print(price);
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F65EE),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "₹ $price",
                          style: const TextStyle(
                            fontSize: 27,
                            color: Color(0xff2F65EE),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: (){
                          setState(() {
                            if(selectProduct[6] == '1')
                            {
                              0;
                            }
                            else
                            {
                              selectProduct[6] = '1';
                              selectProduct[8].add(selectProduct[7]);
                            }
                            selectProduct[8][selectProduct[8].length - 1]['price'] = price.toString();
                            print(selectProduct[8].length);
                          });
                          Navigator.pushNamed(context, 'page4', arguments: selectProduct[8]);
                        },
                        child: Container(
                          height: 60,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xff2F65EE),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: const Text("Add to Cart",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
