import 'package:crud/presentation/pages/add_sparebag_page.dart';
import 'package:crud/services/sparebag_service.dart';
import 'package:crud/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void tapAddSparebag() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddSparebagPage()));
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: tapAddSparebag,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(defaultMargin),
                margin: const EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text('Add Sparebag'),
              ),
            ),
            FutureBuilder(
              future: SparebagService().fetchSparebags(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: snapshot.data!
                          .map(
                            (sparebag) => Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              margin: const EdgeInsets.only(
                                left: defaultMargin,
                                right: defaultMargin,
                                bottom: 12,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Warehouse: ${sparebag.warehouse}'),
                                  Text('Tanggal: ${sparebag.tanggal}'),
                                  Text('kriteria: ${sparebag.kriteria}'),
                                  Text('Kondisi: ${sparebag.kondisi}'),
                                  Text('Penyebab: ${sparebag.penyebab}'),
                                  Text('Pack: ${sparebag.pack}'),
                                  Text('Jumlah: ${sparebag.jumlah}'),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(top: 18),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Text('Edit Sparebag'),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(top: 8),
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                      ),
                                      child: Text('Delete Sparebag'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
