//
//  ViewController.swift
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
import CorePlot

class ViewController: UIViewController, CPTPlotDataSource, CPTPlotDelegate, CPTPlotSpaceDelegate,CPTScatterPlotDelegate {
    
    //******************************************************************************
    //MARK:- properties
    //******************************************************************************
    @IBOutlet weak var graphView: CPTGraphHostingView!
    
    @IBOutlet weak var graph1Switch: UISwitch!
    @IBOutlet weak var graph2Switch: UISwitch!
    @IBOutlet weak var graph3Switch: UISwitch!
    @IBOutlet weak var graph4Switch: UISwitch!
    
    //no of graphs to be plotted
    var plotCount : Int = 0
    
    //create instance of graph parameter class
    let graphParameters = graphParam()
    
    //create instance of graph configuration class for multiple plot
    let graphConfiguration =  ConfigureScatterPlot()
    
    //******************************************************************************
    //MARK:- methods
    //******************************************************************************
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //MARK: Determine size class
        //---------------------------------------------------------
        //all phone ( except iPhone 6 plus) landscape :compact width & compact height
        if (self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Compact) &&
            (self.view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact){
            
                graphParameters.sizeClass = "CC"
        }
            
            //ipad : regular width & regular height
        else if (self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular) &&
            (self.view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Regular){
                
                graphParameters.sizeClass = "RR"
        }
            
            //iPhone 6 plus landscape : regular width & compact height
        else if (self.view.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.Regular) &&
            (self.view.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact){
                // Regular
                graphParameters.sizeClass = "RC"
        }
            
            //all phone portrait : compact width & regular height
        else {
            // Regular
            graphParameters.sizeClass = "CR"
        }
        
        //MARK: Load Graph Data
        //---------------------------------------------------------
        graphConfiguration.loadScatterPlotArray()
        
        //MARK: Create Graph
        //---------------------------------------------------------
        createScatterPlot()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //******************************************************************************
    //MARK:- Switch Actions
    //******************************************************************************
    
    //switch 1
    @IBAction func switch1Change(sender: UISwitch) {
        
        if graph1Switch.on {
            graphConfiguration.switchFlags[0] = true
        }
        else{
            graphConfiguration.switchFlags[0] = false
        }
        
        //reload graph
        reloadGraph()
        
    }
    
    //switch 2
    @IBAction func switch2Change(sender: UISwitch) {
        
        if graph2Switch.on {
            graphConfiguration.switchFlags[1] = true
        }
        else{
            graphConfiguration.switchFlags[1] = false
        }
        
        //reload graph
        reloadGraph()
        
    }
    
    //switch 3
    @IBAction func switch3Change(sender: UISwitch) {
        
        if graph3Switch.on {
            graphConfiguration.switchFlags[2] = true
        }
        else{
            graphConfiguration.switchFlags[2] = false
        }
        
        //reload graph
        reloadGraph()
    }
    
    //switch 4
    @IBAction func switch4Change(sender: UISwitch) {
        
        if graph4Switch.on {
            graphConfiguration.switchFlags[3] = true
        }
        else{
            graphConfiguration.switchFlags[3] = false
        }
        
        //reload graph
        reloadGraph()
    }
    
    //******************************************************************************
    //MARK:- create ScatterPlot
    //******************************************************************************
    func createScatterPlot(){
        
        configureHost()
        configureGraph()
        configurePlots()
        configureLegend()
        configureAxis()
        
    }
    
    //******************************************************************************
    //MARK:- CPTPlotDataSource
    //******************************************************************************
    
    //MARK: data for plot
    //---------------------------------------------------------
    func numberForPlot(plot: CPTPlot, field fieldEnum: UInt, recordIndex idx: UInt ) -> AnyObject? {
        
        var plotValue = 0.0
        
        for i in 0..<graphConfiguration.scatterPlotArray.count  {
            
            //check flag
            if   graphConfiguration.switchFlags[i]  {
                
                plotCount +=  1
                
                //index
                let indx = Int(idx)
                
                if let graphIdentifier = plot.identifier?.description {
                    
                    if graphIdentifier == graphConfiguration.scatterPlotArray[i].graphIdentifier{
                        
                        //return x value
                        if indx < graphConfiguration.scatterPlotArray[i].dataPointX.count {
                            
                            if(fieldEnum == 0){
                                plotValue =   graphConfiguration.scatterPlotArray[i].dataPointX[indx]
                            }
                                //return y value
                            else {
                                plotValue =   graphConfiguration.scatterPlotArray[i].dataPointY[indx]
                            }
                        }
                        break
                    }
                }
            } // graph identifier not nil
        }
        return plotValue
    }
    
    
    //MARK: number of plots
    //---------------------------------------------------------
    func numberOfRecordsForPlot(plot: CPTPlot) -> UInt {
        
        plotCount = graphConfiguration.scatterPlotArray.count
        return UInt(plotCount)
    }
    
    //******************************************************************************
    //MARK:- configure host
    //******************************************************************************
    func configureHost(){
        
        //allows graph to zoom
        graphView.allowPinchScaling = true
    }
    
    //******************************************************************************
    //MARK:- configure graph
    //******************************************************************************
    func configureGraph(){
        
        //MARK: create graph
        //---------------------------------------------------------
        let graph = CPTXYGraph(frame: CGRectZero)
        
        //MARK: apply theme
        //---------------------------------------------------------
        graph.applyTheme(CPTTheme(named:kCPTPlainWhiteTheme))
        
        //MARK: add to graphview
        //---------------------------------------------------------
        graphView.hostedGraph = graph
        
        graphView.setNeedsDisplay()
        
        //MARK: set title
        //---------------------------------------------------------
        graph.title = graphParameters.graphTitle
        
        //MARK: format title
        //---------------------------------------------------------
        //color,style & displacement
        let titleTextStyle = CPTMutableTextStyle()
        titleTextStyle.color = CPTColor(CGColor: graphParameters.graphTitleColor)
        titleTextStyle.fontSize = graphParameters.graphTitleFontSize
        
        graph.titleDisplacement = CGPointMake(graphParameters.graphtitleDisplacementX, graphParameters.graphtitleDisplacementY)
        graph.titleTextStyle  = titleTextStyle
        
        
        //MARK: set padding for plot area
        //---------------------------------------------------------
        graph.paddingLeft = graphParameters.graphPaddingLeft
        graph.paddingTop = graphParameters.graphPaddingTop
        graph.paddingRight = graphParameters.graphPaddingRight
        graph.paddingBottom = graphParameters.graphPaddingBottom
        
        
        //MARK: allow user interaction in plot space
        //---------------------------------------------------------
        let plotSpace = graph.defaultPlotSpace as! CPTXYPlotSpace
        plotSpace.allowsUserInteraction = true
    }
    
    //******************************************************************************
    //MARK:- configure plots
    //******************************************************************************
    func configurePlots(){
        
        //MARK: get graph and plot space
        //---------------------------------------------------------
        let graph = graphView.hostedGraph
        let plotSpace = graph?.defaultPlotSpace as! CPTXYPlotSpace
        
        //MARK: set up plot space
        //---------------------------------------------------------
        plotSpace.xRange = CPTPlotRange(locationDecimal: CPTDecimalFromFloat(graphParameters.xRangeLocationDecimal), lengthDecimal: CPTDecimalFromFloat(graphParameters.xRangeLengthDecimal))
        
        
        plotSpace.globalXRange = CPTPlotRange(locationDecimal: CPTDecimalFromFloat(graphParameters.xGlobalRangeLocationDecimal), lengthDecimal: CPTDecimalFromFloat(graphParameters.xGlobalRangeLengthDecimal))
        
        
        plotSpace.yRange = CPTPlotRange(locationDecimal: CPTDecimalFromFloat(graphParameters.yRangeLocationDecimal), lengthDecimal: CPTDecimalFromFloat(graphParameters.yRangeLengthDecimal))
        
        
        plotSpace.scaleToFitPlots(graph?.allPlots())
        
        graph!.addPlotSpace(plotSpace)
        
        //MARK: gradient background
        //---------------------------------------------------------
        let plotAreaGradient =  CPTGradient(beginningColor: CPTColor(CGColor: graphParameters.graphBackGroundColor), endingColor: CPTColor.whiteColor())
        plotAreaGradient.angle = graphParameters.gradientAngle
        
        graph?.plotAreaFrame!.plotArea!.fill =  CPTFill(gradient: plotAreaGradient)
        (color: CPTColor(CGColor: graphParameters.graphBackGroundColor))
        
        //MARK: plot area frame padding to display title and labels
        //---------------------------------------------------------
        graph!.plotAreaFrame!.paddingRight = graphParameters.graphPlotAreaPaddingRight
        graph!.plotAreaFrame!.paddingLeft = graphParameters.graphPlotAreaPaddingLeft
        graph!.plotAreaFrame!.paddingTop = graphParameters.graphPlotAreaPaddingTop
        graph!.plotAreaFrame!.paddingBottom = graphParameters.graphPlotAreaPaddingBottom
        
        //MARK: create plots
        //---------------------------------------------------------
        var counter = 0
        
        for eachConfig in graphConfiguration.scatterPlotArray{
            
            //if switch is on then plot the graph
            if    graphConfiguration.switchFlags[counter]  {
                
                let plot = CPTScatterPlot()
                plot.dataSource = self
                plot.delegate = self
                
                plot.identifier = eachConfig.graphIdentifier
                
                //MARK: plot interpolation
                //---------------------------------------------------------
                plot.interpolation = CPTScatterPlotInterpolation.Curved
                
                graph!.addPlot(plot)
                
                
                //Set line style. Add interpolation to graph
                let actualPlotStyle = plot.dataLineStyle!.mutableCopy() as! CPTMutableLineStyle
                actualPlotStyle.lineWidth = graphParameters.graphPlotLineStyleWidth
                actualPlotStyle.lineColor = CPTColor(CGColor: eachConfig.graphLineColor)
                plot.dataLineStyle = actualPlotStyle
                
                
                //MARK: plot symbol
                //---------------------------------------------------------
                let graphPlotSymbol = CPTPlotSymbol.diamondPlotSymbol()
                
                graphPlotSymbol.fill = CPTFill.init(color: CPTColor(CGColor: graphParameters.graphPlotSymbolColor[counter]))
                graphPlotSymbol.size = CGSizeMake(graphParameters.graphPlotSymbolWidth,graphParameters.graphPlotSymbolHeight)
                plot.plotSymbol = graphPlotSymbol
                
                
                //MARK: legend
                //---------------------------------------------------------
                configureLegend()
                
            }
            
            counter += 1
        }
    }
    
    //******************************************************************************
    //MARK:- configure legend
    //******************************************************************************
    func configureLegend(){
        
        let graph = graphView.hostedGraph
        
        let theLegend=CPTLegend(graph: graph)
        
        //MARK: legend background
        //---------------------------------------------------------
        let legendFill=CPTFill.init(color: CPTColor(CGColor: graphParameters.legendFillColor))
        theLegend.fill = legendFill
        
        //MARK: legend border
        //---------------------------------------------------------
        let legendLineStyle = CPTMutableLineStyle()
        legendLineStyle.lineColor = CPTColor(CGColor: graphParameters.legendBorderLineColor)
        theLegend.borderLineStyle = legendLineStyle
        
        theLegend.cornerRadius = graphParameters.legendCornerRadius
        
        //MARK: legend size
        //---------------------------------------------------------
        theLegend.swatchSize = CGSizeMake(graphParameters.legendSwatchWidth,graphParameters.legendSwatchHeight)
        
        //MARK: legend row and column
        //---------------------------------------------------------
        theLegend.numberOfRows = graphParameters.legendRowNum
        theLegend.numberOfColumns = graphParameters.legendColumnNum
        //theLegend.rowMargin = 1
        
        graph!.legend = theLegend
        
        //MARK: legend position
        //---------------------------------------------------------
        graph!.legendAnchor = CPTRectAnchor.BottomLeft
        graph!.legendDisplacement = CGPointMake(graphParameters.legendDisplacementWidth, graphParameters.legendDisplacementHeight)
        
    }
    
    
    //******************************************************************************
    //MARK:- configure axis
    //******************************************************************************
    func configureAxis(){
        
        //MARK: line styles
        //---------------------------------------------------------
        //axis line style
        let axisLineStyle = CPTMutableLineStyle()
        axisLineStyle.lineWidth = graphParameters.graphXAxisLineWidth
        axisLineStyle.lineColor = CPTColor(CGColor: graphParameters.graphAxisLineColor)
        
        //grid line style
        let majorGridLineStyle = CPTMutableLineStyle()
        majorGridLineStyle.lineWidth = graphParameters.graphMajorGridLineStyleWidth
        majorGridLineStyle.lineColor = CPTColor(CGColor: graphParameters.graphMajorGridLineColor)
        
        
        let minorGridLineStyle = CPTMutableLineStyle()
        minorGridLineStyle.lineWidth = graphParameters.graphMinorGridLineStyleWidth
        minorGridLineStyle.lineColor = CPTColor(CGColor: graphParameters.graphMinorGridLineColor)
        
        //major tick style
        let  majorTickLineStyle = CPTMutableLineStyle()
        majorTickLineStyle.lineWidth = graphParameters.majorTickLineWidth
        majorTickLineStyle.lineColor = CPTColor(CGColor: graphParameters.majorTickLineColor)
        
        //minor tick style
        let  minorTickLineStyle = CPTMutableLineStyle()
        minorTickLineStyle.lineWidth = graphParameters.minorTickLineWidth
        minorTickLineStyle.lineColor = CPTColor(CGColor: graphParameters.minorTickLineColor)
        
        
        
        //MARK: axis label text style
        //---------------------------------------------------------
        let  axisMajorTickLabelTextStyle = CPTMutableTextStyle()
        axisMajorTickLabelTextStyle.fontSize = graphParameters.graphAxisMajorTickLabelFontSize
        axisMajorTickLabelTextStyle.color = CPTColor(CGColor: graphParameters.graphAxisMajorTickLabelTextColor)
        
        let  axisMinorTickLabelTextStyle = CPTMutableTextStyle()
        axisMinorTickLabelTextStyle.fontSize = graphParameters.graphAxisMinorTickLabelFontSize
        axisMinorTickLabelTextStyle.color = CPTColor(CGColor: graphParameters.graphAxisMinorTickLabelTextColor)
        
        //MARK: axis label value formatter
        //---------------------------------------------------------
        let axisFormatter = NSNumberFormatter()
        axisFormatter.maximumFractionDigits = graphParameters.graphAxisFormatterMaxFractionDigit
        axisFormatter.minimumIntegerDigits = graphParameters.graphAxisFormatterMinIntegerDigit
        
        
        //MARK: set text style and font for axis title
        //---------------------------------------------------------
        let xts = CPTMutableTextStyle()
        xts.color = CPTColor(CGColor: graphParameters.graphAxisTitleColor)
        xts.fontSize = graphParameters.graphAxisFontSize
        
        
        //MARK: axis
        //---------------------------------------------------------
        //get axis
        let axisSet = graphView.hostedGraph!.axisSet as! CPTXYAxisSet!
        
        //x axis
        let xAxis = axisSet.xAxis as CPTXYAxis!
        
        //y axis
        let yAxis = axisSet.yAxis as CPTXYAxis!
        
        //x and y axis intersection
        xAxis.orthogonalPosition = graphParameters.graphYAxisIntersectionPos
        yAxis.orthogonalPosition = graphParameters.graphXAxisIntersectionPos
        
        //lower offset -> y axis on left,x axis at bottom
        yAxis.axisConstraints = CPTConstraints(lowerOffset:   graphParameters.graphYAxisConstraint)
        
        
        
        //MARK: axis line style
        //---------------------------------------------------------
        xAxis.axisLineStyle = axisLineStyle
        yAxis.axisLineStyle = axisLineStyle
        
        
        //MARK: axis title
        //---------------------------------------------------------
        //x axis title
        xAxis.axisTitle = CPTAxisTitle(text: graphParameters.graphXAxisTitle, textStyle: xts)
        
        //y axis title
        yAxis.axisTitle = CPTAxisTitle(text: graphParameters.graphYAxisTitle, textStyle: xts)
        
        //offset of title from axis
        yAxis.titleOffset = graphParameters.graphYAxisTitleOffset
        
        
        
        //MARK: axis label
        //---------------------------------------------------------
        
        //label formatting
        xAxis.labelFormatter = axisFormatter
        xAxis.labelTextStyle = axisMajorTickLabelTextStyle
        
        yAxis.labelFormatter = axisFormatter
        yAxis.labelTextStyle = axisMajorTickLabelTextStyle
        yAxis.setNeedsRelabel()
        
        //  xAxis.majorTickLabelTextStyle = axisMajorTickLabelTextStyle
        xAxis.minorTickLabelTextStyle = axisMinorTickLabelTextStyle
        
        //  yAxis.minorTickLabelTextStyle = axisMajorTickLabelTextStyle
        yAxis.minorTickLabelTextStyle = axisMinorTickLabelTextStyle
        
        //offset of label from axis
        xAxis.labelOffset = graphParameters.graphXAxisLabelOffset
        yAxis.labelOffset = graphParameters.graphYAxisLabelOffset
        
        
        //label rotation
        xAxis.labelRotation = graphParameters.graphAxisLabelRotation
        
        
        //MARK: axis grid
        //---------------------------------------------------------
        //x axis grid
        //xAxis.majorGridLineStyle = majorGridLineStyle
        
        //y axis grid
        yAxis.majorGridLineStyle = majorGridLineStyle
        yAxis.minorGridLineStyle =  minorGridLineStyle
        
        
        //MARK: axis ticks
        //---------------------------------------------------------
        //Set interval at which ticks appear on axes
        
        //xAxis.preferredNumberOfMajorTicks = graphParameters.graphXAxisMajorTickNum
        yAxis.preferredNumberOfMajorTicks = graphParameters.graphYAxisMajorTickNum
        
        //minor tick length
        
        yAxis.minorTickLength = graphParameters.graphYAxisMinorTickLength
        xAxis.minorTickLength = graphParameters.graphXAxisMinorTickLength
        
        //how many minor ticks between 2 major ticks
        yAxis.minorTicksPerInterval =  graphParameters.graphYAxisMinorTickInterval
        xAxis.minorTicksPerInterval = graphParameters.graphXAxisMinorTickInterval
        
        //value of one major interval
        
        yAxis.majorIntervalLength = graphParameters.graphYAxisMajorIntervalLength
        xAxis.majorIntervalLength = graphParameters.graphXAxisMinorTickInterval
        
        
        //xAxis.tickDirection = CPTSign.Negative
        // yAxis.tickDirection = CPTSign.Negative
        
        // xAxis.tickLabelDirection = CPTSign.Negative
        
        //x axis ticks
        xAxis.majorTickLineStyle = majorTickLineStyle
        xAxis.minorTickLineStyle = minorTickLineStyle
        
        //y axis ticks
        yAxis.majorTickLineStyle = majorTickLineStyle
        yAxis.minorTickLineStyle = minorTickLineStyle
        
        //required to show minor tick label values
        yAxis.minorTickLabelFormatter = axisFormatter
        xAxis.minorTickLabelFormatter = axisFormatter
    }
    
    //******************************************************************************
    //MARK:- Reload Graph
    //******************************************************************************
    func reloadGraph(){
        
        let graph = graphView.hostedGraph
        graph?.reloadData()
    }
}

