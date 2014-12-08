//
//  MMVCModalStyleViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-3.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMVCModalStyleViewController.h"
#import "MMContentViewController.h"

@interface MMVCModalStyleViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segement;
@property (nonatomic) UIModalTransitionStyle transitionStyle ;

@end

@implementation MMVCModalStyleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *titleAttr = @{
        NSFontAttributeName:[UIFont systemFontOfSize:10]
    };
    [_segement setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
    _transitionStyle = UIModalTransitionStyleCoverVertical ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)showViewController:(id)sender
{
    MMContentViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MMContentViewController"];
    vc.modalTransitionStyle = _transitionStyle;
    vc.modalPresentationStyle = UIModalPresentationFullScreen ;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)controllerTransitionStyleChanged:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        _transitionStyle = UIModalTransitionStyleCoverVertical ;
    }else if(sender.selectedSegmentIndex == 1){
        _transitionStyle = UIModalTransitionStyleFlipHorizontal ;
    }else if(sender.selectedSegmentIndex == 2){
        _transitionStyle = UIModalTransitionStyleCrossDissolve ;
    }else{
        _transitionStyle = UIModalTransitionStylePartialCurl ;
    }
    
    
}

@end
