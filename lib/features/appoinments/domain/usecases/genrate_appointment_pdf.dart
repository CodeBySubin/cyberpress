
import 'dart:typed_data';

import 'package:healthsync/features/appoinments/domain/entities/appointment_details.dart';

abstract class GenerateAppointmentPdf {
  Future<Uint8List> call(AppointmentDetails details);
}
