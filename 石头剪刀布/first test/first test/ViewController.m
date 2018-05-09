//
//  ViewController.m
//  first test
//
//  Created by 金汉东 on 2018/4/22.
//  Copyright © 2018年 金汉东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *TopButton;
@property (weak, nonatomic) IBOutlet UIButton *TitleButton;
@property (weak, nonatomic) IBOutlet UIButton *Startbuton;
@property (weak, nonatomic) IBOutlet UIButton *A1Button;
@property (weak, nonatomic) IBOutlet UIButton *A2Button;
@property (weak, nonatomic) IBOutlet UIButton *A3Button;
@property (weak, nonatomic) IBOutlet UIProgressView *BottomButton;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic, assign) NSInteger playerTag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.playerTag = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)playerBtnClick:(UIButton *)sender {
    self.playerTag = sender.tag;
    
    sender.layer.borderColor = [UIColor purpleColor].CGColor;
    sender.layer.borderWidth = 2.0f;
}

- (int)computerThink {
    return rand() % 3;
}

- (IBAction)beginBtnClick:(id)sender {
    
    if ( !self.playerTag ) {
        self.resultLabel.text = @"请选择出法";
        return ;
    }
    self.A1Button.layer.borderColor = [UIColor whiteColor].CGColor;
    self.A2Button.layer.borderColor = [UIColor whiteColor].CGColor;
    self.A3Button.layer.borderColor = [UIColor whiteColor].CGColor;

    int computerTag = [self computerThink];
    
    NSInteger result = self.playerTag + computerTag;
    
    if (result==6||result==7||result==11)
        self.resultLabel.text=@"You Win!";
    else if (result==5||result==9||result==10)
        self.resultLabel.text=@"Computer Win!";
    else
        self.resultLabel.text=@"平手";

}




@end
