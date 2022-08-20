//
//  Home.swift
//  CustomCarouseSlider
//
//  Created by DONG SHENG on 2022/8/20.
//

// 自定一個 SnapCarousel
// 需要的話可以 搭配 TabView 做背景圖

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    @State var posts: [PostModel] = []
    
    var body: some View {
        ZStack{
            
            // 這邊的 spacing、trailingSpace 都可以做調整
            SnapCarousel(spacing: getRect().height < 750 ? 12 : 20,
                         trailingSpace: getRect().height < 750 ? 100 : 150,
                         index: $currentIndex,
                         item: posts) { post in
                
                VStack(spacing: 10){
                    GeometryReader{ proxy in
                        
                        let size = proxy.size
                        
                        Image(post.postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width ,height: size.height)
                            .cornerRadius(25)
                    }
                    .frame(height: getRect().height / 2.5)
                    .padding(.bottom ,15)
                    
                    // 這邊可以添加資訊
                    Text(post.postImage)
                }
            }
            .offset(y: getRect().height / 4)
//            .padding(.vertical ,40)
        }
        .onAppear{
            for index in 1...5{
                posts.append((PostModel(postImage: "post\(index)")))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Home{
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
