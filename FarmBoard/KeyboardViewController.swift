//
//  KeyboardViewController.swift
//  FarmBoard
//
//  Created by Mark Price on 7/17/14.
//  Copyright (c) 2014 Verisage. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    var mainView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        var xibViews = NSBundle.mainBundle().loadNibNamed("CustomKeyboard", owner: self, options: nil)
        self.mainView = xibViews[0] as UIView
        self.view.addSubview(mainView)
        
        for v in self.mainView.subviews as [UIButton]
        {
            v.addTarget(self, action: "btnPressed:", forControlEvents: .TouchUpInside)
        }

    }

    func btnPressed(sender: AnyObject)
    {
        var btn = sender as UIButton
        var stringToInsert = ""
        let proxy = self.textDocumentProxy as UIKeyInput
        
        switch (btn.tag)
        {
            case 5:
                stringToInsert = "🐱"
            case 10:
                stringToInsert = "🐶"
            case 15:
                stringToInsert = "🐷"
            default:
                stringToInsert = "We should not see this"
        }
        
        proxy.insertText(stringToInsert)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
    }

}
