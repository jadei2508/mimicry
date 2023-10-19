//
//  ContentView.swift
//  alikevich-task7
//
//  Created by Роман on 19/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isClicked: Bool = false
    @Namespace private var namespace
    
    var width: CGFloat {
        isClicked ? UIScreen.main.bounds.size.width * 0.8 : 80
    }
    
    var height: CGFloat {
        isClicked ? UIScreen.main.bounds.size.width * 1.2 : 40
    }
    
    var body: some View {
        VStack() {
            isClicked ? nil : Spacer()
            HStack(alignment: .top) {
                isClicked ? nil : Spacer()
                ZStack(alignment: isClicked ? .topLeading : .center) {
                    Rectangle()
                        .foregroundColor(.blue)
                        .makeSizeAndRound(width: width, height: height)
                    Button {
                        withAnimation {
                            isClicked.toggle()
                        }
                    } label: {
                        HStack(spacing: isClicked ? -5 : 0) {
                            withAnimation {
                                isClicked
                                    ? Image(systemName: "arrowshape.backward.fill")
                                    .foregroundColor(.white)
                                    : nil
                            }
                           
                            Text(isClicked ? "Close" : "Open")
                                .padding(.all, 0)
                            .foregroundColor(.white)
                            .makeSizeAndRound(width: 80, height: 40)
                        }
                        
                    }.font(.title2)
                     .buttonStyle(.borderedProminent)
                     .padding(.all, isClicked ? 4 : 0)
                     .matchedGeometryEffect(id: "Button", in: namespace)
                    
                    isClicked ? Spacer() : nil

                }.transition(.scale)
            }
        }
    }
}

struct AddSizeAndStateView: ViewModifier {
    
    private var width: CGFloat
    private var height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .background(.blue)
            .cornerRadius(10)
    }
}

extension View {
    func makeSizeAndRound(width: CGFloat, height: CGFloat) -> some View {
        return modifier(AddSizeAndStateView(width: width, height: height))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
