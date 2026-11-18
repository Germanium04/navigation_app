import 'package:flutter/material.dart';
import 'post.dart';

class CreatePostSheet extends StatefulWidget {
  final String username;

  const CreatePostSheet({
    super.key,
    required this.username,
  });

  @override
  State<CreatePostSheet> createState() => _CreatePostSheetState();
}

class _CreatePostSheetState extends State<CreatePostSheet> {
  static const Color maroon = Color.fromARGB(255, 112, 33, 60);

  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  String? _captionError;
  String? _urlError;

  void submitPost() {
    final String caption = _captionController.text.trim();
    final String imageUrl = _imageController.text.trim();

    if (caption.isEmpty || imageUrl.isEmpty) {
      setState(() {
        _captionError = caption.isEmpty ? 'Enter a caption.' : null;
        _urlError = imageUrl.isEmpty ? 'Enter an image URL.' : null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Complete both fields before submitting!'),
        ),
      );
      return;
    }

    final uri = Uri.tryParse(imageUrl);

    if (uri == null ||
        !uri.hasAuthority ||
        (uri.scheme != 'https' && uri.scheme != 'http')) {
      setState(() {
        _captionError = null;
        _urlError = 'Enter a valid HTTP or HTTPS image URL.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter a valid HTTP or HTTPS image URL.'),
        ),
      );
      return;
    }

    final Post newPost = Post(
      username: widget.username,
      caption: caption,
      imageUrl: imageUrl,
    );

    Navigator.pop(context, newPost);
  }

  @override
  void dispose() {
    _captionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create Post',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _captionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Caption',
                errorText: _captionError,
                prefixIcon: const Icon(Icons.edit, color: maroon),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _imageController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Image URL',
                errorText: _urlError,
                prefixIcon: const Icon(Icons.image, color: maroon),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submitPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: maroon,
                foregroundColor: Colors.white,
              ),
              child: const Text('Submit Post'),
            ),
          ],
        ),
      ),
    );
  }
}