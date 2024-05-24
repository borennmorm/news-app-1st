import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/article_model.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title!),
        backgroundColor: Colors.amber[200],
      ),
      body: article == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        article.urlToImage,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      article.title!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range, color: Colors.grey[600]),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy')
                              .format(DateTime.parse(article.publishedAt)),
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Icon(Icons.person, color: Colors.grey[600]),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          article.author,
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      article.description,
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(article.content),
                  ],
                ),
              ),
            ),
    );
  }
}
