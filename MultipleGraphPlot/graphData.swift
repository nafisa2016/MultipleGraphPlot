//
//  graphData.swift
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

class ConfigureScatterPlot{
    //******************************************************************************
    //MARK:- Properties
    //******************************************************************************
    
    //MARK: Graph Attributes & Data
    //---------------------------------------------------------
    struct Configure{
        
        //identifier
        var graphIdentifier : String
        
        //graph line color
        var graphLineColor : CGColor
        
        //graph data Y axis
        var dataPointY : [Double]
        
        //graph data X axis
        var dataPointX : [Double]
        
        init(){
            graphIdentifier = ""
            graphLineColor = UIColor.whiteColor().CGColor
            
            dataPointY = []
            dataPointX = []
        }
        
    }
    
    
    //MARK: Graph Identifier
    //---------------------------------------------------------
    var identifier : [String] =    ["Graph 1",
        "Graph 2",
        "Graph 3",
        "Graph 4"
    ]
    
    //MARK: Graph Line colors
    //---------------------------------------------------------
    var lineColor : [CGColor] = [UIColor.yellowColor().CGColor,
        UIColor.redColor().CGColor,
        UIColor.brownColor().CGColor,
        UIColor.greenColor().CGColor
    ]
    
    //MARK: Y axis data for each graph
    //---------------------------------------------------------
    var dataYArr1 = [1.5,-1.2,2.0,-2.4,2.5]
    var dataYArr2 = [-1.5,2.7,-0.9,2.4,-1.1]
    var dataYArr3 = [1.5,-2.2,1.0,-2.4,3.0]
    var dataYArr4 = [1.5,-1.9,2.5,-2.6,1.0]
    
    //MARK: Y Axis Data Array
    //---------------------------------------------------------
    var dataYArr : [[Double]]  = []
    
    //MARK: X axis data for each graph
    //---------------------------------------------------------
    var dataXArr1 = [1.5,2.2,3.0,4.4,5.0]
    var dataXArr2 = [0.5,1.0,2.0,3.0,4.0]
    var dataXArr3 = [0.2,1.9,2.5,3.3,4.9]
    var dataXArr4 = [0.5,0.7,1,2.8,4.4]
    
    //MARK: X Axis Data Array
    //---------------------------------------------------------
    var dataXArr : [[Double]]  = []
    
    
    //MARK: Multiple Graph Attributes & Data
    //---------------------------------------------------------
    //array of struct
    var scatterPlotArray : [Configure] = []
    
    //MARK: flags for settings switch
    //---------------------------------------------------------
    var switchFlags : [Bool] =    [true,true,true,true]
    
    //******************************************************************************
    //MARK:-  Methods
    //******************************************************************************
    
    //load scatterPlotArray
    func loadScatterPlotArray() {
        
        dataYArr.append(dataYArr1)
        dataYArr.append(dataYArr2)
        dataYArr.append(dataYArr3)
        dataYArr.append(dataYArr4)
        
        dataXArr.append(dataXArr1)
        dataXArr.append(dataXArr2)
        dataXArr.append(dataXArr3)
        dataXArr.append(dataXArr4)
        
        //load values
        for i in 0..<identifier.count {
            
            //create instance of the structure
            var configGraphStruct = Configure()
            
            configGraphStruct.graphIdentifier = identifier[i]
            configGraphStruct.graphLineColor  = lineColor[i]
            configGraphStruct.dataPointY = dataYArr[i]
            configGraphStruct.dataPointX = dataXArr[i]
            
            scatterPlotArray.append(configGraphStruct)
        }
    }
}
