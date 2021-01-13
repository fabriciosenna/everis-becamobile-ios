//
//  MainViewModel.swift
//  CinesofaMVVM
//
//  Created by Fabricio Rodrigo Baixo on 1/13/21.
//

import Foundation
import UIKit
import CoreData

enum MainViewModelItemType{
    case filme
}

protocol MainViewModelItem {
    var tipo: MainViewModelItemType { get }
    var tituloSecao: String {get}
    var numeroLinhas: Int { get }
}

class MainViewModel: NSObject{
    var items = [MainViewModelItem]()
    
    private let urlResult = "https://api.themoviedb.org/3/trending/all/week?api_key=214c206d6a89ab0b5b38efbcc5a71587&language=pt-BR"
    private var results = [Result]()
    
    override init() {
        super .init()
        self.listaFilmesDaSemana()
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
      
                         // Reload table view
                         OperationQueue.main.addOperation({
                             //self.tableView.reloadData()
                         })
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
    

        
    
//    class MainViewModelFilmeItem: MainViewModelItem{
//        var type: MainViewModelItemType{
//            return .filme
//        }
//
//        var tituloSecao: String{
//            return "Filmes"
//        }
//
//        var numeroLinhas: Int{
//            return filme.count
//        }
//
//        var filme: [Result]
//
//        init(filme:[Result]){
//            self.filme = filme
//        }
//    }
}

   

