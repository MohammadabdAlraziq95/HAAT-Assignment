//
//  CartViewController.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit
class CartViewController: UIViewController {
    
    var cartItems: [CartItemInfo] = []
    var cartViewModel = CartViewModel()
    @IBOutlet weak var cartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cartViewModel.cartDelegate = self
        getData()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getData()
    }
    private func getData() {
        cartViewModel.fetchCart()
    }
    
    @IBAction func fatalErrorAction(_ sender: Any) {
        let customAlert = RTCustomAlert()
        customAlert.alertTitle = "Oops"
        customAlert.alertMessage = ErrorGenerator().generateError()
        customAlert.alertTag = 1
        customAlert.isCancelButtonHidden = true
        customAlert.delegate = self
        self.present(customAlert, animated: true)
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartTableViewCell
        cell?.cartCellDelgate = self
        cell?.populateData(meal: self.cartItems[indexPath.row])
        return cell!
    }
}
extension CartViewController: CartCellDelgate {
    func deleteCartItem(cartItem: CartItemInfo) {
        self.cartViewModel.deleteToCart(identifer: cartItem)
        getData()
    }
}
extension CartViewController: CartViewModelDelegate {
    func displayCart(cartItems: [CartItemInfo]) {
        self.cartItems = cartItems
        self.cartTableView.reloadData()
    }
}
extension CartViewController: RTCustomAlertDelegate {
    func okButtonPressed(_ alert: RTCustomAlert, alertTag: Int) {
        
        if alertTag == 1 {
            print("Single button alert: Ok button pressed")
        } else {
            print("Two button alert: Ok button pressed")
        }
        print(alert.alertTitle)
    }
    func cancelButtonPressed(_ alert: RTCustomAlert, alertTag: Int) {
        print("Cancel button pressed")
    }
}
