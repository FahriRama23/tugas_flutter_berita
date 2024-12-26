import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _news = [
    {
      'image': 'https://th.bing.com/th/id/OIP.zTtNU8pGY-FAhBBvvDnI5wHaDt?w=346&h=175&c=7&r=0&o=5&pid=1.7',
      'title': 'Breaking News: Flutter is awesome!',
      'description': 'Flutter has emerged as a revolutionary framework in the tech world. Its ability to build cross-platform applications with a single codebase has not only simplified the development process but also made it faster and more efficient. Companies worldwide are embracing Flutter for its versatility and performance. Developers appreciate its extensive library of widgets, seamless integration, and vibrant community support. As Flutter continues to evolve, it promises to open new avenues in application development, making it a preferred choice for modern developers.',
    },
    {
      'image': 'https://th.bing.com/th/id/OIP.WJwnFvoPIEZ5XRPthFfJvQAAAA?w=276&h=180&c=7&r=0&o=5&pid=1.7',
      'title': 'Dart makes programming fun!',
      'description': 'Dart, the programming language behind Flutter, has proven to be a game-changer in modern software development. Its simple syntax and robust performance make it an ideal choice for creating scalable and maintainable code. Dart’s unique features, such as its strong typing system and asynchronous programming capabilities, ensure smooth and efficient app performance. As developers explore its full potential, Dart continues to gain popularity as a reliable and enjoyable language for building complex applications.',
    },
    {
      'image': 'https://th.bing.com/th/id/OIP.t6e8pQ1UT7kyae4suBq0MAHaEK?rs=1&pid=ImgDetMain',
      'title': 'Flutter 3.0 is now available.',
      'description': 'Flutter 3.0 marks a significant milestone in the journey of this powerful framework. With the introduction of new features such as better performance optimization, enhanced debugging tools, and support for more platforms, Flutter 3.0 sets a new benchmark in application development. Developers can now create even more sophisticated and feature-rich applications with minimal effort. This latest version also focuses on improving accessibility and usability, ensuring that apps built with Flutter reach a broader audience and deliver exceptional user experiences.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _news.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        _news[index]['image']!,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _news[index]['title']!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          _news[index]['description']!,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 14.0, color: Colors.grey[700]),
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
