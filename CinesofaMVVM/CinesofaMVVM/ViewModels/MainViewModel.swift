//
//  MainViewModel.swift
//  CinesofaMVVM
//
//  Created by Fabricio Rodrigo Baixo on 1/13/21.
//

import Foundation
import UIKit





protocol MainViewModelDelegate{
    func reloadData(filme: ResultViewData)
}

class MainViewModel {
    
    private let client: FilmeServiceProtocol
    var viewData: Bindable<ResultViewData?> = Bindable(nil)
    var delegate: MainViewModelDelegate?
    
    init(client: FilmeServiceProtocol = FilmeService()){
        self.client = client
    }
    
    func loadMovie(){
        client.getFilme(poster: "") { (filme) in
            self.delegate?.reloadData(filme: ResultViewData(model: filme))
        } failure: { (error) in
            print(error)
        }

    }
//enum MainViewModelItemType{
//    case filme
//}
//
//protocol MainViewModelItem {
//    var tipo: MainViewModelItemType { get }
//    var tituloSecao: String {get}
//    var numeroLinhas: Int { get }
//}
//
//class MainViewModel: NSObject{
//    var items = [MainViewModelItem]()
//
//    override init() {
//        super .init()
//    }
    
    
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
