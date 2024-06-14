import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _itemListState();
}

class _itemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 24),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Заголовок'),
                  Text('Описание'),
                ],
              ),
              const Spacer(),
              const Text('32,12'),
            ],
          ),
        ),
      ),
    );
  }
}
