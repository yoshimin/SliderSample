//
//  YSViewController.m
//  SliderSample
//
//  Created by 新谷　よしみ on 2013/04/18.
//  Copyright (c) 2013年 新谷　よしみ. All rights reserved.
//

#import "YSViewController.h"

@interface YSViewController ()

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation YSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTextViewOnView];
    [self setSliderOnView];
}

- (void)setTextViewOnView {
    
    self.textView = [[UITextView alloc] init];
    _textView.frame = self.view.frame;
    _textView.font = [UIFont systemFontOfSize:24];
    _textView.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc";
    [self.view addSubview:_textView];
}

- (void)setSliderOnView {
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectZero];
    
    //UISliderを90°回転して縦方向にする
    _slider.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    //回転したあとにframeを設定しないと、xとy、widthとheightが逆になるので注意(๑￫_￩๑ )
    _slider.frame = CGRectMake(self.view.frame.size.width - 25, self.view.bounds.origin.y, 20, self.view.bounds.size.height);
    
    //UISliderのバーを透明にするためにバーに透明な画像を設定している
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"skeleton.png"] forState:UIControlStateNormal];
    [_slider setMaximumTrackImage:[UIImage imageNamed:@"skeleton.png"] forState:UIControlStateNormal];
    
    //UISliderのつまみにカスタム画像を設定
    [_slider setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];    
}

- (void)sliderValueChanged:(UISlider*)slider {
    
    //つまみに合わせてtextViewをスクロールさせる
    float position = (_textView.contentSize.height - _textView.bounds.size.height)*slider.value;
    [_textView setContentOffset:CGPointMake(0, position)];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //textViewのスクロールに合わせてつまみを動かす
    _slider.value = scrollView.contentOffset.y/_textView.contentSize.height;
}

@end
