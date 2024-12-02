//
//  ContentView.swift
//  Prueba
//
//  Created by Pedro Lacoste on 01-12-24.
//

import SwiftUI

struct ContentView: View {
    
    @State var news: [NewsItem] = []


    var body: some View {
        NavigationStack {
            List {
                ForEach(news) { item in
                    NavigationLink(destination: ItemDetail(user: item.title)) {
                    
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.strap)
                                .foregroundStyle(.secondary)
                        }
                    
                        
                    }
                    
                }
                .onDelete(perform: delete)
                
            
            }
            
            .task {
                do {
                    
                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    news = try JSONDecoder().decode([NewsItem].self, from: data)
                } catch {
                    news = []
                }
            }
            .refreshable {
                do {
                    
                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    news = try JSONDecoder().decode([NewsItem].self, from: data)
                } catch {
                    news = []
                }
            }
            
        }
    }
    func delete(at offsets: IndexSet) {
           news.remove(atOffsets: offsets)
       }
    
    func deleteItems(at offsets: IndexSet) {
        news.remove(atOffsets: offsets)
        }
        
    
    struct Wrapper: Codable {
        let items: [Question]
    }

    struct Question: Codable {
        let score: Int
        let title: String
    }
}

struct NewsItem: Decodable, Identifiable {
    let id: Int
    let title: String
    let strap: String
}


struct ItemDetail : View {
    var user: String

    var body: some View {
        Text("Selected: \(user)")
            .font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
