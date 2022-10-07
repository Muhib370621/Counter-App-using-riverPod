import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Services/APIservices.dart';
import '../sampleModel.dart';


final userDataProvider = FutureProvider<List<Sample>>((ref) async {
  return ref.watch(useProvider).getApi();
});