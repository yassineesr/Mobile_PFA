import 'package:flutter/material.dart';

/*class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginFormVisible = true;

  void _toggleForm() {
    setState(() {
      _isLoginFormVisible = !_isLoginFormVisible;
    });
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
       TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        hintText: 'Enter your email',
      ),
        ),
         SizedBox(height: 20),
        TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        hintText: 'Enter your Password',
      ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Perform login action
          },
          child: Text('Login'),
        ),
        TextButton(
          onPressed: () {
            _toggleForm();
          },
          child: Text('Don\'t have an account? Sign up.'),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
      decoration: InputDecoration(
        labelText: 'First Name',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
        hintText: 'First Name',
      ),
        ),
         SizedBox(height: 20),
         TextFormField(
      decoration: InputDecoration(
        labelText: 'Last Name',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(),
        hintText: 'Last Name',
      ),
        ),
         SizedBox(height: 20),
       TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
        hintText: 'Enter your email',
      ),
        ),
         SizedBox(height: 20),
        TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        hintText: 'Enter your Password',
      ),
        ),
         SizedBox(height: 20),
        TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
        hintText: 'Confirm your Password',
      ),
        ),
        
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Perform sign up action
          },
          child: Text('Sign up'),
        ),
        TextButton(
          onPressed: () {
            _toggleForm();
          },
          child: Text('Already have an account? Login.'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sing Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: _isLoginFormVisible ? _buildLoginForm() : _buildSignUpForm(),
      ),
    );
  }
}*/
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoginPage = true; // Variable to track the current page

  void togglePage() {
    setState(() {
      isLoginPage = !isLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLoginPage
            ? 'Login'
            : 'Sign Up'), // Change app bar title based on the current page
        centerTitle: true,
      ),
       body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            isLoginPage ? _buildLoginForm() : _buildSignUpForm(), // Conditionally display login or sign-up form
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform login or sign-up action based on the current page
              },
              child: Text(isLoginPage ? 'Login' : 'Sign up'),
            ),
            TextButton(
              onPressed: togglePage,
              child: Text(isLoginPage ? 'Don\'t have an account? Sign up.' : 'Already have an account? Login.'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
            hintText: 'Enter your email',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Enter your password',
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'First Name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
            hintText: 'First Name',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Last Name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
            hintText: 'Last Name',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(),
            hintText: 'Enter your email',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Enter your password',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: Icon(Icons.lock),
            border: OutlineInputBorder(),
            hintText: 'Confirm your password',
          ),
        ),
      ],
    );
  }
}