import 'package:flutter/material.dart';
import 'package:task_1/secondPage/model.dart';

class ItemListSecond extends StatelessWidget {
  final Options options;

  const ItemListSecond({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Container(
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
          padding:
              const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Text('Open'),
                      const Spacer(),
                      Text(
                        options.open.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Close'),
                      const Spacer(),
                      Text(
                        options.close.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Divider(
                color: Colors.grey.withOpacity(0.2),
              ),
              const SizedBox(height: 4),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('High'),
                      const Spacer(),
                      Text(
                        options.high.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Low'),
                      const Spacer(),
                      Text(
                        options.low.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Divider(
                color: Colors.grey.withOpacity(0.2),
              ),
              const SizedBox(height: 4),
              Column(
                children: [
                  Row(
                    children: [
                      const Text('Period'),
                      const Spacer(),
                      Text(
                        options.period.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Volume'),
                      const Spacer(),
                      Text(
                        options.volume.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
