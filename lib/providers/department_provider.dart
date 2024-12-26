import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripnyi_sks_24_1/data/data.dart';

final departmentsProvider = Provider((ref) {
  return availableDepartments;
});
