import SwiftUI

struct ResearchView: View {
    @State private var items: [Hit] = []
    @State var inputQuery: String = ""
    var body: some View {
        VStack {
            TextField("商品名入力して", text: $inputQuery)
            List(items, id: \.code) { item in
                HStack {
                    AsyncImage(url: URL(string: item.image.medium)) { image in
                        image.resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }

                    VStack(alignment: .leading) {
                        Text(item.name).font(.headline)
                        Text("価格: \(item.price)円").font(.subheadline)
                        Text("在庫: \(item.inStock ? "あり" : "なし")").font(.subheadline)
                        Text("販売者: \(item.seller.name)").font(.subheadline)
                    }
                }
            }
            Button {
                ResearchController(query: inputQuery) { result in
                    switch result {
                    case .success(let welcome):
                        self.items = welcome.hits
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    }
                }
            } label: {
                Text("検索")
            }
        }
    }
}

