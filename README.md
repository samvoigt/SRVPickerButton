#SRVPickerButton

A UIButton that can become first responder and present a picker

###Usage:

(see sample Xcode project in `/SRVPickerButtonDemo`)

SRVPickerButtons can be used in IB or in code, and can be subclassed. Each button must have a delegate that subscribes to the SRVPickerButttonDelegate protocol, and implements the following methods:

```objc
- (NSInteger)numberOfRowsInPickerButton:(SRVPickerButton *)pickerButton;
- (NSString *)pickerButton:(SRVPickerButton *)pickerButton titleForRow:(NSInteger)row;
- (void)pickerButton:(SRVPickerButton *)pickerButton didSelectRow:(NSInteger)row;
```

Additionally, there are the following optional delegate methods:

```objc
- (void)pickerButtonDidCancel:(SRVPickerButton *)pickerButton;
- (void)pickerButton:(SRVPickerButton *)pickerButton scrolledToRow:(NSInteger)row;
```

These are all similar to UIPickerButton Datasource/Delegate methods, with the exception being that the UIPickerDelegate didSelectRow corresponds to the SRVPickerButton didScrollToRow.