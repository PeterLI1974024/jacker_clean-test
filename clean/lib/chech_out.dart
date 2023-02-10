import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/cart_model.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '確認價格',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1),
        ),
        backgroundColor: const Color(0xff36BBD9),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, child) {
          return SafeArea(
            child: Expanded(
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 20),
                  child: Container(
                    child: Row(
                      children: const [
                        Text(
                          '訂單內容',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Row(
                      children: const [
                        Text(
                          '服務項目',
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Expanded(
                      child: Container(
                        height: 150,
                        width: 400,
                        child: ListView.builder(
                            itemCount: cart.cartItems.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 218, 218, 218))),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  title:
                                      Text(cart.cartItems[index][0].toString()),
                                  trailing: Wrap(
                                    spacing: 16,
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  ),
                ),
                Image.asset('lib/picture/icon.png'),
                Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xff36BBD9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              '結帳',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )
                          ],
                        )),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
    ;
  }
}
