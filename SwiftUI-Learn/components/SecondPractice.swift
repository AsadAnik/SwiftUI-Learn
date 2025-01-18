//  SecondPractice.swift
//  swiftUIPracticeApp
//
//  Created by Asad Anik on 12/31/24.

import SwiftUI

struct Fruit: Identifiable {
    let id: UUID = UUID();
    let name: String;
    var isFavorite: Bool;
    
    mutating func toggleFavorite(action: Bool) -> Void {
        self.isFavorite = action;
    }
}

// Parent..
struct SecondPractice: View {
    // Displaying the Data with list..
    var count = 0;
    
    // INITIALIZER for DEBUGGING..
    // And render checking.. counting..
    init() {
        self.count += 1;
        print("-- rendered -- \(self.count)");
        print("MY LIST HERE - ", self.items);
    }
    
    let items: [Fruit] = [
        Fruit(name: "Apple", isFavorite: true),
        Fruit(name: "Orange", isFavorite: false),
        Fruit(name: "Mango", isFavorite: false),
        Fruit(name: "Banana", isFavorite: true),
        Fruit(name: "Pinaple", isFavorite: false),
        Fruit(name: "Jack-Fruit", isFavorite: false)
    ];
    
    // MARK: MAIN VIEW
    var body: some View {
        NavigationView {
            VStack {
                Text("I am here for View only here")
                    .font(.headline);
                
                List(self.items, id: \.self.id) { item in
                    if (item.isFavorite == false) {
                        NavigationLink(destination: DetailsView(item: item)) {
                            Text(item.name)
                                .font(.headline);
                            
                            Spacer();
                            
                            Image(systemName: "star");
                        }
                    }
                }
                
                
                Text("Favorite List")
                    .font(.headline)
                
                List(self.items) { item in
                    if (item.isFavorite == true) {
                        NavigationLink(destination: DetailsView(item: item)) {
                            Text(item.name)
                                .font(.headline);
                            
                            Spacer();
                            
                            Image(systemName: "star.fill");
                        }
                    }
                }
                
                
            }
        }
        .navigationTitle("Second Day")
//        .navigationBarBackButtonHidden();
    }
}


// Child..
struct DetailsView: View {
    var item: Fruit;
    
    // printing the make favorite function..
    func makeFav() -> Void {
        print("This is item: \(item.name)");
    }
    
    // MARK: DETAILS VIEWstar
    var body: some View {
        VStack {
            if self.item.isFavorite == false {
                Image(systemName: "star")
                    .font(.largeTitle)
            } else {
                Image(systemName: "star.fill")
                    .font(.largeTitle)
            }
            
            Text("\(item.name)")
                .font(.title);
            
            Text("you have selected")
                .textCase(.uppercase)
                .font(.subheadline);
            
            MakeFavoriteButton(title: "Make it Favorite", actionFunc: makeFav)
        }
        .navigationTitle("Fruit: \(self.item.name)")
//        .navigationBarBackButtonHidden();
    }
}
