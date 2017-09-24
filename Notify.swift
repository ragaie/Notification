//
//  Notify.swift
//  Notification-simulate
//
//  Created by Ragaie alfy on 9/20/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit



extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}


 class Notify: UIView {

    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var logoImage: UIImageView!
    
    
    @IBOutlet weak var appName: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    
    override init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()

    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()

    }
    
    func initSubviews() {
        
        
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "Notify", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        
        //   view.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 200)
        // Make the view stretch with containing view
        // to fit like you want in storyboard
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        addSubview(view)
        
        
       
        
    }
    
  

}


class Notification : NSObject{
    private var notifyView : Notify!
    
    
    override init(){
        super.init()
    }
    
    init(_ message : String){
        
        notifyView = Notify.init(frame: CGRect.init(x: 5, y: -100, width: UIScreen.main.bounds.width - 10, height: 90))
        notifyView.layer.cornerRadius = 12
      //  notifyView.headerView.layer.cornerRadius = 12
        
        
        
   
    }
    init(_ message : String,title : String,date : NSDate){
        super.init()

        notifyView = Notify.init(frame: CGRect.init(x: 5, y: -100, width: UIScreen.main.bounds.width - 10, height: 90))
        notifyView.layer.cornerRadius = 12
        
        notifyView.titleLabel.text = title
        notifyView.messageLabel.text = message
        notifyView.dateLabel.text = stringDate(date)
        
        
        
        
        
        
        
        
    }
    
    
    
    func Show(){
        
        
        
        if notifyView != nil {
            UIApplication.shared.keyWindow?.addSubview(notifyView)
            
            UIView.animate(withDuration: 1.0, delay: 0.2, options: .curveEaseOut, animations: {
                var basketTopFrame = self.notifyView.frame
                
                basketTopFrame.origin.y = 16
                
                
                self.notifyView.frame = basketTopFrame
                
                
            }, completion: { finished in
                print("Ragaie doors opened!")
            })
            
            
            
            UIView.animate(withDuration: 1.0, delay: 2.5, options: .curveEaseOut, animations: {
                var basketTopFrame = self.notifyView.frame
                
                basketTopFrame.origin.y -= basketTopFrame.height + 16
                
                
                self.notifyView.frame = basketTopFrame
            }, completion: { finished in
                print("Ragaie doors opened!")
            })
            
            
            
            
        }
    }
    
    func stringDate(_ date : NSDate)->String{
    
        
        
        
        let formatter = DateFormatter()
        
            formatter.dateFormat = "dd:MM , hh:mm a"
        
        let result = formatter.string(from: date as Date)
        
        return result
        
    }
    
    
    
}
