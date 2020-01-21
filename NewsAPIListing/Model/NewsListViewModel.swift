//
//  NewsListViewModel.swift
//  NewsAPIListing
//
//  Created by Полина on 14.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import Foundation

final class NewsListViewModel: ObservableObject {
 
    @Published private(set) var articles = [NewsModel]()
    @Published var pageIndex: Int = 0
    @Published var isNewPageLoading = false
    
    let networkServiceAlamofire = NetworkServiceAlamofire()
    
    init() {
        pageLoad()
    }
    func deliteArticles() {
        self.articles = []
    }
    
    func pageLoad() {
        guard isNewPageLoading == false else {
            return
        }
        isNewPageLoading = true
        self.pageIndex += 1
        networkServiceAlamofire.sendRequest(pageIndex: pageIndex){ list in
            self.articles.append(contentsOf: list.articles ?? [])
            self.isNewPageLoading = false
        }
        
        
    }
}
