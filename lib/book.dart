class Book {
  final String title;
  final String author;
  final String image;

  Book({required this.title, required this.author, required this.image});
}

const _bookAsset = 'assets/covers';
const bg = 'assets/bg.png';
final books = [
  Book(
      title: 'Wink poppy Midnight',
      author: 'April genevieve Tucholke',
      image: '$_bookAsset/book1.jpg'),
  Book(
      title: 'Books name 2',
      author: 'Book author 2',
      image: '$_bookAsset/book2.jpg'),
  Book(
      title: 'Books name 3',
      author: 'Book author 3',
      image: '$_bookAsset/book3.jpg'),
  Book(
      title: 'Books name 4',
      author: 'Book author 4',
      image: '$_bookAsset/book4.jpg'),
  Book(
      title: 'Books name 5',
      author: 'Book author 5',
      image: '$_bookAsset/book5.jpg'),
];
