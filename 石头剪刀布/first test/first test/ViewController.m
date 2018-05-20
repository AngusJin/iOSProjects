//
//  ViewController.m
//  first test
//
//  Created by 金汉东 on 2018/4/22.
//  Copyright © 2018年 金汉东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *CSore;
@property (weak, nonatomic) IBOutlet UILabel *ComputerLabel;
@property (weak, nonatomic) IBOutlet UIButton *Startbuton;
@property (weak, nonatomic) IBOutlet UIButton *A1Button;
@property (weak, nonatomic) IBOutlet UIButton *A2Button;
@property (weak, nonatomic) IBOutlet UIButton *A3Button;
@property (weak, nonatomic) IBOutlet UIProgressView *PScore;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic, assign) NSInteger playerTag;
@property (weak, nonatomic) IBOutlet UIButton *RestartButton;






@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.PScore.progress=0;
    self.CSore.progress=0;
    self.playerTag = 0;
    _ComputerLabel.hidden=YES;
    _resultLabel.hidden=YES;
    _RestartButton.hidden=YES;
    
}

- (IBAction)playerBtnClick:(UIButton *)sender {
    self.playerTag = sender.tag;
    
    sender.layer.borderColor = [UIColor purpleColor].CGColor;
    sender.layer.borderWidth = 2.0f;
}

- (int)ComputerThink{
    return rand ( ) % 3;
    
}



- (IBAction)beginBtnClick:(id)sender {
    _resultLabel.hidden=NO;
    _RestartButton.hidden=YES;
    if ( !self.playerTag ) {
        self.resultLabel.text = @"请选择出法";
        return ;
    }
    self.A1Button.layer.borderColor = [UIColor whiteColor].CGColor;
    self.A2Button.layer.borderColor = [UIColor whiteColor].CGColor;
    self.A3Button.layer.borderColor = [UIColor whiteColor].CGColor;
    
    int computerTag = [self ComputerThink];
    switch (computerTag) {
        case 0:
            self.ComputerLabel.text=@"✌️";
            _ComputerLabel.hidden=NO;
            break;
        case 1:
            self.ComputerLabel.text=@"✊";
            _ComputerLabel.hidden=NO;
            break;
        case 2:
            self.ComputerLabel.text=@"🖐️";
            _ComputerLabel.hidden=NO;
            break;
        default:
            break;
    }
    
    NSInteger result = self.playerTag + computerTag;
    
    if (result==6||result==7||result==11) {
        self.resultLabel.text=@"你赢了!";
        self.PScore.progress+=0.5;
    }
    else if (result==5||result==9||result==10){
        self.resultLabel.text=@"你输了!";
        self.CSore.progress+=0.5;
    }
    else{
        self.resultLabel.text=@"平手";
    }

if(self.PScore.progress==1){
    self.resultLabel.text=@"你获胜了";
    self.ComputerLabel.text=@"😏";
    _Startbuton.hidden=YES;
    self.RestartButton.hidden=NO;
}
else if(self.CSore.progress==1){
    self.resultLabel.text=@"电脑获胜了";
    self.ComputerLabel.text=@"😶";
    _Startbuton.hidden=YES;
    self.RestartButton.hidden=NO;
}
    
}
    


- (IBAction)restartBtnClick:(id)sender {
    self.resultLabel.text=@"";
    self.ComputerLabel.text=@"";
    self.CSore.progress=0;
    self.PScore.progress=0;
    _Startbuton.hidden=NO;
    _RestartButton.hidden=YES;
    self.playerTag = 0;
    return ;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

    



@end


