//
//  DataTableCell.h
//  fiestanator trial1
//
//  Created by Michael Giba on 7/8/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *PriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *priceOrCash;

@end
