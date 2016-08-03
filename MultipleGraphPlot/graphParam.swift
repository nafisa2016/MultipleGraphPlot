//
//  graphParameters.swift
//  MultipleGraphPlot
//
//  Created on: 04-May-2016
//      Author: Nafisa Rahman
//
//  LICENSE:-
//  The MIT License (MIT)
//  Copyright (c) 2016 Nafisa Rahman
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom
//  the Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall
//  be included in all copies or substantial portions of the
//  Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
//  OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

class graphParam {
    
    //MARK:- size class flag
    var sizeClass : String = ""
    
    //******************************************************************************
    // MARK:- properties to confirgure graph parameters
    //******************************************************************************
    
    //MARK: Graph Title
    //---------------------------------------------------------
    var graphTitle : String = "Multiple Plots"
    
    //graph title color
    var graphTitleColor : CGColor = UIColor.blueColor().CGColor
    
    //graph title font size
    var graphTitleFontSize  : CGFloat   {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  25.0
                
            case "CR" :
                return  15.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  15.0
                
            default :
                return  2.0
            }
        }
    }
    
    //graph title displacement x
    var graphtitleDisplacementX : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  20.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  10.0
                
            default :
                return  2.0
            }
        }
    }
    
    //graph title displacement y
    var graphtitleDisplacementY : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  50.0
                
            case "CR" :
                return  20.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  20.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    //MARK: Graph Padding
    //---------------------------------------------------------
    var graphPaddingLeft : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  50.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  10.0
                
            default :
                return  2.0
            }
        }
    }
    
    var graphPaddingTop : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  90.0
                
            case "CR" :
                return  20.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  25.0
                
            default :
                return  2.0
            }
        }
    }
    
    var graphPaddingRight : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  50.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  10.0
                
            default :
                return  2.0
            }
        }
    }
    
    var graphPaddingBottom : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  10.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  10.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    //******************************************************************************
    // MARK:- properties to confirgure  plot parameters
    //******************************************************************************
    
    //MARK: Axis Range
    //---------------------------------------------------------
    //X axis range
    
    //starting location
    var xRangeLocationDecimal : Float = 0.0
    //end location ( starting location + length)
    var xRangeLengthDecimal : Float = 5.0
    
    //Y axis range ( starting location + length)
    
    //starting location
    var yRangeLocationDecimal : Float  = -3.0
    
    //end location
    var yRangeLengthDecimal : Float = 6.0
    
    //Global Range
    var xGlobalRangeLocationDecimal : Float = 0.0
    //end location ( starting location + length)
    var xGlobalRangeLengthDecimal : Float = 100.0
    
    
    //MARK: Graph Plot Area Padding
    //---------------------------------------------------------
    //left padding
    var graphPlotAreaPaddingLeft : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  90.0
                
            case "CR" :
                return  50.0
                
            case "CC" :
                return  55.0
                
            case "RC" :
                return  60.0
                
            default :
                return  2.0
            }
        }
    }
    
    //top padding
    var graphPlotAreaPaddingTop : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  40.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  10.0
                
            default :
                return  2.0
            }
        }
    }
    
    //right padding
    var graphPlotAreaPaddingRight : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  40.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  30.0
                
            default :
                return  2.0
            }
        }
    }
    
    //bottom padding
    var graphPlotAreaPaddingBottom : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  150.0
                
            case "CR" :
                return  50.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  55.0
                
            default :
                return  2.0
            }
        }
    }
    
    //MARK: Graph Plot Line Style
    //---------------------------------------------------------
    //graph plot style line width
    var graphPlotLineStyleWidth : CGFloat = 2.0
    
    //graph plot style line color
    var graphPlotLineStyleColor : CGColor = UIColor.yellowColor().CGColor
    
    
    //MARK: Plot Symbol
    //---------------------------------------------------------
    //plot symbol color
    var graphPlotSymbolColor : [CGColor] = [UIColor.yellowColor().CGColor,
        UIColor.redColor().CGColor,
        UIColor.brownColor().CGColor,
        UIColor.greenColor().CGColor]
    
    //plot symbol size
    var graphPlotSymbolHeight : CGFloat = 10.0
    var graphPlotSymbolWidth : CGFloat = 10.0
    
    
    //MARK: Graph Plot Area Background Color
    //---------------------------------------------------------
    var graphBackGroundColor : CGColor = UIColor(red: 114.0/255.0, green: 227.0/255.0, blue: 251.0/255.0, alpha: 0.5).CGColor
    
    //gradient angle
    var gradientAngle : CGFloat = 90
    
    
    
    //MARK: Graph Plot Legend
    //---------------------------------------------------------
    //legend fill color
    var legendFillColor : CGColor = UIColor(red: 114.0/255.0, green: 227.0/255.0, blue: 251.0/255.0, alpha: 0.5).CGColor
    
    //legend line color
    // var legendLineColor : CGColor = UIColor(red: 114.0/255.0, green: 227.0/255.0, blue: 251.0/255.0, alpha: 0.5).CGColor
    
    var legendBorderLineColor : CGColor = UIColor.yellowColor().CGColor
    
    //legend corner radius
    var legendCornerRadius : CGFloat = 5.0
    
    //legend swatch size height & width
    var legendSwatchHeight : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  30.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  10.0
                
            case "RC" :
                return  10.0
                
            default :
                return  2.0
            }
        }
    }
    
    var legendSwatchWidth : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  50.0
                
            case "CR" :
                return  20.0
                
            case "CC" :
                return  25.0
                
            case "RC" :
                return  30.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    //legend displacement height & width
    var legendDisplacementHeight : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  15.0
                
            case "CR" :
                return  11.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  15.0
                
            default :
                return  2.0
            }
        }
    }
    
    var legendDisplacementWidth : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  150.0
                
            case "CR" :
                return  30.0
                
            case "CC" :
                return  35.0
                
            case "RC" :
                return  80.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    //legend border line color
    
    //legend no of row
    var legendRowNum : UInt = 2
    
    //legend no of column
    var legendColumnNum : UInt = 2
    
    //******************************************************************************
    // MARK:- properties to confirgure  axis parameters
    //******************************************************************************
    
    //MARK: Axis Title
    //---------------------------------------------------------
    //axis title color
    var graphAxisTitleColor : CGColor  = UIColor(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0, alpha: 0.5).CGColor
    
    //axis title font size
    var graphAxisFontSize : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  20.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  10.0
                
            case "RC" :
                return  15.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    //axis title
    var graphXAxisTitle : String = "X axis Data"
    var graphYAxisTitle : String = "Y axis Data"
    
    //axis title offset from axis
    var graphXAxisTitleOffset : CGFloat{
        get{
            switch( self.sizeClass){
            case "RR" :
                return  220.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  30.0
                
            default :
                return  2.0
            }
        }
    }
    
    var graphYAxisTitleOffset : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  50.0
                
            case "CR" :
                return  30.0
                
            case "CC" :
                return  15.0
                
            case "RC" :
                return  30.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    
    //MARK: Axis Label
    //---------------------------------------------------------
    //axis major tick label font size
    var graphAxisMajorTickLabelFontSize : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  15.0
                
            case "CR" :
                return  10.0
                
            case "CC" :
                return  10.0
                
            case "RC" :
                return  15.0
                
            default :
                return  2.0
            }
        }
    }
    
    //axis minor tick label font size
    var graphAxisMinorTickLabelFontSize : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  12.0
                
            case "CR" :
                return  8.0
                
            case "CC" :
                return  5.0
                
            case "RC" :
                return  7.0
                
            default :
                return  1.0
            }
        }
    }
    
    //axis label text color
    var graphAxisMajorTickLabelTextColor : CGColor = UIColor.darkGrayColor().CGColor
    
    var graphAxisMinorTickLabelTextColor : CGColor = UIColor(red: 0.0/255.0, green: 51.0/255.0, blue: 102.0/255.0, alpha: 0.5).CGColor
    
    //axis formatter maximum fraction digit
    var graphAxisFormatterMaxFractionDigit = 4
    
    
    //axis formatter minimum integer digit
    var graphAxisFormatterMinIntegerDigit = 1
    
    //offset of label from axis
    var graphXAxisLabelOffset : CGFloat = 2
    var graphYAxisLabelOffset : CGFloat = 5
    
    //label rotation
    var graphAxisLabelRotation : CGFloat = 0.0
    
    
    
    //MARK: Axis Line
    //---------------------------------------------------------
    //axis line width
    var graphXAxisLineWidth : CGFloat {
        get{
            switch( self.sizeClass){
            case "RR" :
                return  3.0
                
            case "CR" :
                return  1.5
                
            case "CC" :
                return  1.0
                
            case "RC" :
                return  1.0
                
            default :
                return  2.0
            }
        }
    }
    
    
    //axis line color
    var graphAxisLineColor : CGColor  = UIColor.blackColor().CGColor
    
    //lower offset
    var graphXAxisConstraint : CGFloat = 0
    var graphYAxisConstraint : CGFloat = 0
    
    //axis intersection
    var graphXAxisIntersectionPos : CGFloat = 0
    var graphYAxisIntersectionPos : CGFloat = 0
    
    
    
    //MARK: Ticks
    //---------------------------------------------------------
    //major tick interval
    var graphXAxisMajorTickNum : UInt = 5
    var graphYAxisMajorTickNum : UInt = 5
    
    //minor tick length
    var graphXAxisMinorTickLength : CGFloat = 10
    var graphYAxisMinorTickLength : CGFloat = 5
    
    //no of minor ticks between 2 major ticks
    var graphXAxisMinorTickInterval : UInt = 1
    var graphYAxisMinorTickInterval : UInt = 1
    
    //value of 1 major interval
    var graphXAxisMajorIntervalLength = 1
    var graphYAxisMajorIntervalLength = 1
    
    //tick line width
    var majorTickLineWidth : CGFloat = 3.0
    var minorTickLineWidth : CGFloat = 1.0
    
    //tick line color
    var majorTickLineColor : CGColor  = UIColor.blueColor().CGColor
    var minorTickLineColor : CGColor  = UIColor.blueColor().CGColor
    
        
    
    //MARK: Grid Line
    //---------------------------------------------------------
    //grid line width
    var graphMajorGridLineStyleWidth : CGFloat = 1.0
    var graphMinorGridLineStyleWidth : CGFloat = 0.5
    
    //grid line color
    var graphMajorGridLineColor : CGColor  = UIColor.darkGrayColor().CGColor
    var graphMinorGridLineColor : CGColor  = UIColor.lightGrayColor().CGColor
    
}

