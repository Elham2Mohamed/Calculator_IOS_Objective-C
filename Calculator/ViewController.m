//
//  ViewController.m
//  Calculator
//
//  Created by Elham on 13/04/2024.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (nonatomic, strong) NSMutableString *currentInput;
@property (nonatomic, assign) double currentValue;
@property (nonatomic, assign) double result;
@property (nonatomic, assign) char operator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentInput = [NSMutableString string];
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.titleLabel.text;
    [self.currentInput appendString:digit];
    [self updateDisplay];
}

- (IBAction)operatorPressed:(UIButton *)sender {
    self.currentValue = self.currentInput.doubleValue;
    self.operator = [sender.titleLabel.text characterAtIndex:0];
    [self.currentInput setString:@""];
}

- (IBAction)equalsPressed:(UIButton *)sender {
    double secondOperand = self.currentInput.doubleValue;
    switch (self.operator) {
        case '+':
            self.result = self.currentValue + secondOperand;
            break;
        case '-':
            self.result = self.currentValue - secondOperand;
            break;
        case '*':
            self.result = self.currentValue * secondOperand;
            break;
        case '%':
            self.result = self.currentValue / 100;//* (secondOperand / 100);
            break;

        case '/':
            if (secondOperand != 0) {
                self.result = self.currentValue / secondOperand;
            } else {
              
                self.result = 0;
            }
            break;
        default:
            break;
    }
    [self.currentInput setString:[NSString stringWithFormat:@"%g", self.result]];
    [self updateDisplay];
}


- (IBAction)changeSign:(id)sender {
    self.currentValue = self.currentInput.doubleValue;
       self.currentValue = -self.currentValue;
    //self.result = -self.result;
    [self.currentInput setString:[NSString stringWithFormat:@"%g", self.currentValue]];
    [self updateDisplay];
}


- (IBAction)clearPressed:(UIButton *)sender {
    [self.currentInput setString:@""];
    [self updateDisplay];
}

- (void)updateDisplay {
    self.displayLabel.text = self.currentInput;
}
- (IBAction)decimalPressed:(UIButton *)sender {
    if (![self.currentInput containsString:@"."]) {
     [ self.currentInput appendString: @"0."];
        [self updateDisplay];
    }
}

- (IBAction)deletePressed:(UIButton *)sender {
    if ([self.currentInput length] > 0) {
        [self.currentInput deleteCharactersInRange:NSMakeRange([self.currentInput length] - 1, 1)];
        [self updateDisplay];
    }
}
@end
