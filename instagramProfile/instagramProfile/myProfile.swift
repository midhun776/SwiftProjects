//
//  myProfile.swift
//  instagramProfile
//
//  Created by DDUKK on 17/10/24.
//

import SwiftUI

struct myProfile: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: HorizontalAlignment.leading){
                    HStack{
                        HStack{
                            Image(systemName: "lock")
                            Text("midhunn.m_")
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "plus")
                            Image(systemName: "line.horizontal.3")
                        }
                    }
                    //Image
                    HStack{
                        Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 90, height: 90).clipShape(Circle())
                        Spacer()
                        VStack{
                            Text("16").font(.system(size: 18)).bold()
                            Text("posts").font(.system(size: 12))
                        }
                        Spacer()
                        VStack{
                            Text("936").font(.system(size: 18)).bold()
                            Text("followers").font(.system(size: 12))
                        }
                        Spacer()
                        VStack{
                            Text("1,273").font(.system(size: 18)).bold()
                            Text("following").font(.system(size: 12))
                        }
                        Spacer()
                    }
        
                    //Name & Description
                    VStack(alignment: HorizontalAlignment.leading, spacing: 3){
                        Text("Midhun Murali").font(.system(size: 15)).bold()
                        Text("@midhun.m_").font(.system(size: 12))
                        Text("⚽❤️")
                        Text("Trust the magic of new beginnings").font(.system(size: 12))
                        Text("@meeee.muuuu").font(.system(size: 12)).foregroundColor(Color.blue)
                    }.padding(.vertical)
        
                    HStack{
                        Button {
        
                        } label: {
                            Spacer()
                            Text("Edit Profile").font(.system(size: 13)).bold().foregroundColor(Color.white)
                            Spacer()
                        }.padding(9).background(Color.blue).cornerRadius(5)
        
                        Spacer()
        
                        Button {
        
                        } label: {
                            Spacer()
                            Text("Share Profile").font(.system(size: 13)).bold().foregroundColor(Color.white)
                            Spacer()
                        }.padding(9).background(Color.blue).cornerRadius(5)
                        Spacer()
                        Button {
        
                        } label: {
                            ZStack{
                                Image(systemName: "person").foregroundColor(Color.white)
                                Image(systemName: "plus").resizable().scaledToFit().frame(width: 7, height: 7).offset(x: -9, y: -5).foregroundColor(Color.white)
                            }
                        }.padding(9).background(Color.blue).cornerRadius(5)
                    }
        
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(0..<8) { index in               Image("photo").resizable().aspectRatio(contentMode: .fill).frame(width: 60, height: 60).clipShape(Circle()).padding(5)
                            }
                        }
                    }
        
                    HStack{
                        Spacer()
                        Image("posts").resizable().frame(width: 30, height: 30)
                        Spacer()
                        Image("reels").resizable().frame(width: 30, height: 30)
                        Spacer()
                        Image("tag").resizable().frame(width: 30, height: 30)
                        Spacer()
                    }
        
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(0...12, id: \.self) { index in
                            NavigationLink(destination: instaPost(post: "post\(String(index))")){
                                Image("post\(index)").resizable().aspectRatio(contentMode: ContentMode.fit).frame(width: 120, height: 120)
                            }
                        }
                    }
        
                }.padding(.horizontal)
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct myProfile_Previews: PreviewProvider {
    static var previews: some View {
        myProfile()
    }
}
