import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: widget.controller,
          decoration: const InputDecoration(
            hintText: "Tambah Tugas Baru",
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Tidak boleh kosong";
            }
            return null;
          },
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave();
            }
          },
          child: const Text("Simpan"),
        ),
        ElevatedButton(
          onPressed: widget.onCancel,
          child: const Text("Batal"),
        ),
      ],  
    );
  }
}
