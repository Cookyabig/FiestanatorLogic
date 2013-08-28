//
//  DataTableCell.m
//  fiestanator trial1
//
//  Created by Michael Giba on 7/8/13.
//  Copyright (c) 2013 Michael Giba. All rights reserved.
//

#import "DataTableCell.h"

@implementation SimpleTableCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
