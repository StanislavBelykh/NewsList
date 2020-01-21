//
//  NewsListModel.swift
//  NewsAPIListing
//
//  Created by Полина on 14.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import Foundation



public struct NewsListModel: Codable {

    public var status: String?
    public var totalResults: Int?
    public var articles: [NewsModel]?

    public init(status: String?, totalResults: Int?, articles: [NewsModel]?) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }


}
