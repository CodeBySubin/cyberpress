import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/widgets/widgets.dart';
import 'package:healthsync/features/appoinments/presentation/controllers/pdf_controller.dart';
import 'package:healthsync/features/appoinments/presentation/widgets/pdf_view.dart';

class StoredPdfsPage extends StatelessWidget {
  const StoredPdfsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final StoredPdfController controller = Get.find<StoredPdfController>();

    return Scaffold(
      appBar: CommonAppBar(title: AppStrings.pdfList, centerTitle: true),
      body: Obx(() => _buildBody(context, controller)),
    );
  }

  Widget _buildBody(BuildContext context, StoredPdfController controller) {
    if (controller.isLoading.value) {
      return _buildLoadingState();
    }

    if (controller.pdfFiles.isEmpty) {
      return _buildEmptyState();
    }

    return _buildPdfList(controller);
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.picture_as_pdf, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No stored PDFs found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your PDF documents will appear here',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildPdfList(StoredPdfController controller) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: controller.pdfFiles.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder:
          (context, index) =>
              _buildPdfListItem(context, controller.pdfFiles[index]),
    );
  }

  Widget _buildPdfListItem(BuildContext context, dynamic file) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: _buildPdfIcon(),
        title: Text(
          file.name,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            file.path,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () => _handlePdfTap(file.path),
      ),
    );
  }

  Widget _buildPdfIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 243, 243),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(AppImages.pdfImage, width: 30, height: 30),
    );
  }

  void _handlePdfTap(String path) {
    Get.to(() => PdfViewerPage(path: path), transition: Transition.cupertino);
  }
}
