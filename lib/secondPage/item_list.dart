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
                      const Text('Number'),
                      const Spacer(),
                      Text(
                        options.id.toString(),
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
                      const Text('Name'),
                      const Spacer(),
                      Text(
                        options.symbol.toString(),
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
                      const Text('Currency Symbol'),
                      const Spacer(),
                      Text(
                        options.currencySymbol.toString(),
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
                      const Text('Type'),
                      const Spacer(),
                      Text(
                        options.type.toString(),
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
                      const Text('Rate Usd'),
                      const Spacer(),
                      Text(
                        options.rateUsd.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
