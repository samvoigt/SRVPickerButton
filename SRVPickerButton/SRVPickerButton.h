//
//  SRVPickerButton.h
//
//  Created by Samuel Voigt on 1/7/2014.
//  Copyright (c) 2014 Sam Voigt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SRVPickerButton;

@protocol SRVPickerButtonDelegate <NSObject>

- (NSInteger)numberOfRowsInPickerButton:(SRVPickerButton *)pickerButton;
- (NSString *)pickerButton:(SRVPickerButton *)pickerButton titleForRow:(NSInteger)row;

- (void)pickerButton:(SRVPickerButton *)pickerButton didSelectRow:(NSInteger)row;

@optional

- (void)pickerButtonDidCancel:(SRVPickerButton *)pickerButton;
- (void)pickerButton:(SRVPickerButton *)pickerButton scrolledToRow:(NSInteger)row;

@end

@interface SRVPickerButton : UIButton <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, weak) id<SRVPickerButtonDelegate> delegate;

- (void)setSelectedRow:(NSInteger)row;

@end
