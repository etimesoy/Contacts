//
//  AddDetailViewController.swift
//  Contacts
//
//  Created by Руслан on 02.07.2021.
//

import UIKit

class AddDetailViewController: UIViewController {

    @IBOutlet weak var nameSurnameLabel: UITextField!
    @IBOutlet weak var placeOfWorkTextView: UITextField!
    @IBOutlet weak var phoneNumberTextView: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    var countOfRows: Int?
    weak var delegate: DetailViewControllerDelegate?
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let nameSurname = nameSurnameLabel.text?.split(separator: " ")
        guard let name = nameSurname?[0], let surname = nameSurname?[1] else { return }
        
        let contact = ContactsCellData(id: countOfRows ?? 0 + 1, name: String(name), surname: String(surname), placeOfWork: placeOfWorkTextView.text ?? "", phoneNumber: phoneNumberTextView.text ?? "", comment: commentTextView.text)
        delegate?.addNewDataOfContact(contact)
        
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }

}
