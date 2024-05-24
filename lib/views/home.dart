import 'package:flutter/material.dart';
import '../components/article.dart';
import '../model/article_model.dart';
import '../service/remote_service.dart';
import 'package:flutter/cupertino.dart';

import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel>? articles;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    try {
      final List<ArticleModel>? fetchedArticles =
          await RemoteService.getArticles();
      setState(() {
        articles = fetchedArticles;
      });
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechCrunch News'),
        backgroundColor: Colors.amber[200],
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.question_circle),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutView()));
            },
          ),
        ],
      ),
      body: articles == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : articles!.isEmpty
              ? const Center(
                  child: Text('No articles available'),
                )
              : ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(
                      article: articles![index],
                    );
                  },
                ),
    );
  }
}
