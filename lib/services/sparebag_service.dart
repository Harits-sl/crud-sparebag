import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/models/sparebag_model.dart';

class SparebagService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final String sparebagsCollection = 'sparebags';

  Future<List<SparebagModel>> fetchSparebags() async {
    CollectionReference sparebags = _db.collection(sparebagsCollection);

    QuerySnapshot querySnapshot =
        await sparebags.where('id', isNull: false).get();

    // Get data from docs and convert map to List
    List<SparebagModel> listData = querySnapshot.docs.map((doc) {
      return SparebagModel.fromFirestore(doc.data() as Map<String, dynamic>);
    }).toList();

    return listData;
  }

  void addSparebag(SparebagModel sparebagModel) async {
    Map<String, dynamic> sparebag = sparebagModel.toFirestore();

    CollectionReference sparebags = _db.collection(sparebagsCollection);
    sparebags
        .doc(sparebagModel.id)
        .set(sparebag)
        .whenComplete(() => print('sukses tersimpan'))
        .catchError((error) => throw Exception(error));
  }
}
