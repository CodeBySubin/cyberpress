import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';
import 'package:healthsync/core/widgets/button_widget.dart';
import 'package:healthsync/core/widgets/loader.dart';
import 'package:healthsync/core/widgets/networkimage.dart';
import 'package:healthsync/features/doctors/features/controllers/doctor_detail_conroller.dart';
import 'package:healthsync/features/doctors/features/pages/label_value.dart';

class DoctorDetailsPage extends StatelessWidget {
  final String id;

  const DoctorDetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DoctorDetailController>(
        initState: (_) {},
        didChangeDependencies: (state) => state.controller!.loadDoctorById(id),
        builder: (controller) {
          return AppLoader(
            isLoading: controller.isLoading,
            child: Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: networkImageWidget(controller.doctor!.image),
                ),

                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.translate(
                    offset: const Offset(0, -30),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.61,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 15,
                        right: 15,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.doctor!.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                controller.doctor!.gender,
                                style: AppTextStyles.smallGreyText,
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),
                          Text(
                            controller.doctor!.department,
                            style: AppTextStyles.mediumGreyText,
                          ),

                          const SizedBox(height: 20),
                          const Text(
                            AppStrings.about,
                            style: AppTextStyles.smallBlacktext,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "The holder of an accredited academic degree • A medical practitioner, including: Audiologist • Dentist • Optometrist • Physician • Other roles\n \nThe holder of an accredited academic degree • A medical practitioner, including: Audiologist • Dentist • Optometrist • Physician • Other roles",
                            style: AppTextStyles.smallGreyText,
                          ),

                          const SizedBox(height: 40),
                          LabelValueRow(
                            label: AppStrings.lowerTime,
                            value: controller.doctor!.time,
                          ),
                          const SizedBox(height: 10),
                          LabelValueRow(
                            label: "${AppStrings.location}:",
                            value: controller.doctor!.location,
                          ),
                          const Spacer(),
                          TextButtonWidget(
                            textStyle: AppTextStyles.buttonWhiteText,
                            size: Size(double.infinity, 50),
                            text: AppStrings.bookAnAppoinment,
                            onPressed: () {},
                            borderRadius: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
