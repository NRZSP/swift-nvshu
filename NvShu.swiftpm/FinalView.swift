//
//  FinalView.swift
//  NvShu
//
//  Created by m1e on 2024/2/26.
//

import SwiftUI

struct FinalView: View {
    let transition: AnyTransition = .asymmetric(insertion: .opacity, removal: .opacity)
    @State var span1 = false
    @State var span2 = false
    @State var span3 = false
    @EnvironmentObject var userData:UserData
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
                        Text("Congratulations!")
                            .font(.headline)
                            .padding()
                        Text("You have completed all the imitations and collected all the fragments of the stories.").padding().multilineTextAlignment(.center)
                        Text("Today, Liming believes that Nüshu remains an empowering means to appreciate women’s beauty and strength.").padding().multilineTextAlignment(.center)
                        Text("Nüshu has completed her historical mission – a cultural tool for lower-class working women who did not have the right to education to write languages").padding().multilineTextAlignment(.center)
                        Text("Now she only leaves beautiful calligraphy, wisdom and brave spirit to future generations.").font(.headline).padding().multilineTextAlignment(.center)
                        Spacer().frame(height: 50)
                        Text("Learn more about N\u{00FC}Shu")
                            .font(.headline)
                            .padding()
                        Text("Characteristics of Nüshu Script")
                            .onTapGesture {
                                withAnimation(.spring()){
                                    span1.toggle()
                                }
                            }
                            .padding()
                            .underline()
                        if span1{
                            Text("      Nüshu is a phonetic script read right to left that represents an amalgamation of four local dialects spoken across rural Jiangyong. Each symbol represents a syllable and was written using sharpened bamboo sticks and makeshift ink from the burnt remains left in a wok. Influenced by Chinese characters, its style is traditionally more elongated with curved, threadlike strokes sloping diagonally downwards and was sometimes referred to as “mosquito writing” by locals because of its spindly appearance.").padding().transition(transition)
                        }
                        Text("The Relationship between Nüshu Script and Feminism")
                            .onTapGesture {
                                withAnimation(.spring()){
                                    span2.toggle()
                                }
                            }
                            .padding()
                            .underline()
                        if span2{
                            Text("      Nüshu provided a way for women to cope with domestic and social hardships and helped to maintain bonds with friends in different villages. Convivial words of friendship and happiness were embroidered in Nüshu on handkerchiefs, headscarves, fans or cotton belts and exchanged. Though Nüshu wasn’t spoken, women at social gatherings sang and chanted songs or poems that varied from nursery rhymes to birthday tributes to personal regrets or marriage complaints using Nüshu phrases and expressions. Older women often composed autobiographical songs to tell their female friends about their miserable experiences or to promote morality and teach other women how to be good wives through chastity, piety and respect.").padding().transition(transition)
                        }
                        Text("The Significance of Nüshu Script in the Contemporary Era")
                            .onTapGesture {
                                withAnimation(.spring()){
                                    span3.toggle()
                                }
                                
                            }
                            .padding()
                            .underline()
                        if span3{
                            Text("      Though Nüshu is now understood as a means of communication for women who had not been afforded the privileges of reading and writing in Chinese, it was originally believed to be a code of defiance against the highly patriarchal society of the time. Historically, it was not socially acceptable for Chinese women to openly talk about personal regrets, the hardships of agricultural life or feelings of sadness and grief. Nüshu provided an outlet for the women and helped to create a bond of female friendship and support that was of great importance in a male-dominated society.").padding().transition(transition)
                        }
                    }
                    
                }
                Spacer()
                
                
                Button(action: {
                    withAnimation(.spring()){
                        userData.appStage = 1
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
                                            
                                        Text("Back to Story View")
                                            .font(.title2)
                                            .foregroundColor(.black)
                                            .padding()
                                        
                                    }
                                    .background(Color.white)
                                }
                                .frame(width:280,height: 60).padding()
                    
                }
            }
        }
    }
}

#Preview {
    FinalView()
}
