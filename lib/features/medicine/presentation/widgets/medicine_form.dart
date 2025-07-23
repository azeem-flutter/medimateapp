import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medimate_app/core/constants/custom_sizes.dart';
import 'package:medimate_app/core/utils/validator/validation.dart';
import 'package:medimate_app/features/medicine/controller/medicine_form_controller.dart';
import 'package:medimate_app/features/medicine/controller/medicine_reminderfield_controller.dart';

class MedicineFormScreen extends StatelessWidget {
  const MedicineFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final remindercontroller = Get.put(MedicineReminderfieldController());
    final controller = Get.put(MedicineFormController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwitems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Medicine",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 2, 79, 143),
                ),
              ),
              SizedBox(height: AppSizes.spaceBtwitems),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) =>
                          MValidator.validateEmptyText("Medicine name", value),
                      expands: false,
                      decoration: InputDecoration(
                        label: Text("Medicine name"),
                        prefixIcon: Icon(Iconsax.activity),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),
                    TextFormField(
                      validator: (value) =>
                          MValidator.validateEmptyText("Dosage", value),
                      expands: false,
                      decoration: InputDecoration(
                        label: Text("Dosage"),
                        prefixIcon: Icon(Iconsax.weight),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Medicine Type',
                          prefixIcon: Icon(Iconsax.box),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        value: controller.selectedType.value.isEmpty
                            ? null
                            : controller.selectedType.value,
                        hint: Text('Select medicine type'),
                        items: controller.medicineTypes.map((type) {
                          return DropdownMenuItem<String>(
                            value: type,
                            child: Text(type),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedType.value = value ?? '';
                        },
                        validator: (value) => MValidator.validateEmptyText(
                          "Medicine Type",
                          value,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),
                    TextFormField(
                      controller: remindercontroller.timeController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText: 'Reminder Time',
                        prefixIcon: Icon(Icons.access_time),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        TimeOfDay? picketTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picketTime != null) {
                          remindercontroller.selectedTime.value = picketTime;
                          remindercontroller.timeController.text = picketTime
                              .format(context);
                        }
                      },
                    ),

                    SizedBox(height: AppSizes.spaceBtwitems),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: remindercontroller.dateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Start Date',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                remindercontroller.selectedDate.value =
                                    pickedDate;
                                remindercontroller.dateController.text =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              }
                            },
                          ),
                        ),
                        SizedBox(width: AppSizes.spaceBtwitems),
                        Expanded(
                          child: TextFormField(
                            controller: remindercontroller.endDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'End Date',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                remindercontroller.endDate.value = pickedDate;
                                remindercontroller.dateController.text =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.spaceBtwitems),

                    Row(
                      children: [
                        Obx(
                          () => Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                labelText: 'Stock Unit',
                                prefixIcon: Icon(Iconsax.box),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              value: controller.selectedUnits.value.isEmpty
                                  ? null
                                  : controller.selectedUnits.value,
                              hint: Text('Tablets'),
                              items: controller.stockUnitstypes.map((type) {
                                return DropdownMenuItem<String>(
                                  value: type,
                                  child: Text(type),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.selectedUnits.value = value ?? '';
                              },
                              validator: (value) =>
                                  MValidator.validateEmptyText(
                                    "Medicine Type",
                                    value,
                                  ),
                            ),
                          ),
                        ),

                        SizedBox(width: AppSizes.spaceBtwitems),
                        Expanded(
                          child: TextFormField(
                            controller: remindercontroller.expiryDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: 'Expiry Date',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                remindercontroller.expiryDate.value =
                                    pickedDate;
                                remindercontroller.expiryDateController.text =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              }
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.spaceBtwitems),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Save"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
