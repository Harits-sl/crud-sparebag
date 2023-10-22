import 'dart:math';

import 'package:crud/models/sparebag_model.dart';
import 'package:crud/presentation/widgets/custom_text_form_field.dart';
import 'package:crud/services/sparebag_service.dart';
import 'package:crud/shared/theme.dart';
import 'package:flutter/material.dart';

class AddSparebagPage extends StatefulWidget {
  const AddSparebagPage({super.key});

  @override
  State<AddSparebagPage> createState() => _AddSparebagPageState();
}

class _AddSparebagPageState extends State<AddSparebagPage> {
  TextEditingController warehouseController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController kriteriaController = TextEditingController();
  TextEditingController kondisiController = TextEditingController();
  TextEditingController penyebabController = TextEditingController();
  TextEditingController packController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void tapSubmit() {
    if (_formKey.currentState!.validate()) {
      SparebagModel sparebagModel = SparebagModel(
        id: '${warehouseController.text}-${Random().nextInt(255)}',
        warehouse: warehouseController.text,
        tanggal: tanggalController.text,
        kriteria: kriteriaController.text,
        kondisi: kondisiController.text,
        penyebab: penyebabController.text,
        pack: packController.text,
        jumlah: int.parse(jumlahController.text),
      );

      SparebagService().addSparebag(sparebagModel);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Text(
                    'Add Product',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                CustomTextFormField(
                  title: 'Warehouse',
                  textValidator: 'warehouse kosong',
                  hintText: 'Sunda Kelapa Warehouse',
                  controller: warehouseController,
                ),
                CustomTextFormField(
                  title: 'Tanggal',
                  textValidator: 'tanggal kosong',
                  hintText: '2023-10-21',
                  controller: tanggalController,
                ),
                CustomTextFormField(
                  title: 'Kriteria',
                  textValidator: 'Kriteria kosong',
                  hintText: 'Handling WH',
                  controller: kriteriaController,
                ),
                CustomTextFormField(
                  title: 'Kondisi',
                  textValidator: 'Kondisi kosong',
                  hintText: 'Proses Unloading',
                  controller: kondisiController,
                ),
                CustomTextFormField(
                  title: 'Penyebab',
                  textValidator: 'Penyebab kosong',
                  hintText: 'Terjatuh',
                  controller: penyebabController,
                ),
                CustomTextFormField(
                  title: 'Pack',
                  textValidator: 'Pack kosong',
                  hintText: 'PCC Rajawali - 50KG BAG',
                  controller: packController,
                ),
                CustomTextFormField(
                  title: 'Jumlah',
                  textValidator: 'Jumlah kosong',
                  hintText: '1',
                  controller: jumlahController,
                ),
                GestureDetector(
                  onTap: tapSubmit,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(defaultMargin),
                    margin: const EdgeInsets.all(defaultMargin),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Text('submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
