

import 'package:flutter/material.dart';
import 'package:todo_list/presentation/widgets/custom_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
      super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel
      });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                    hintText: "Tambah Tugas Baru",),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      text: "Simpan",
                      onPressed: onSave,
                    ),
                    const SizedBox(width: 4),
                    CustomButton(
                      text: "Batal",
                      onPressed: onCancel,
                    )
                  ],
                ),
          ],
        ),
      ),
    );
  }
}