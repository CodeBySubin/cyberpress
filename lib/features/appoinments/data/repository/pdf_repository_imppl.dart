import 'package:healthsync/features/appoinments/domain/repository/stored_pdf_file.dart';
import 'package:path_provider/path_provider.dart';
import '../../domain/entities/stored_pdf_file.dart';


class PdfRepositoryImpl implements PdfRepository {
  @override
  Future<List<StoredPdfFile>> getStoredPdfs() async {
    final dir = await getApplicationDocumentsDirectory();
    final files = dir.listSync();

    final pdfs = files.where((file) =>
        file.path.endsWith('.pdf') && file.path.contains('appointment_'));

    return pdfs
        .map((file) => StoredPdfFile(
              name: file.path.split('/').last,
              path: file.path,
            ))
        .toList();
  }
}
