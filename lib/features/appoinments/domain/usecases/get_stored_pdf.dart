import 'package:healthsync/features/appoinments/domain/repository/stored_pdf_file.dart';

import '../entities/stored_pdf_file.dart';

class GetStoredPdfs {
  final PdfRepository repository;

  GetStoredPdfs(this.repository);

  Future<List<StoredPdfFile>> call() async {
    return await repository.getStoredPdfs();
  }
}
