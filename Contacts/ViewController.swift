//
//  ViewController.swift
//  Contacts
//
//  Created by Руслан on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [ContactsCellData] = [ContactsCellData(id: 1, name: "Ruslan", surname: "Gazizov",
                                                     placeOfWork: "Home", phoneNumber: "89999999999",
                                                     comment: "some comment"),
                                    ContactsCellData(id: 2, name: "Nikita", surname: "Sosyuk",
                                                     placeOfWork: "???", phoneNumber: "88888888888",
                                                     comment: "some comment"),
                                    ContactsCellData(id: 3, name: "Nikita", surname: "Lyapustin",
                                                     placeOfWork: "???", phoneNumber: "87777777777",
                                                     comment: "some comment"),
                                    ContactsCellData(id: 4, name: "Paul", surname: "George",
                                                     placeOfWork: "NBA LAC", phoneNumber: "86666666666",
                                                     comment: "some comment"),
                                    ContactsCellData(id: 5, name: "Chris", surname: "Paul",
                                                     placeOfWork: "NBA Suns", phoneNumber: "85555555555",
                                                     comment: "some comment"),
                                    ContactsCellData(id: 6, name: "Stephen", surname: "Curry",
                                                     placeOfWork: "NBA Warriors", phoneNumber: "84444444444",
                                                     comment: "some comment"),
                                    ContactsCellData(id: 7, name: "James", surname: "Harden",
                                                     placeOfWork: "NBA Brooklyn", phoneNumber: "83333333333",
                                                     comment: "some comment")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func NewButtonAction(_ sender: Any) {
        guard let newContactViewController = storyboard?.instantiateViewController(withIdentifier: "AddDetailViewController") as? AddDetailViewController else { return }
        
        newContactViewController.delegate = self
        newContactViewController.countOfRows = data.count
        
        present(newContactViewController, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let contactViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        contactViewController.delegate = self
        contactViewController.contact = data[indexPath.row]
        
//        navigationController?.pushViewController(contactViewController, animated: true)
        present(contactViewController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as? ContactsTableViewCell else { return UITableViewCell() }
        cell.setData(contact: data[indexPath.row])
        return cell
    }
}

extension ViewController: DetailViewControllerDelegate {
    func saveNewDataOfContact(_ contact: ContactsCellData) {
        if let index = data.firstIndex(where: { $0.id == contact.id }) {
            data[index] = contact
            tableView.reloadData()
        }
    }

    func addNewDataOfContact(_ contact: ContactsCellData) {
        let lastId = data.last?.id ?? 0
        data.append(ContactsCellData(id: lastId + 1, name: contact.name, surname: contact.surname, placeOfWork: contact.placeOfWork, phoneNumber: contact.phoneNumber, comment: contact.comment))
        tableView.reloadData()
    }
}

struct ContactsCellData {
    let id: Int
    var name: String
    var surname: String
    var placeOfWork: String
    var phoneNumber: String
    var comment: String
}

