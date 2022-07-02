//
//  SignUpViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberValidationLabel: UILabel!
    @IBOutlet weak var phoneIntroTableView: UITableView!
    @IBOutlet weak var introButton: UIButton!
    @IBOutlet var countriesView: UIView!
    @IBOutlet weak var phoneNumberCompletionLabel: UITextField!
    
    let signUpModel = SignUpViewModel()
    var countriesModel: CountriesModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signUpModel.signUpDelegate = self
        countriesModel = CountriesModel(error: true, msg: "no data yet", data: [])
    }
    
    private func fetchCountries() {
        signUpModel.getCountries()
    }
    private func addCountriesView() {
        
        self.view.addSubview(countriesView)
        self.countriesView.center = self.view.center
    }
    private func removeCountriesView() {
        self.countriesView.removeFromSuperview()
    }
    @IBAction func countriesButtonAction(_ sender: Any) {
        addCountriesView()
        fetchCountries()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continueSegue" {
            
            guard let verifyPhoneVC = segue.destination as? VerifyPhoneViewController else { return }
            verifyPhoneVC.phoneNumber = getPhoneNumber()
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "continueSegue" {
            if self.signUpModel.checkPhoneNumberValidation(getPhoneNumber()) {
                changePhoneBorder(.lightGray)
                showPhoneAlert(true)
                return true
            } else {
                changePhoneBorder(.red)
                showPhoneAlert(false)
                return false
            }
        } else {
            return false
        }
    }
    private func getPhoneNumber() -> String {
        let phoneNumber = signUpModel.preparePhoneNumber(self.introButton.titleLabel!.text!, self.phoneNumberCompletionLabel.text!)
        return phoneNumber
    }
    private func showPhoneAlert(_ hidden: Bool) {
        phoneNumberValidationLabel.isHidden = hidden
    }
    
    private func changePhoneBorder(_ color: UIColor) {
        self.phoneNumberCompletionLabel.borderColor = color
    }
    
    @IBAction func dismissCountrisViewAction(_ sender: Any) {
        self.countriesView.removeFromSuperview()
    }
}

extension SignUpViewController: SignUpDlegate {
    func updateCountriesUI(_ countries: CountriesModel) {
        countriesModel = countries
        self.phoneIntroTableView.reloadData()
    }
}

extension SignUpViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.countriesModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "phoneIntro") as? PhoneIntroTableViewCell else {
            fatalError()
        }
        cell.populateData(self.countriesModel.data[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.countriesModel.data[indexPath.row]
        if let dailCode =  data.dialCode {
            introButton.titleLabel?.text =  data.unicodeFlag + " +" + "" + dailCode
            self.removeCountriesView()
        }
    }
}
