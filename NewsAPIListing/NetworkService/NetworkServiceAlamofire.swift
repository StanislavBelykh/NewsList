//
//  NetworkServiceAlamofire.swift
//  NewsAPIListing
//
//  Created by Полина on 14.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import Alamofire
import Foundation

class NetworkServiceAlamofire{
    
    
    private let baseUrl = "https://newsapi.org/v2"
    
    static let session: SessionManager = {
    let config = URLSessionConfiguration.default
    config.timeoutIntervalForRequest = 60
    let session = SessionManager(configuration: config)
    return session
    }()
    
    public func sendRequest(pageIndex: Int, completionHandler: @escaping (_ list:NewsListModel) -> ()) {
            let path = "/top-headlines"
            
            let params: Parameters = [
                "country": "ru",
                "apiKey": "4720b610ced94caaa8cacce73a214274",
                "pageSize": 20,
                "page": pageIndex
            ]
            
            NetworkServiceAlamofire.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
                
//                guard let json = response.value else { return }
                
                switch response.result {
                case .success(let value):
                    //Ответ с данными JSON
                    do {
                        let listNews = try JSONDecoder().decode(NewsListModel.self, from: response.data!)
                        completionHandler(listNews)
                        print(listNews.articles?.count ?? " ")
                        print(value)
                    } catch let error {
                        print(error)
                    }

//                    print(value)
                    
                case .failure(let error):
                    print(error)
                }
                
            print("end")
        }
        
    }
}

