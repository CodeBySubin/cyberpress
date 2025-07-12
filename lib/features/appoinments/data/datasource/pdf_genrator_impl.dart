import 'dart:typed_data';
import 'package:healthsync/features/appoinments/domain/usecases/genrate_appointment_pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:dio/dio.dart';
import '../../domain/entities/appointment_details.dart';

class GenerateAppointmentPdfImpl implements GenerateAppointmentPdf {
  final Dio dio;

  GenerateAppointmentPdfImpl(this.dio);

  @override
  Future<Uint8List> call(AppointmentDetails d) async {
    final pdf = pw.Document();

    final imageResponse = await dio.get<List<int>>(d.imageUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    final doctorImage = pw.MemoryImage(Uint8List.fromList(imageResponse.data!));

    pdf.addPage(
      pw.Page(
        margin: const pw.EdgeInsets.all(24),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Patient Details', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            _buildDetailRow('Name', d.name),
            _buildDetailRow('Age', d.age),
            _buildDetailRow('Email', d.email),
            _buildDetailRow('Phone', d.phone),
            _buildDetailRow('Notes', d.notes),

            pw.Divider(height: 40),

            pw.Text('Doctor Details', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 10),
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Image(doctorImage, width: 80, height: 80),
                pw.SizedBox(width: 16),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(d.doctorName, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                    pw.Text(d.department),
                    pw.Text('Gender: ${d.gender}'),
                    pw.Text('Time: ${d.time}'),
                    pw.Text('Location: ${d.location}'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildDetailRow(String title, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 6),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(width: 70, child: pw.Text(title, style: const pw.TextStyle(color: PdfColors.grey))),
          pw.Expanded(child: pw.Text(value, style: pw.TextStyle(fontWeight: pw.FontWeight.normal))),
        ],
      ),
    );
  }
}
