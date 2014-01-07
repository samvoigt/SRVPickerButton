//
//  ViewController.m
//  SRVPickerButtonDemo
//
//  Created by Samuel Voigt on 1/7/14.
//  Copyright (c) 2014 Sam Voigt. All rights reserved.
//

#import "ViewController.h"
#import "SRVPickerButton.h"

@interface ViewController () <SRVPickerButtonDelegate>

@property (weak, nonatomic) IBOutlet SRVPickerButton *selectStateButton;
@property (strong, nonatomic) NSArray *citiesList;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.citiesList = @[@"Hartford", @"Boston", @"Chicago", @"Los Angeles", @"Miami", @"New York", @"San Francisco"];
    self.selectStateButton.delegate = self;
}

#pragma mark - SRVPickerButtonDelegate

- (NSInteger)numberOfRowsInPickerButton:(SRVPickerButton *)pickerButton
{
    return self.citiesList.count;
}

- (NSString *)pickerButton:(SRVPickerButton *)pickerButton titleForRow:(NSInteger)row
{
    return self.citiesList[row];
}

- (void)pickerButton:(SRVPickerButton *)pickerButton didSelectRow:(NSInteger)row
{
    [pickerButton setTitle:self.citiesList[row] forState:UIControlStateNormal];
}

@end
