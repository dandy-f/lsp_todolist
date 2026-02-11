import 'package:flutter/material.dart';

class ConfirmBox extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  
  const ConfirmBox({super.key, required this.onCancel, required this.onConfirm});  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Hapus Tugas'),
      content: const Text('Apakah Anda yakin ingin menghapus tugas ini?'),
      actions: [
        TextButton(onPressed: onCancel, child: const Text('Batal')),
        TextButton(onPressed: onConfirm, child: const Text('Hapus')),
      ],
    );
  }
}
class ConfirmDone extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;
  final bool isDone;

  const ConfirmDone({super.key,required this.onCancel,required this.onConfirm,required this.isDone,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Status'),
      content: Text(
        isDone
            ? 'Apakah anda yakin mengubah Selesai ke Belum?'
            : 'Apakah anda yakin mengubah Belum ke Selesai?',
      ),
      actions: [
        TextButton(onPressed: onCancel, child: const Text('Cancel')),
        TextButton(onPressed: onConfirm, child: const Text('Yes')),
      ],
    );
  }
}