import 'package:flutter/material.dart';

class Fashioncategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FashionCategoriesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FashionCategoriesScreen extends StatelessWidget {
  final List<Category> categories = [
    Category('Men\'s Dress', 'image/mendress.png'),
    Category('Women\'s Dress', 'image/womendress.png'),
    Category('Shoes', 'image/shoe.png'),
    Category('Sandals', 'image/sandal.png'),
    Category('Accessories', 'image/acceseries.png'),
    Category('Seasonal', 'image/seasonal.png'),
    Category('Men\'s Cultural & Ethnic', 'image/menethnics.png'),
    Category('Women\'s Cultural & Ethnic', 'image/womenethnic.png'),
    Category('Perfumes and Deodarant', 'image/perfumes.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Categories'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button tap
              showSearch(context: context, delegate: FashionSearchDelegate());
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return CategoryTile(categories[index]);
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Category {
  final String name;
  final String imagePath;

  Category(this.name, this.imagePath);
}

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle category tap, navigate to specific category screen, etc.
      },
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              category.imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class FashionSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Fashioncategory()));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results UI
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions UI
    return Center(
      child: Text('Suggestions for: $query'),
    );
  }
}
