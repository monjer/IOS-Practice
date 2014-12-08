//
//  MMKeyFrameAnimationViewController.m
//  UIViewAnimationTransition
//
//  Created by manjunhan on 14-12-2.
//  Copyright (c) 2014年 MM. All rights reserved.
//

#import "MMKeyFrameAnimationViewController.h"
#import "UIView+Dimensions.h"
#define DegreesToRadians(degree) (M_PI*(degree)/180.0)
#define kPanelBounds CGRectMake(0,0,150,200)

@interface MMKeyFrameAnimationViewController ()

@property (nonatomic) UIView *panel ;

@property (nonatomic) BOOL stop;

@end

@implementation MMKeyFrameAnimationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *panel = [UIView new];
    panel.bounds = kPanelBounds ;
    panel.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:panel];
    _panel = panel ;
    
    _stop = NO ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    _panel.bounds = kPanelBounds ;
    _panel.centerY = self.view.localCenterY;
    _panel.centerX = self.view.localCenterX;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)animated:(UIButton*)button
{
    if(button.tag == 1){
        [self slideInPanel];
    }else if(button.tag == 2){
         [self slideOutPanel];
    }else if(button.tag == 3){
        [self shakePanelHorizonal];
    }else if(button.tag == 4){
        [self popZoom];
    }else if(button.tag == 5){
        [self rotateShake];
    }
}

- (void)shakePanelHorizonal
{
    [self restorePanel:nil];
    CGFloat originX = _panel.x ;
    NSTimeInterval during = 0.4 ;
    CGFloat delta = 20 ;
    UIViewKeyframeAnimationOptions option = UIViewKeyframeAnimationOptionCalculationModeCubic|UIViewKeyframeAnimationOptionBeginFromCurrentState;
    [UIView animateKeyframesWithDuration:during delay:0.0
                                 options:option
                              animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.2 animations:^{
            _panel.x = originX + delta ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.2 relativeDuration:0.2 animations:^{
            _panel.x = originX - delta ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.2 animations:^{
            _panel.x = originX + delta*0.5 ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^{
             _panel.x = originX - delta*0.5 ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
            _panel.x = originX ;
        }];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)slideInPanel
{
    _panel.centerY = self.view.height + _panel.height/2.0;
    CGFloat delta = 150 ;
    NSTimeInterval during = 0.5;
    [UIView animateKeyframesWithDuration:during delay:0.0
                                 options:UIViewKeyframeAnimationOptionAllowUserInteraction
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.4 animations:^{
                                      _panel.centerY = self.view.localCenterY + delta ;
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.6 animations:^{
                                      _panel.centerY = self.view.localCenterY;
                                  }];
                                  
                              } completion:^(BOOL finished) {
                                  
                              }];

}

- (void)slideOutPanel
{
    [self restorePanel:nil];
    NSTimeInterval during = 0.5;
    [UIView animateKeyframesWithDuration:during delay:0.0
                                 options:UIViewKeyframeAnimationOptionAllowUserInteraction
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.4 animations:^{
                                      _panel.centerY = self.view.height ;
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.4 relativeDuration:0.6 animations:^{
                                      _panel.centerY += _panel.height/2.0;
                                  }];
                                  
                              } completion:^(BOOL finished) {
                                  
                              }];
}

- (void)popZoom
{
//    [self restorePanel:nil];
    NSTimeInterval during = 0.5;
    [UIView animateKeyframesWithDuration:during delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
                              animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.3 animations:^{
            _panel.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.3 relativeDuration:0.3 animations:^{
          _panel.transform = CGAffineTransformMakeScale(0.8, 0.8);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.6 relativeDuration:0.2 animations:^{
          _panel.transform = CGAffineTransformMakeScale(1.1, 1.1);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.8 relativeDuration:0.2 animations:^{
            _panel.transform =CGAffineTransformIdentity ;
        }];
                                  
    } completion:^(BOOL finished) {
        
    }];
}

- (void)rotateShake
{
    [self restorePanel:nil];
    NSTimeInterval during = 0.3;
    CGFloat degree = 5;
    [UIView animateKeyframesWithDuration:during delay:0.0
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear|UIViewKeyframeAnimationOptionRepeat|UIViewKeyframeAnimationOptionBeginFromCurrentState
                              animations:^{
                                  [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.25 animations:^{
                                      _panel.transform = CGAffineTransformMakeRotation(DegreesToRadians(degree));
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.5 animations:^{
                                      _panel.transform = CGAffineTransformMakeRotation(DegreesToRadians(-degree));
                                  }];
                                  [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
                                      _panel.transform = CGAffineTransformIdentity;
                                  }];
                              } completion:^(BOOL finished) {
                                  
                              }];

}


- (IBAction)restorePanel:(id)sender
{
    [UIView performWithoutAnimation:^{
        _panel.transform = CGAffineTransformIdentity;
        _panel.center = self.view.localCenter;
    }];
}

@end
