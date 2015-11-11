

#import "APLViewController.h"
#import "UIImageEffects.h"

#import <mach/mach.h>
#import <mach/mach_time.h>

@interface APLViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *effectLabel;

@property (nonatomic) UIImage *image;
@property (nonatomic) int imageIndex;

@end


@implementation APLViewController

//| ----------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.image = [UIImage imageNamed:@"DisplayImage"];    
//    [self updateImage:nil];
    
}


//| ----------------------------------------------------------------------------
- (IBAction)updateImage:(id)sender
{
    NSString *effectText = @"";
    UIImage *effectImage = nil;
    
    switch (self.imageIndex)
    {
        case 0:
            effectImage = self.image;
            break;
        case 1:
            effectImage = [UIImageEffects imageByApplyingLightEffectToImage:self.image];
            effectText = NSLocalizedString(@"Light", @"");
            self.effectLabel.textColor = [UIColor darkTextColor];
            break;
        case 2:
            effectImage = [UIImageEffects imageByApplyingExtraLightEffectToImage:self.image];
            effectText = NSLocalizedString(@"Extra light", @"");
            self.effectLabel.textColor = [UIColor darkTextColor];
            break;
        case 3:
            effectImage = [UIImageEffects imageByApplyingDarkEffectToImage:self.image];
            effectText = NSLocalizedString(@"Dark", @"");
            self.effectLabel.textColor = [UIColor lightTextColor];
            break;
        case 4:
            effectImage = [UIImageEffects imageByApplyingTintEffectWithColor:[UIColor blueColor] toImage:self.image];
            effectText = NSLocalizedString(@"Color tint", @"");
            self.effectLabel.textColor = [UIColor lightTextColor];
            break;
    }
    
    self.imageView.image = effectImage;
    self.effectLabel.text = effectText;
    
}


//| ----------------------------------------------------------------------------
- (IBAction)nextEffect:(id)sender
{
    
    
    self.imageIndex++;
    
    if (self.imageIndex > 1)
    {
        self.imageIndex = 0;
    }

    [self updateImage:sender];

    
}





@end
