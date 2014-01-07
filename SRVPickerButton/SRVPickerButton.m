//
//  SRVPickerButton.m
//
//  Created by Samuel Voigt on 1/7/2014.
//  Copyright (c) 2014 Sam Voigt. All rights reserved.
//

#import "SRVPickerButton.h"

@interface SRVPickerButton ()

@property (nonatomic, readwrite, strong) UIView *inputView;
@property (nonatomic, readwrite, strong) UIView *inputAccessoryView;

@property (nonatomic) NSInteger row;

@end

@implementation SRVPickerButton

#pragma mark - Init/Setup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    [self addTarget:self action:@selector(becomeFirstResponder) forControlEvents:UIControlEventTouchUpInside];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

#pragma mark - Input/Accessory Custom Getters

- (UIView *)inputView
{
    if (!_inputView)
    {
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.showsSelectionIndicator = YES;
        _inputView = pickerView;
    }
    [(UIPickerView *)_inputView reloadAllComponents];
    return _inputView;
}

- (UIView *)inputAccessoryView
{
    if (!_inputAccessoryView)
    {
        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed)];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
        UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        UIToolbar *toolbar = [[UIToolbar alloc] init];
        [toolbar sizeToFit];
        
        [toolbar setItems:@[cancelButton, spacer, doneButton]];
        
        _inputAccessoryView = toolbar;
    }
    return _inputAccessoryView;
}

#pragma mark - Delegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.delegate numberOfRowsInPickerButton:self];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.row = row;
    if ([self.delegate respondsToSelector:@selector(pickerButton:scrolledToRow:)])
    {
        [self.delegate pickerButton:self scrolledToRow:row];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.delegate pickerButton:self titleForRow:row];
}

- (void)doneButtonPressed
{
    [self.delegate pickerButton:self didSelectRow:self.row];
    [self resignFirstResponder];
}

- (void)cancelButtonPressed
{
    if ([self.delegate respondsToSelector:@selector(pickerButtonDidCancel:)])
    {
        [self.delegate pickerButtonDidCancel:self];
    }
    [self resignFirstResponder];
}

#pragma mark - Picker Methods
- (void)setSelectedRow:(NSInteger)row
{
    UIPickerView *picker = (UIPickerView *)self.inputView;
    [picker selectRow:row inComponent:0 animated:NO];
}

@end
