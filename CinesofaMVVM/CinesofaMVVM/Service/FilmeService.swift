//
//  FilmeService.swift
//  CinesofaMVVM
//
//  Created by Fabricio Rodrigo Baixo on 1/13/21.
//

import Foundation

protocol FilmeServiceProtocol{
    func getFilme(poster: String, completionHandler: @escaping(_ filme: Result) -> Void, failure: (_ error: String) -> Void)
}

class FilmeService: FilmeServiceProtocol{
    
    private let urlResult = "https://api.themoviedb.org/3/trending/all/week?api_key=214c206d6a89ab0b5b38efbcc5a71587&language=pt-BR"
    private var results = [Result]()
    
    init() {
        listaFilmesDaSemana()
    }
    
    func getFilme(poster: String, completionHandler: @escaping (Result) -> Void, failure: (String) -> Void) {
        if let movie = results.filter({ $0.title == poster}).first {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                completionHandler(movie)
            }
        } else {
            failure("não foi encotrado nenhum filme")
        }
    }
    
    func listaFilmesDaSemana(){
      
              guard let urlFilmes = URL(string: urlResult)else{return}
      
              let request = URLRequest(url:urlFilmes)
      
              let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
      
                     if let error = error {
                         print(error)
                         return
                     }
      
                     // Parse JSON data
                     if let data = data {
                      self.results = self.criaObjetoResult(data: data)
      
//                         // Reload table view
//                         OperationQueue.main.addOperation({
//                             self.tableView.reloadData()
//                         })
                     }
                 })
      
                 task.resume()
          }
      
      func criaObjetoResult(data: Data) -> [Result]{
          
          var results = [Result]()
          
          let decoder = JSONDecoder()
    
              do {
                  let resultDataStore = try decoder.decode(ResultDataStore.self, from: data)
                  results = resultDataStore.results
              } catch {
                  print(error)
              }
       
          return results
      }
    
    
}
