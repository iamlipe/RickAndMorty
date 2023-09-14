//
//  CharactersDataProvider.swift
//  RickAndMorty
//
//  Created by Felipe Lima on 13/09/23.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [CharacterModel]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

class CharacterDataProvider {
    func fetchCharacters(completion: @escaping ([CharacterModel]?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(CharacterResponse.self, from: data)
                completion(result.results)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
    }
}


