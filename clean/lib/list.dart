import 'package:flutter/material.dart';
import 'model/cart_model.dart';
import 'package:provider/provider.dart';
import 'chech_out.dart';
import 'component/item_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '冷氣機清潔',
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
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 24,
                          width: 4,
                          color: const Color(0xff36BBD9),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '服務項目',
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: 600,
                      width: 400,
                      child: ListView.builder(
                          itemCount: cart.shopItems.length,
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
                                subtitle: Text(
                                  '\$' + cart.shopItems[index][1].toString(),
                                  style: const TextStyle(
                                      color: Color(0xff36BBD9),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                title:
                                    Text(cart.shopItems[index][0].toString()),
                                trailing: Wrap(
                                  runAlignment: WrapAlignment.center,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 12,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count != 0 ? count-- : count;
                                        });
                                        cart.removeItemFromCart(index);
                                      },
                                      icon: const Icon(Icons.remove_circle,
                                          color: Color(0xff36BBD9)),
                                    ),
                                    Text(
                                      count.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          count++;
                                        });
                                        cart.addItemToCart(index);
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Color(0xff36BBD9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })),
                    ),
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return CheckOut();
                        })));
                      },
                      child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          color: const Color(0xff36BBD9),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '下一步',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
