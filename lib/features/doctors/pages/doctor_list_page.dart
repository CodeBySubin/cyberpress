import 'package:flutter/material.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/widgets/widgets.dart';

class DoctorListPage extends StatelessWidget {
  const DoctorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: AppStrings.doctors,
        showBack: false,
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.picture_as_pdf), onPressed: () {}),
        ],
      ),

      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 10,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 80,
                child: Column(children: [
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
