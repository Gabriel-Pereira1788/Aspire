//
//  AnimationSelector.swift
//  AnimationsExamples
//
//  Created by Aether on 11/07/2023.
//

import SwiftUI

enum SelectionMode: Int, CaseIterable {
    case easy
    case medium
    case hard
    
    
    var imageName: String {
        switch self {
        case .easy:
            return "leaf"
        case .medium:
            return "cloud"
        case .hard:
            return "sparkles"
        }
    }
    
    var title: String {
        switch self {
        case .easy:
            return "Relax"
        case .medium:
            return "Focus"
        case .hard:
            return "Deep"
        }
    }
}


struct SelectionView: View {
    @AppStorage("selectionModeKey") private var animationsMode: SelectionMode = .easy
    @Environment(\.colorScheme) var colorScheme
    let color = Color.indigo // Replace with your desired color
    var onSelect:(_ mode:SelectionMode) -> Void
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(SelectionMode.allCases.indices, id: \.self) { index in
                    let mode = SelectionMode.allCases[index]
                    let makeDivider = index < SelectionMode.allCases.count - 1
                    
                    Button {
                        animationsMode = mode
                        onSelect(mode)
                    } label: {
                        VStack(spacing: 7) {
                            Image(systemName: mode.imageName)
                                .font(.title2)
                                .foregroundStyle(.black)
                            
                            Text(mode.title)
                                .font(.caption)
                                .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(8)
                        .padding(.vertical, 13)
                        
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(BouncyButton())
                    
                    if makeDivider {
                        if !(index == animationsMode.rawValue || (index + 1) == animationsMode.rawValue )  {
                            Divider()
                                .frame(width: 0, height: 55)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 2)
            .background {
                GeometryReader { proxy in
                    let caseCount = SelectionMode.allCases.count
                    color.opacity(0.1)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: proxy.size.width / CGFloat(caseCount))
                        .offset(x: proxy.size.width / CGFloat(caseCount) * CGFloat(animationsMode.rawValue))
                }
            }
            
            .padding(12)
            .padding(.horizontal, 25)
            .animation(.smooth, value: animationsMode)
            
            
        }
    }
}

struct BouncyButton: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .scaleEffect(x: configuration.isPressed ? 0.95 : 1.0, y: configuration.isPressed ? 0.9 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}



struct Animations_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView {select in print(select)}
    }
}
