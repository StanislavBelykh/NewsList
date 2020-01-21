//
//  ContentView.swift
//  NewsAPIListing
//
//  Created by Полина on 14.01.2020.
//  Copyright © 2020 Станислав Белых. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ImageViewForCellModifire: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 142, height: 80)
            .cornerRadius(8)
    }
}
extension View {
    func setImageViewForCellModifire() -> some View{
        return modifier(ImageViewForCellModifire())
    }
}

struct ContentView: View {
    
    @EnvironmentObject var newsListVM: NewsListViewModel
    
    let networkServiceAlamofire = NetworkServiceAlamofire()
    
    var body: some View {
        
        NavigationView{
            VStack{
                Button("Open"){
                    AppState.shared.toggleOverlay()
                }
                
                
                List /*(newsListVM.articles)*/ { /*article in*/
                    GeometryReader { g -> Text in
                        
                        let frame = g.frame(in: CoordinateSpace.global)
                        if frame.origin.y > 250 {
                            if self.newsListVM.isNewPageLoading == false {
                                self.newsListVM.pageIndex = 0
                                self.newsListVM.deliteArticles()
                                self.newsListVM.pageLoad()
                            }
                            return Text("Loading")
                        } else {
                            return Text(" ")
                        }
                    }
                    
                    //Cell
                    ForEach(self.newsListVM.articles, id:\.id) {article in
                        HStack{
                            KFImage(article.imageURL)
                                .placeholder {
                                    Image("no-image")
                                        .setImageViewForCellModifire()
                            }
                            .resizable()
                            .setImageViewForCellModifire()
                            
                            
                            VStack{
                                Text(article.source?.name ?? "Author")
                                Text(article.date ?? "Date")
                                Text(article.title ?? "Title")
                                    .lineLimit(2)
                                // Loading
                                if self.newsListVM.isNewPageLoading && self.newsListVM.articles.isLastItem(article) {
                                    Divider()
                                    Text("Loading...")
                                }
                                
                            }
                            
                            NavigationLink(destination: WebView(url: article.url ?? " ")){
                                Text(" ")
                            }
                            .fixedSize()
                        }.onAppear {
                            self.onItemShowed(article)
                            
                        }
                    }
                    
                }
                
            }//List
                .navigationBarTitle("News")
        }
    }
}

extension ContentView {
    private func onItemShowed<T:Identifiable>(_ item: T) {
        // Load
        if self.newsListVM.articles.isLastItem(item) {
            self.newsListVM.pageLoad()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NewsListViewModel())
    }
}
