//
//  StoryView.swift
//  NvShu
//
//  Created by m1e on 2024/2/26.
//

import SwiftUI

struct StoryView: View {
    @EnvironmentObject var userData:UserData
    @State var nvShuChars = [ NvShuNi(),NvShuHao(),NvShuNv(), NvShuShu()]
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
            VStack{
                
                VStack(spacing: 10) {
                    Text("N\u{00FC}Shu").font(.title).bold().padding()
                    
                }
                ScrollView {
                    VStack{
                        Text("Prologue")
                            .font(.headline)
                            .padding()
                        Text("      "+"The women's script culture originated in Jiangyong, Hunan, China. Among the fascinating stories about the origin of women's script, none is more famous than the tale of Pan Qiao creating characters. This story portrays an ancient Chinese woman who, through her wisdom, overcame challenges and ultimately liberated herself.").padding()
                        ForEach(nvShuChars.indices,id:\.self){index in
                            if userData.progress>index{
                                Text("Chapter \(index + 1)")
                                    .font(.headline)
                                    .padding()
                                Text("      "+nvShuChars[index].story).padding()
                            }
                        }
                        if userData.progress<4{
                            Text("To be continued...")
                                .font(.headline)
                                .padding()
                        }
                    }
                    
                }
                Spacer()
                if userData.progress<4{
                    Text("Missing Pieces:\(4 - userData.progress)")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.vertical,5)
                        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                        .cornerRadius(10)
                        .padding()
                }
                HStack{
                    Button(action: {
                        withAnimation(.spring()){
                            if userData.progress==4{
                                userData.appStage = 3
                            }else{
                                userData.appStage = 2
                            }
                            
                        }
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
                                    .overlay{
                                        HStack(spacing:0){
                                            Image(systemName:"book")
                                                .imageScale(.large)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .padding(.leading)
                                                
                                            Text(userData.progress==4 ? "To Final Page" : "Collect Story Pieces!")
                                                .font(.title2)
                                                .foregroundColor(.black)
                                                .padding()
                                            
                                        }
                                        .background(Color.white)
                                    }
                                    .frame(width:280,height: 60)
                        
                    }
                }
                
            }
        }
        
        
    }
}
