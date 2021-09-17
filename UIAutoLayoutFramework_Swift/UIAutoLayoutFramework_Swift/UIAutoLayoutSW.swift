//
//  UIAutoLayoutSW.swift
//  UIAutoLayoutFramework_Swift
//
//  Created by 林俊男 on 2021/09/16.
//

import Foundation
import UIKit

public enum BSAdaptScreenWidthType: Int{
    case AdaptScreenWidthTypeNone = 0
    case BSAdaptScreenWidthTypeConstraint = 1
    case BSAdaptScreenWidthTypeFontSize = 2
    case BSAdaptScreenWidthTypeCornerRadius = 3
    case BSAdaptScreenWidthTypeAll = 4
}

public let AutoLayoutVersion = "1.1.0"

public let kscreenWidth = UIScreen.main.bounds.size.width
public let kscreenHeight = UIScreen.main.bounds.size.height

public func calValue(value:CGFloat) -> CGFloat {
    return value*kscreenWidth/(kscreenHeight>800 ? 375:320)
}

public func calVersion() -> String! {
    return AutoLayoutVersion
}

extension UIView{
    
    public func getScreenWidth() -> CGFloat {
        return kscreenWidth
    }
    
    public func getScreenHeight() -> CGFloat {
        return kscreenHeight
    }
    
    public func getX() -> CGFloat {
        return self.frame.origin.x
    }
    
    public func setX(X_Value: CGFloat){
        var rect: CGRect = self.frame
        rect.origin.x = X_Value
        self.frame = rect
    }
    
    public func getY() -> CGFloat {
        return self.frame.origin.y
    }
    
    public func setY(Y_Value: CGFloat) {
        var rect: CGRect = self.frame
        rect.origin.y = Y_Value
        self.frame = rect
    }
    
    public func getRight() -> CGFloat {
        return (self.frame.origin.x + self.frame.size.width)
    }
    
    public func setRight(Right_Value: CGFloat) {
        var rect: CGRect = self.frame
        rect.origin.x = Right_Value - self.frame.size.width
        self.frame = rect
    }
    
    public func getBottom() -> CGFloat {
        return (self.frame.origin.y + self.frame.size.height)
    }
    
    public func setBottom(Bottom_Value: CGFloat) {
        var rect: CGRect = self.frame
        rect.origin.y = Bottom_Value - self.frame.size.height
        self.frame = rect
    }
    
    public func getSize() -> CGSize {
        return self.frame.size
    }
    
    public func setSize(Size_Value: CGSize) {
        var rect: CGRect = self.frame
        rect.size = Size_Value
        self.frame = rect
    }
    
    public func getWidth() -> CGFloat {
        return self.frame.size.width
    }
    
    public func setWidth(Width_Value: CGFloat) {
        var rect: CGRect = self.frame
        rect.size.width = Width_Value
        self.frame = rect
    }
    
    public func getHeight() -> CGFloat {
        return self.frame.size.height
    }
    
    public func setHeight(Height_Value: CGFloat) {
        var rect: CGRect = self.frame
        rect.size.height = Height_Value
        self.frame = rect
    }
    
    public func getCenterX() -> CGFloat {
        return self.center.x
    }
    
    public func setCenterX(CenterX_Value: CGFloat) {
        var centerRes: CGPoint = self.center
        centerRes.x = CenterX_Value
        self.center = centerRes
    }
    
    public func getCenterY() -> CGFloat {
        return self.center.y
    }
    
    public func setCenterY(CenterY_Value: CGFloat) {
        var centerRes: CGPoint = self.center
        centerRes.y = CenterY_Value
        self.center = centerRes
    }
    
    public func adaptScreenWidthType(type: BSAdaptScreenWidthType, exceptViews: Array<AnyClass>?) {
        
        if type == BSAdaptScreenWidthType.AdaptScreenWidthTypeNone {
            return
        }
        
        if !(self.isExceptViewClassWithClassArray(classArray: exceptViews)) {
            
            let adaptConstraint: Bool = (type == BSAdaptScreenWidthType.BSAdaptScreenWidthTypeConstraint) || (type == BSAdaptScreenWidthType.BSAdaptScreenWidthTypeAll)
            
            let adaptFontSize: Bool = (type == BSAdaptScreenWidthType.BSAdaptScreenWidthTypeFontSize) || (type == BSAdaptScreenWidthType.BSAdaptScreenWidthTypeAll)
            
            let adaptCornerRadius: Bool = (type == BSAdaptScreenWidthType.BSAdaptScreenWidthTypeCornerRadius) || (type == BSAdaptScreenWidthType.BSAdaptScreenWidthTypeAll)
            
            if adaptConstraint {
                for obj in self.constraints {
                    obj.constant = self.AdaptW(floatValue: obj.constant)
                }
            }
            
            if adaptFontSize {
                if self.isKind(of: UILabel.self) {
                    let resLbl: UILabel = self as! UILabel
                    resLbl.font = self.fontChange(fontValue: resLbl.font)
                }else if self.isKind(of: UITextField.self) {
                    let resTxt: UITextField = self as! UITextField
                    resTxt.font = self.fontChange(fontValue: resTxt.font!)
                }else if self.isKind(of: UIButton.self) {
                    let resBtn: UIButton = self as! UIButton
                    resBtn.titleLabel!.font = self.fontChange(fontValue: resBtn.titleLabel!.font)
                }else if self.isKind(of: UITextView.self) {
                    let resTxtView: UITextView = self as! UITextView
                    resTxtView.font = self.fontChange(fontValue: resTxtView.font!)
                }
            }
            
            if adaptCornerRadius {
                self.layer.cornerRadius = self.AdaptW(floatValue: self.layer.cornerRadius)
            }
            
            for obj in self.subviews {
                obj.adaptScreenWidthType(type: type, exceptViews: exceptViews)
            }
        }
        
    }
    
    func fontChange(fontValue: UIFont) -> UIFont {
        var resFont: UIFont
        if fontValue.fontName.contains("Bold")||fontValue.fontName.contains("bold") {
            resFont = UIFont.boldSystemFont(ofSize: self.AdaptW(floatValue: fontValue.pointSize))
        }else{
            resFont = UIFont.systemFont(ofSize: self.AdaptW(floatValue: fontValue.pointSize))
        }
        return resFont
    }
    
    func isExceptViewClassWithClassArray(classArray: Array<AnyClass>?) -> Bool {
        
        var isExcept: Bool = false;
        if classArray == nil {
            return isExcept
        }
        for (idx, obj) in classArray!.enumerated() {
            if self.isKind(of: obj) {
                isExcept = true
            }
        }
        return isExcept
    }
    
    func AdaptW(floatValue: CGFloat) -> CGFloat {
        return floatValue * kscreenWidth / (kscreenHeight > 800 ? 375.0 : 320.0)
    }
    
}
