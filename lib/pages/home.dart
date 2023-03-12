import 'package:corazon_de_nino/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('Corazón de niño ❤️'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        initialValue: homeProvider.databasePath,
                        autofocus: true,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            labelText: 'Buscar producto'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: homeProvider.cart.length,
                          itemBuilder: (_, int i) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(homeProvider.cart[i].name),
                                  trailing: Text(
                                    '\$${homeProvider.cart[i].price * homeProvider.cart[i].amount}',
                                  ),
                                  subtitle: IntrinsicHeight(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('\$${homeProvider.cart[i].price}'),
                                        const VerticalDivider(),
                                        Text(
                                            'Disponibles: ${homeProvider.cart[i].amount}')
                                      ],
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: Wrap(
                                    spacing: 10,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('-'),
                                      ),
                                      Text('${homeProvider.cart[i].amount}'),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('+'),
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      homeProvider
                                          .deleteProduct(homeProvider.cart[i]);
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (_, __) => const Divider(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 3,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('Total'),
                          trailing: Text('${homeProvider.total}'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Vender',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Cancelar',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
