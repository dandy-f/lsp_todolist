import 'package:flutter/material.dart';

class ListContent extends StatelessWidget {
  final String taskName;
  final String taskStatus;
  final bool taskCompleted;
  Function(bool?)? onChange;
  VoidCallback onEdit;
  VoidCallback onDelete;
  VoidCallback onDone;

  ListContent({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.taskCompleted,
    required this.onChange,
    required this.onEdit,
    required this.onDelete,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BAGIAN KIRI (Nama + Status)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    taskStatus,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: taskCompleted ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            // BAGIAN KANAN (Icon)
            Row(
              children: [
                IconButton(
                  onPressed: onDone,
                  icon: const Icon(Icons.check),
                  color: Colors.green,
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
