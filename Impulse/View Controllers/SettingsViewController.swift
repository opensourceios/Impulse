//
//  SettingsViewController.swift
//  Impulse
//
//  Created by Jasdev Singh on 7/15/15.
//  Copyright (c) 2015 Jasdev. All rights reserved.
//

import UIKit
import Spring
import Timepiece

let defaults = NSUserDefaults.standardUserDefaults()
let defaultsKeyForAge = "imp_Age"

protocol SettingsDelegate: class {
    func setBirthday(date: NSDate)
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var containerView: SpringView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var datePicker: IMPWhiteColoredDatePicker!

    weak var delegate: SettingsDelegate? = nil

    private let animationTime: CGFloat = 0.5
    private let minBirthday = NSDate.date(year: 1815, month: 1, day: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        confirmButton.imageView?.contentMode = .ScaleAspectFit
        datePicker.minimumDate = minBirthday
        datePicker.maximumDate = NSDate()
    }

    @IBAction func cancelPressed(sender: UIButton) {
        containerView.animation = "fall"
        containerView.duration = animationTime
        containerView.animateNext {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func confirmPressed(sender: UIButton) {
        // TODO: Save to NSUserDefaults

        containerView.animation = "zoomOut"
        containerView.duration = animationTime
        delegate?.setBirthday(datePicker.date)

        containerView.animateNext {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
