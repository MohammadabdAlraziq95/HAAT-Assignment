//
//  VerifyPhoneViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class VerifyPhoneViewController: UIViewController {
    
    @IBOutlet weak var firstCodeTextField: UITextField!
    @IBOutlet weak var secondCodeTextFiled: UITextField!
    @IBOutlet weak var thirdCodeTextField: UITextField!
    @IBOutlet weak var fourthCodeTextField: UITextField!
    @IBOutlet weak var phoneAlertLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    var phoneNumber = ""
    var verifyPhoneViewModel: VerifyPhoneViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstCodeTextField.delegate = self
        secondCodeTextFiled.delegate = self
        thirdCodeTextField.delegate = self
        fourthCodeTextField.delegate = self
        self.verifyPhoneViewModel = VerifyPhoneViewModel()
        self.verifyPhoneViewModel?.verifyDelegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureUI()
        firstCodeTextField.becomeFirstResponder()
        
    }
    private func configureUI() {
        self.phoneNumberLabel.text = phoneNumber
    }
    private func prepareAuthArray() -> [String] {
        var authCodes: [String] = []
        authCodes.append(self.firstCodeTextField.text!)
        authCodes.append(self.secondCodeTextFiled.text!)
        authCodes.append(self.thirdCodeTextField.text!)
        authCodes.append(self.fourthCodeTextField.text!)
        return authCodes
    }
    private func login() {
        verifyPhoneViewModel?.login(phoneNumber: self.phoneNumber, authCode: self.verifyPhoneViewModel!.prepareAutCode(numbers: prepareAuthArray()))
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "logSegue" {
            login()
            let logged =   UserManager.shared.getUserLoggedin()
            switch logged {
            case true:
                changeTextFiledsColor(.lightGray)
                showAlert(true)
                return logged
            case false:
                changeTextFiledsColor(.red)
                showAlert(false)
                emptyAuthTextFileds()
                return logged
            }
        } else {
            return false
        }
    }
    private func showAlert(_ hidden: Bool) {
        self.phoneAlertLabel.isHidden  = hidden
    }
    private func changeTextFiledsColor(_ color: UIColor) {
        self.firstCodeTextField.borderColor = color
        self.secondCodeTextFiled.borderColor = color
        self.thirdCodeTextField.borderColor = color
        self.fourthCodeTextField.borderColor = color
    }
    private func emptyAuthTextFileds() {
        self.firstCodeTextField.text = ""
        self.secondCodeTextFiled.text = ""
        self.thirdCodeTextField.text = ""
        self.fourthCodeTextField.text = ""
    }
}

extension VerifyPhoneViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text
        if text?.utf16.count == 1 {
            switch textField {
            case firstCodeTextField:
                secondCodeTextFiled.becomeFirstResponder()
            case secondCodeTextFiled:
                thirdCodeTextField.becomeFirstResponder()
            case thirdCodeTextField:
                fourthCodeTextField.becomeFirstResponder()
            case fourthCodeTextField:
                fourthCodeTextField.resignFirstResponder()
            default:
                break
            }
        }
    }
}

extension VerifyPhoneViewController: VerifyDelegate {
    func loggedIn(_ logged: Bool) {
        UserManager.shared.setUserLoggedIn(logged)
    }
}
