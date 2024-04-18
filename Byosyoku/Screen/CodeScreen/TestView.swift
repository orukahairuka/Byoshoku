import SwiftUI

struct TestView: View {
    @State private var items: [Hit] = []
    var body: some View {
        List(items) { item in
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
        .onAppear {
            APIController(janCode: "4909411084875") { result in
                switch result {
                case .success(let welcome):
                    self.items = welcome.hits
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
