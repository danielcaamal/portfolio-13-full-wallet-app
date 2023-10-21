import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/src/domain/domain.dart';
import 'package:wallet_app/src/presentation/presentation.dart';
import 'package:wallet_app/src/presentation/utils/human_formats.dart';
import 'package:wallet_app/src/presentation/utils/mock-values.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AccountScreen extends StatelessWidget {
  static const name = 'account';
  static const route = 'account';
  final String id;

  const AccountScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final account = MockValues.GetMockAccountDetailById(id);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              iconsEnum[account.icon] ?? Icons.monetization_on_outlined,
              color: HumanFormats.hexToColor(account.color),
            ),
            const SizedBox(width: 10),
            Text(account.description),
            const Spacer(),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CardItem(
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: _AccountForm(
                    account: account,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class _AccountForm extends StatelessWidget {
  _AccountForm({
    super.key,
    required this.account,
  });

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final Account account;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FormBuilderTextField(
                    valueTransformer: (value) =>
                        value != null ? double.parse(value) : 0,
                    name: 'total',
                    decoration:
                        _getInputFormDecoration(context, 'Account Total'),
                    initialValue: account.amount.toString(),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'account-name',
                    decoration:
                        _getInputFormDecoration(context, 'Account Name'),
                    initialValue: account.description,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(50),
                    ]),
                  ),
                  account.lastTransaction != null
                      ? _AccountLastTransaction(account: account)
                      : const SizedBox(height: 0, width: 0),
                  AccountIconCatalog(account: account),
                  AccountColorPicker(account: account),
                  FormBuilderCheckbox(
                    title: const Text('Include in Balance'),
                    name: 'account-include-in-balance',
                    initialValue: account.includeInBalance,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _formKey.currentState?.reset();
                          context.pop();
                        },
                        child: Text('Dismiss',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize ??
                                    30)),
                      ),
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          // Validate and save the form values
                          _formKey.currentState?.saveAndValidate();
                          debugPrint(_formKey.currentState?.value.toString());

                          // On another side, can access all field values without saving form with instantValues
                          _formKey.currentState?.validate();
                          debugPrint(
                              _formKey.currentState?.instantValue.toString());
                        },
                        child: Text('Save',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .fontSize ??
                                    30)),
                      )
                    ],
                  ),
                  // SaveButton
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  InputDecoration _getInputFormDecoration(
      BuildContext context, String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
          color: Colors.black,
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize ?? 14),
    );
  }
}

class AccountColorPicker extends StatefulWidget {
  const AccountColorPicker({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  State<AccountColorPicker> createState() => _AccountColorPickerState();
}

class _AccountColorPickerState extends State<AccountColorPicker> {
  Color pickerColor = Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor = HumanFormats.hexToColor(widget.account.color);
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          'Account Color',
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize ?? 14),
        ),
        const SizedBox(height: 10),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: currentColor,
            ),
            child: TextButton(
              child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.color_lens,
                    color: Colors.white,
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Pick a color!'),
                    content: SingleChildScrollView(
                      child: ColorPicker(
                        pickerColor: pickerColor,
                        onColorChanged: changeColor,
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Got it'),
                        onPressed: () {
                          setState(() => currentColor = pickerColor);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            )),
      ],
    );
  }
}

class AccountIconCatalog extends StatelessWidget {
  const AccountIconCatalog({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      Text(
        'Account Icon',
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize ?? 14),
      ),
      FormBuilderChoiceChip<String>(
        name: 'account-icon',
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Please select an icon'),
        ]),
        selectedColor: Theme.of(context).primaryColor,
        initialValue: account.icon,
        options: [
          _AccountIconCatalogoItem('account_balance', account.icon,
              iconsEnum['account_balance'] ?? Icons.monetization_on_outlined),
          _AccountIconCatalogoItem('account_balance_2', account.icon,
              iconsEnum['account_balance_2'] ?? Icons.monetization_on_outlined),
          _AccountIconCatalogoItem('account_balance_4', account.icon,
              iconsEnum['account_balance_4'] ?? Icons.monetization_on_outlined),
          _AccountIconCatalogoItem('account_balance_5', account.icon,
              iconsEnum['account_balance_5'] ?? Icons.monetization_on_outlined),
          _AccountIconCatalogoItem('account_balance_6', account.icon,
              iconsEnum['account_balance_6'] ?? Icons.monetization_on_outlined),
          _AccountIconCatalogoItem('account_balance_7', account.icon,
              iconsEnum['account_balance_7'] ?? Icons.monetization_on_outlined),
        ],
      ),
    ]);
  }

  FormBuilderChipOption<String> _AccountIconCatalogoItem(
      String value, String key, IconData icon) {
    return FormBuilderChipOption(
      value: value,
      child: Icon(
        icon,
        color:
            key == value ? HumanFormats.hexToColor(account.color) : Colors.grey,
      ),
    );
  }
}

class _AccountLastTransaction extends StatelessWidget {
  const _AccountLastTransaction({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      Text(
        'Last Transaction',
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize ?? 14),
      ),
      const SizedBox(height: 10),
      TransactionListViewItem(transaction: account.lastTransaction!)
    ]);
  }
}
