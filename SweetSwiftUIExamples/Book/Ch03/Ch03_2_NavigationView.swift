//
//  Ch03_2_NavigationView.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch03_2_NavigationView: View {
  var body: some View {
    example01
  }
  
  // MARK: Example 01
  
  /// displayMode를 통해 타이틀의 출력 방식을 설정할 수 있습니다.
  var example01: some View {
    NavigationView {
      Image("SwiftUI")
        .navigationBarTitle("내비게이션 바 타이틀")
//        .navigationBarTitle("내비게이션 바 타이틀", displayMode: .automatic)
//        .navigationBarTitle("내비게이션 바 타이틀", displayMode: .large)
//        .navigationBarTitle("내비게이션 바 타이틀", displayMode: .inline)
    }
  }
  
  // MARK: Example 02
   
  /// navigationBarItems 수식어를 이용해 아이템을 추가합니다.
  /// 단, leading에 들어가는 아이템은 기본 뒤로 가기 버튼을 대체하게 되므로 주의해야 합니다.
  var example02: some View {
    let leadingItem = Button(action: { print("Leading") }) {
      Image(systemName: "bell")
        .imageScale(.large)
    }
    let trailingItem = Button(action: { print("Trailing") }) {
      Image(systemName: "gear")
        .imageScale(.large)
    }
    return NavigationView {
      Image("SwiftUI")
        .navigationBarItems(leading: leadingItem, trailing: trailingItem)
        .navigationBarTitle("내비게이션 바 아이템")
    }
  }
  
  // MARK: Example 03
  
  /// 뒤로 가기 기능 구현 예시.
  /// Environment에 대해서는 이후 챕터에서 다루게 됩니다.
  struct Example03: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
      let leadingItem = Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }) {
        HStack {
          Image(systemName: "arrow.left")
            .imageScale(.large)
          Text("Back")
        }
      }
      return NavigationView {
        Image("SwiftUI")
          .navigationBarItems(leading: leadingItem)
          .navigationBarTitle("내비게이션 바 아이템")
      }
    }
  }
  
  // MARK: Example 04
  
  /// HStack을 이용해 여러 개의 아이템을 만들어 전달할 수 있습니다.
  var example04: some View {
    let trailingItem = HStack {
      Button(action: { print("Button 1") }) {
        Image(systemName: "bell")
      }
      Button(action: { print("Button 2") }) {
        Image(systemName: "square.and.arrow.up")
      }
      Button(action: { print("Button 3") }) {
        Image(systemName: "gear")
      }
    }.imageScale(.large)
    
    return NavigationView {
      Image("SwiftUI")
        .navigationBarItems(trailing: trailingItem)
        .navigationBarTitle("내비게이션 바 아이템")
    }
  }
  
  // MARK: Example 05
  
  /// 내비게이션 링크에서 이미지의 렌더링 모드를 변경하는 방법은
  /// 직접 이미지에서 renderingMode 수식어를 사용하거나 PlainButtonStyle을 적용하는 방법이 있습니다.
  var example05: some View {
    NavigationView {
      NavigationLink(destination: Text("Destination View")) {
        Image("SwiftUI")
//          .renderingMode(.original)  // 1)
      }
//        .buttonStyle(PlainButtonStyle())  // 2)
        .navigationBarTitle("내비게이션 링크")
    }
  }
  
  // MARK: Example 06
  
  /// navigationBarHidden을 이용해 내비게이션 바를 숨길 수 있습니다.
  var example06: some View {
    NavigationView {
      Image("SwiftUI")
        .navigationBarTitle("내비게이션 바 히든")
        .navigationBarHidden(true)
    }
  }
  
  // MARK: Example 07
  
  /// navigationBarBackButtonHidden을 이용해 뒤로 가기 버튼을 숨길 수 있습니다.
  var example07: some View {
    let destination = Text("Destination View")
      .navigationBarBackButtonHidden(true)
    return NavigationView {
      NavigationLink(destination: destination) {
        Image("SwiftUI").renderingMode(.original)
      }
      .navigationBarTitle("내비게이션 바 백버튼 히든")
    }
  }
  
  // MARK: Example 08
  
  /// iOS에서는 내비게이션 뷰 스타일로 Default, Stack, DoubleColumn 3가지가 제공됩니다.
  /// Stack은 UINavigationController
  /// DoubleColumn은 UISplitViewController로 동작합니다.
  var example08: some View {
    NavigationView {
      VStack(spacing: 20) {
        NavigationLink(destination: Text("디테일 뷰 영역1").font(.largeTitle)) {
          Text("마스터 뷰 메뉴1").font(.title)
        }
        NavigationLink(destination: Text("디테일 뷰 영역2").font(.largeTitle)) {
          Text("마스터 뷰 메뉴2").font(.title)
        }
      }
      .navigationBarTitle("내비게이션 뷰 스타일")
      
      Text("디테일 뷰").font(.largeTitle)
    }
//    .navigationViewStyle(DefaultNavigationViewStyle())
//    .navigationViewStyle(StackNavigationViewStyle())
//    .navigationViewStyle(DoubleColumnNavigationViewStyle())
  }
  

}


// MARK: - Previews

struct Ch03_2_NavigationView_Previews1: PreviewProvider {
  static var previews: some View {
    Ch03_2_NavigationView()
      .previewDisplayName("Sweet SwiftUI")
  }
}
