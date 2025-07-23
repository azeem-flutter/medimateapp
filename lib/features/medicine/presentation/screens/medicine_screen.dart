import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medimate_app/features/medicine/controller/medicine_controller.dart';
import 'package:medimate_app/features/medicine/presentation/widgets/medicine_form.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicineScreenController());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        title: Text(
          "My Medicines",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        //   backgroundColor: Color.fromARGB(255, 1, 66, 66),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "Search medicines...",
                prefixIcon: const Icon(Iconsax.search_normal),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 💊 Medicine List
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: controller.filteredMedicines.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final medicine = controller.filteredMedicines[index];
                    final stock = medicine['stock'] as int;

                    Color cardColor;
                    if (stock == 0) {
                      cardColor = Colors.red.shade100;
                    } else if (stock < 3) {
                      cardColor = Colors.orange.shade100;
                    } else {
                      cardColor = Colors.white;
                    }

                    return Container(
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name + Stock
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                medicine['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Stock: $stock",
                                style: TextStyle(
                                  color: stock == 0
                                      ? Colors.red
                                      : stock < 3
                                      ? Colors.orange
                                      : Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text("🕒 ${medicine['timing']}"),
                          const SizedBox(height: 4),
                          Text(
                            "📅 Expires: ${medicine['expiry']}",
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Iconsax.edit),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Iconsax.trash),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Iconsax.add,
          size: 32,
          color: Color.fromARGB(255, 243, 119, 4),
        ),
        onPressed: () => Get.to(() => MedicineFormScreen()),
      ),
    );
  }
}
