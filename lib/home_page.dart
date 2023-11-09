import 'package:book_animation/book.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);

  void _listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.5;
    final bookWidth = size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'My books',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(bg),
          ),
          ValueListenableBuilder(
              valueListenable: _notifierScroll,
              builder: (context, value, child) {
                debugPrint('build value');
                return PageView.builder(
                  controller: _controller,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    final percentage = index - value;
                    final rotation = percentage.clamp(0.0, 1.0);
                    if (index == 1) {}
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: bookWidth,
                                height: bookHeight,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 20,
                                      offset: Offset(5.0, 5.0),
                                      spreadRadius: 10,
                                    )
                                  ],
                                ),
                              ),
                              Transform(
                                alignment: Alignment.centerLeft,
                                transform: Matrix4.identity()
                                  ..setEntry(3, 2, 0.002)
                                  ..rotateY(1.5 * rotation)
                                  ..translate(-rotation * size.width * 0.8)
                                  ..scale(1 + rotation),
                                child: Image.asset(
                                  book.image,
                                  fit: BoxFit.cover,
                                  height: bookHeight,
                                  width: bookWidth,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            book.title,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "By ${book.author}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}
