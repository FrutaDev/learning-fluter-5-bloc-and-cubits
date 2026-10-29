import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/infrastructure/validators/inputs.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String name = "register_screen";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Screen"),
      ),
      body: BlocProvider(
              create: (context) => RegisterCubit(),
              child: const _RegisterView(),
            ),
    );
  }
}


class _RegisterView extends StatelessWidget {
  const _RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FlutterLogo(size: 100,),
            _RegisterForm()
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.watch<RegisterCubit>();
    final Username username = registerCubit.state.userName;
    final Password password = registerCubit.state.password;
    final Email email = registerCubit.state.email;

    return Form(
        child : Column(
          children: [

            CustomTextFormField(
              label: "Nombre de usuario",
              hint: "unique_username",
              onChange: registerCubit.usernameChanged,
              errorMessage: username.errorMessage
            ),

            SizedBox(height: 10,),

            CustomTextFormField(
              label: "Correo electrónico",
              hint: "example@email.com",
              onChange: registerCubit.emailChanged,
              errorMessage: email.errorMessage,
            ),

            SizedBox(height: 10,),

            CustomTextFormField(
              label: "Contraseña",
              hint: "********",
              obscureText: true,
              onChange: registerCubit.passwordChanged,
              errorMessage: password.errorMessage
            ),

            const SizedBox(height: 20,),

            FilledButton.tonalIcon(
              onPressed: () {
                registerCubit.onSubmit();
              },
              icon: Icon(Icons.person_add_alt_1),
              label: const Text("Guardar")
            ),
          ],
        )
      );
  }
}

