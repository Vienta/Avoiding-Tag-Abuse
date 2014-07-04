//
//  ViewController.m
//  AvoidTagAbuse
//
//  Created by Vienta on 14-6-30.
//  Copyright (c) 2014年 www.vienta.me. All rights reserved.
//

#import "ViewController.h"
#import "TagButton.h"
#import <objc/runtime.h>


@interface ViewController ()
{
    NSMutableArray *_photoArr;
    UIImageView *_photoIgv;
}

@end

@implementation ViewController

static char kTagButtonAssociatedPhoteKey;

- (void)setAssociatedImage:(UIImage *)image
                forButton:(UIButton *)button
{
    objc_setAssociatedObject(button,
                             &kTagButtonAssociatedPhoteKey,
                             image,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIImage *)associatedImageForButton:(UIButton *)button
{
    return objc_getAssociatedObject(button,
                                    &kTagButtonAssociatedPhoteKey);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _photoIgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 320, 220)];
    [self.view addSubview:_photoIgv];
    
    /* Tag Method
    _photoArr = [NSMutableArray arrayWithCapacity:0];
    for (int idx = 0; idx < 7; idx ++) {
        NSString *imgName = [NSString stringWithFormat:@"btn%d",idx+1];
        UIImage *img = [UIImage imageNamed:imgName];
        [_photoArr addObject:img];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:imgName forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 60, 30);
        btn.center = CGPointMake(160, 260 + 45*idx);
        btn.backgroundColor = [UIColor blackColor];
        [self.view addSubview:btn];
        btn.tag = idx;
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    */

    /* Subclass UIButton Method
    for (int idx = 0; idx < 7; idx ++) {
        NSString *imgName = [NSString stringWithFormat:@"btn%d",idx+1];
        UIImage *img = [UIImage imageNamed:imgName];
        
        TagButton *btn = [TagButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:imgName forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 60, 30);
        btn.center = CGPointMake(160, 260 + 45*idx);
        btn.backgroundColor = [UIColor blackColor];
        btn.photo = img;
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
     */
    
//    //*Associated Object Method
    for (int idx = 0; idx < 7; idx ++) {
        NSString *imgName = [NSString stringWithFormat:@"btn%d",idx+1];
        UIImage *img = [UIImage imageNamed:imgName];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:imgName forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 60, 30);
        btn.center = CGPointMake(160, 260 + 45*idx);
        btn.backgroundColor = [UIColor blackColor];
        
        [self setAssociatedImage:img forButton:btn];
        
        [self.view addSubview:btn];
        [btn addTarget:self action:@selector(tapBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
//     */
}

//*Associated Object Method
- (void)tapBtn:(id)sender
{
    UIButton *btn = (id)sender;
    
    UIImage *img = [self associatedImageForButton:btn];
    
    [_photoIgv setImage:img];
}
 

/*
- (void)tapBtn:(id)sender
{
    TagButton *btn = (id)sender;
    UIImage *img = btn.photo;
    [_photoIgv setImage:img];
}
*/
/*
- (void)tapBtn:(id)sender
{
    UIButton *btn = (id)sender;
    UIImage *img = [_photoArr objectAtIndex:btn.tag];
    [_photoIgv setImage:img];
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
