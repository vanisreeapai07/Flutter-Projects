import 'package:flutter/material.dart';

class cardview extends StatelessWidget {
  const cardview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        toolbarHeight: 80,
        title: const Text('Card View'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 26, left: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 40),
                    decoration: const BoxDecoration(color: Colors.blue),
                    height: 180,
                    width: 150,
                    child: const Text(
                      'Item 1',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 40),
                    decoration: const BoxDecoration(color: Colors.blue),
                    height: 180,
                    width: 150,
                    child: const Text(
                      'Item 2',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 40),
                    decoration: const BoxDecoration(color: Colors.blue),
                    height: 180,
                    width: 150,
                    child: const Text(
                      'Item 3',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 70, left: 40),
                    decoration: const BoxDecoration(color: Colors.blue),
                    height: 180,
                    width: 150,
                    child: const Text(
                      'Item 4',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 26,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 150, top: 60),
                        height: 160,
                        width: 500,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: const Text(
                          'Item 1',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 150, top: 60),
                        height: 160,
                        width: 500,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: const Text(
                          'Item 2',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 150, top: 60),
                        height: 160,
                        width: 500,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: const Text(
                          'Item 3',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 150, top: 60),
                        height: 160,
                        width: 500,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: const Text(
                          'Item 4',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
