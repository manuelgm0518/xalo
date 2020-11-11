import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: Column(
        children: [
          Text('Login'),
          TextFormField(
            controller: controller.emailField,
            validator: (value) => value.isEmpty
                ? 'Este campo es requerido'
                : value.isEmail
                    ? 'Correo no válido'
                    : null,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(MdiIcons.email),
              labelText: 'Correo electrónico',
            ),
          ),
          TextFormField(
            controller: controller.emailField,
            validator: (value) => !value.isEmail ? 'Este campo es requerido' : null,
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(MdiIcons.email),
              labelText: 'Contraseña',
            ),
          ),
          RaisedButton.icon(
            onPressed: () => controller.validateForm(),
            icon: Icon(MdiIcons.send),
            label: Text('Ingresar'),
          )
        ],
      ),
    ));
  }
}
