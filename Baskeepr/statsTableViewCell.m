//
//  statsTableViewCell.m
//  Baskeepr
//
//  Created by andy on 11/12/30.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "statsTableViewCell.h"


#define cell1Width 35
#define cell2Width 60
#define cell3Width 60
#define cell4Width 60
#define cell5Width 45
#define cell6Width 45
#define cell7Width 35
#define cell8Width 35
#define cell9Width 35
#define cell10Width 35
#define cell11Width 35

#define bigCellWidth 60
#define mediumCellWidth 45
#define smallCellWidth 35

#define cellHeight 44

@implementation statsTableViewCell
@synthesize lineColor, topCell, cell1, cell2, cell3, cell4, cell5, cell6, cell7, cell8, cell9, cell10,cell11;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
            topCell = NO;
            
            // Add labels for the three cells
            cell1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell1Width, cellHeight)];
            cell1.textAlignment = UITextAlignmentCenter;
            cell1.textColor=[UIColor whiteColor];
            cell1.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell1];
            
            cell2 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width, 0, cell2Width, cellHeight)];
            cell2.textAlignment = UITextAlignmentCenter;
            cell2.textColor=[UIColor whiteColor];       
            cell2.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell2];
        
            cell3 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width, 0, cell3Width, cellHeight)];
            cell3.textAlignment = UITextAlignmentCenter;
            cell3.textColor=[UIColor whiteColor];
            cell3.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell3];
        
            cell4 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width, 0, cell4Width, cellHeight)];
            cell4.textAlignment = UITextAlignmentCenter;
            cell4.textColor=[UIColor whiteColor];
            cell4.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell4];
            
            cell5 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width, 0, cell5Width, cellHeight)];
            cell5.textAlignment = UITextAlignmentCenter;
            cell5.textColor=[UIColor whiteColor];
            cell5.numberOfLines=2;
            cell5.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell5];
        
            cell6 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width+cell5Width, 0, cell6Width, cellHeight)];
            cell6.textAlignment = UITextAlignmentCenter;
            cell6.textColor=[UIColor whiteColor];
            cell6.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell6];
        
            cell7 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width+cell5Width+cell6Width, 0, cell7Width, cellHeight)];
            cell7.textAlignment = UITextAlignmentCenter;
            cell7.textColor=[UIColor whiteColor];
            cell7.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell7];
        
            cell8 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width+cell5Width+cell6Width+cell7Width, 0, cell8Width, cellHeight)];
            cell8.textAlignment = UITextAlignmentCenter;
            cell8.textColor=[UIColor whiteColor];
            cell8.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell8];
        
            cell9 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width+cell5Width+cell6Width+cell7Width+cell8Width, 0, cell9Width, cellHeight)];
            cell9.textAlignment = UITextAlignmentCenter;
            cell9.textColor=[UIColor whiteColor];
            cell9.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell9];
        
            cell10 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width+cell5Width+cell6Width+cell7Width+cell8Width+cell9Width, 0, cell10Width, cellHeight)];
            cell10.textAlignment = UITextAlignmentCenter;
            cell10.textColor=[UIColor whiteColor];
            cell10.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell10];
        
            cell11 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width+cell5Width+cell6Width+cell7Width+cell8Width+cell9Width+cell10Width, 0, cell11Width, cellHeight)];
            cell11.textAlignment = UITextAlignmentCenter;
            cell11.textColor=[UIColor whiteColor];
            cell11.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
            [self addSubview:cell11];
        
 
            
//            cell5 = [[UILabel alloc] initWithFrame:CGRectMake(cell1Width+ cell2Width+cell3Width+cell4Width, 0, 320-(cell1Width+cell2Width), cellHeight)]; // Note - hardcoded 320 is not ideal; this can be done better
//            cell5.textAlignment = UITextAlignmentCenter;
//            cell5.backgroundColor = [UIColor clearColor]; // Important to set or lines will not appear
//            [self addSubview:cell5];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(context, lineColor.CGColor);       
    
	// CGContextSetLineWidth: The default line width is 1 unit. When stroked, the line straddles the path, with half of the total width on either side.
	// Therefore, a 1 pixel vertical line will not draw crisply unless it is offest by 0.5. This problem does not seem to affect horizontal lines.
	CGContextSetLineWidth(context, 1.0);
    
	// Add the vertical lines
	CGContextMoveToPoint(context, cell1Width+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+0.5, rect.size.height);
    
	CGContextMoveToPoint(context, cell1Width+bigCellWidth+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+cell2Width+0.5, rect.size.height);
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*2+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*2+0.5, rect.size.height);
    
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+0.5, rect.size.height);
    
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth+0.5, rect.size.height);
    
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+0.5, rect.size.height);
    
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth+0.5, rect.size.height);

    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth*2+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth*2+0.5, rect.size.height);
    
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth*3+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth*3+0.5, rect.size.height);
    
    CGContextMoveToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth*4+0.5, 0);
	CGContextAddLineToPoint(context, cell1Width+bigCellWidth*3+mediumCellWidth*2+smallCellWidth*4+0.5, rect.size.height);
	// Add bottom line
	CGContextMoveToPoint(context, 0, rect.size.height);
	CGContextAddLineToPoint(context, rect.size.width, rect.size.height-0.5);
	
	// If this is the topmost cell in the table, draw the line on top
	if (topCell)
	{
		CGContextMoveToPoint(context, 0, 0);
		CGContextAddLineToPoint(context, rect.size.width, 0);
	}
	
	// Draw the lines
	CGContextStrokePath(context); 
}

- (void)setTopCell:(BOOL)newTopCell
{
	topCell = newTopCell;
	[self setNeedsDisplay];
}

@end
