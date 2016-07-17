//
//  ViewController.swift
//  calcy
//
//  Created by VARSHNEY on 29/06/16.
//  Copyright © 2016 VARSHNEY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var display: UITextField!
    var flag:Bool=false  // means user has't typed yet
    var prev:Int32=0 // holds the previous number
    var symbol:String=String()
    var pleaseclear:Bool=false
    var flag2:Bool=false// true if operator is pressed
    @IBAction func number(sender: UIButton) {
        let digit=sender.currentTitle!
        if(flag)   // when flag==true , appending at last
        {
            display.text=display.text!+digit
        }
        else{    // when flag==flase , first number typed
            display.text=digit
            flag=true
        }
        
    } // number pressing function ends
    
    @IBAction func clear_equal(sender: UIButton) {
        let clearOrEqual=sender.currentTitle!
        if(flag)  // at least one number is entered
        {
            if(clearOrEqual=="C")// clears button
            {
                display.text=""
                flag2=false
                flag=false
                prev=0
            }
            else  // equal button pressed
            {
                if(flag2)  // operator is pressed
                {
                    switch symbol
                    {
                        case "+":display.text=String(prev+Int32(display.text!)!)
                                prev=Int32(display.text!)!
                                symbol=""
                                flag2=false // now it takes new operator
                        case "-":display.text=String(prev-Int32(display.text!)!)
                        prev=Int32(display.text!)!
                        symbol=""
                        flag2=false
                        case "*":display.text=String(prev*Int32(display.text!)!)
                        prev=Int32(display.text!)!
                        symbol=""
                        flag2=false
                        case "/":display.text=String(prev/Int32(display.text!)!)
                        prev=Int32(display.text!)!
                        symbol=""
                        flag2=false
                    default :break
                    }
                    
                }
            }
        }
        else// no number is entered
        {
            if(pleaseclear)
            {
                display.text=""
            }
            else{
                    display.text="error"
            }
            
        }
        
    }
    
    @IBAction func operation(sender: UIButton) {
        
        let operationPressed=sender.currentTitle!
        if(flag)  // to prevent clicking operator before operand
        {
            
            flag=false  // so that another number is entered
            if (!flag2)
            {
            prev=Int32(display.text!)!
            symbol=operationPressed
            flag2=true
            }
            
        }
        else{  // no number is entered
            display.text="do you have backlog in maths"
            pleaseclear=true
        }
        
    }
}

