//
//  Sender.swift
//  PinpointKit
//
//  Created by Brian Capps on 2/5/16.
//  Copyright © 2016 Lickability. All rights reserved.
//

import UIKit

/// A behavior protocol that describes an object that sends feedback.
protocol Sender {
    
    /// A delegate that is informed of successful or failed feedback sending.
    var delegate: SenderDelegate? { get set }
    
    /**
     Sends the feedback using the provided view controller as a presenting view controller.
     
     - parameter feedback:       The feedback to send.
     - parameter viewController: The view controller from which to present any of the sender’s necessary views.
     */
    func sendFeedback(feedback: Feedback, fromViewController viewController: UIViewController?)
}

/// A delegate protocol describing an object that receives success and failure events from a `Sender`.
protocol SenderDelegate: class {
    
    /**
     Notifies the delegate that the sender successfully sent the feedback with a given type of success.
     
     - parameter sender:   The object responsible for the successful sending.
     - parameter feedback: The feedback that was sent.
     - parameter success:  The optional type of success.
     */
    func sender(sender: Sender, didSendFeedback feedback: Feedback?, success: SuccessType?)
    
    /**
     Notifies the delegate that the sender failed to send the feedback with a given error.
     
     - parameter sender:   The object responsible for the failed sending.
     - parameter feedback: The feedback that failed to send.
     - parameter error:    The error that caused the failure.
     */
    func sender(sender: Sender, didFailToSendFeedback feedback: Feedback?, error: ErrorType)
}
