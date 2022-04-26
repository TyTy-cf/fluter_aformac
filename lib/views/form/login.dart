
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

/// Form de type FormBuilder
///
/// Pensez à bien avoir lancé les commandes suivantes :
///
/// - flutter pub add flutter_form_builder
/// - flutter pub add form_builder_validators
///
class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  State createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormBuilderState>();
  Icon iconValidation = const Icon(Icons.check);
  Color primary = CustomColor.bluePokemon;
  bool hidePassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Se connecter'),
        ),
        body: Column(
          children: [
            // Flexible s'utilise seulement dans Column / Row
            Flexible(
                flex: 1,
                child: Wrap(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: FormBuilder(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                name: 'email',
                                decoration: const InputDecoration(
                                  // Placeholder de votre input
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  icon: Icon(Icons.email)
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: "Veuillez renseigner un email"
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: "Veuillez renseigner un email valide"
                                  ),
                                ])
                              ),
                              FormBuilderTextField(
                                name: 'password',
                                // masque le contenu de l'input
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                  // Placeholder de votre input
                                  hintText: 'Password',
                                  labelText: 'Password',
                                  icon: const Icon(Icons.password),
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() {
                                      hidePassword = !hidePassword;
                                    }),
                                    icon: hidePassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off)
                                  )
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: "Veuillez renseigner un mot de passe"
                                  ),
                                  FormBuilderValidators.minLength(
                                    6,
                                    errorText: "Un mot de passe doit faire minimum 6 caractères"
                                  ),
                                ]),
                              ),
                            ],
                          )
                        )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          // Icon a tous les incones nécessaires pour une application
                          child: iconValidation,
                          style: ElevatedButton.styleFrom(
                            // onSurface : change la couleur du bouton si disable
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical:  10.0,
                                horizontal: 16.0
                              ),
                              primary: primary
                          ),
                          onPressed: () {
                            // etat du formulaire
                            final formState = _formKey.currentState;
                            if (formState != null) {
                              if (formState.saveAndValidate()) {
                                setState(() {
                                  iconValidation = const Icon(Icons.check);
                                  primary = CustomColor.bluePokemon;
                                });
                                print(formState.fields['email']?.value);
                                print(formState.fields['password']?.value);
                              } else {
                                setState(() {
                                  iconValidation = const Icon(Icons.cancel);
                                  primary = Colors.red;
                                });
                              }
                            }
                          },
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        )
    );
  }
}