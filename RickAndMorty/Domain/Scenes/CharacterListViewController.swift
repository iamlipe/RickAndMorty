//
//  CharacterListViewController.swift
//  RickAndMorty
//
//  Created by Felipe Lima on 13/09/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var characterDataProvider = CharacterDataProvider()
    var characters: [CharacterModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        fetchCharacters()
    }
    
    func fetchCharacters() {
        characterDataProvider.fetchCharacters { [weak self] characters in
            DispatchQueue.main.async {
                if let characters = characters {
                    self?.characters = characters
                    self?.tableView.reloadData()
                }
            }
        }
    }
}

extension CharacterListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as? CharacterTableViewCell {
        
            let character = characters[indexPath.row]
            
            cell.nameLabel?.text = character.name
            cell.statusLabel.text = character.status
            
//            if let imageURL = URL(string: character.image) {
//                if let imageData = try? Data(contentsOf: imageURL) {
//                    let image = UIImage(data: imageData)
//                    cell.characterImageView.image = image
//                }
//            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
