//
//  Ch03_3_List.swift
//  SweetSwiftUIExamples
//
//  Created by Giftbot on 2020/03/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Ch03_3_List: View {
  var body: some View {
    example01
  }
  
  // MARK: Example 01
  
  /// List를 이용한 뷰 표현. 여기서 뷰 하나는 로우 하나에 해당합니다.
  var example01: some View {
    List {
      Text("1")
      Text("2")
      Text("3")
      Text("4")
      Text("5")
      Text("6")
      Text("7")
      Text("8")
      Text("9")
      Text("10")
    }
  }
  
  // MARK: Example 02
  
  /// 여러 가지 타입의 정적 콘텐츠 사용 예제
  var example02: some View {
    List {
      Text("List").font(.largeTitle)
      Image("SwiftUI")
      Circle().frame(width: 100, height: 100)
      Color(.red).frame(width: 100, height: 100)
    }
  }
  
  // MARK: Example 03
  
  /// Range<Int> 타입을 이용한 동적 콘텐츠 표현
  var example03: some View {
    List(0..<100) {
      Text("\($0)")
    }
  }
  
  // MARK: Example 04
  
  /// RandomAccessCollection 프로토콜을 이용한 동적 콘텐츠 표현
  /// id 매개 변수에는 Hashable 프로토콜을 준수하는 타입의 값을 지정해 줄 수 있습니다.
  struct User: Hashable {
    let name: String
  }
  var example04: some View {
    let numbers = [1, 2, 3, 4, 5]
//    let alphabets = ["A", "B", "C", "D", "E"]
//    let users = [User(name: "James"), User(name: "Steve"), User(name: "Edward")]
    return List(numbers, id: \.self) {
      Text("\(String(describing: $0))")
    }
  }
  
  // MARK: Example 05
  
  /// Identifiable 프로토콜을 준수하는 타입을 나열할 때는 id 매개 변수를 생략 가능합니다.
  struct Animal: Identifiable {
    let id = UUID()
    let name: String
  }
  var example05: some View {
    List([Animal(name: "Tory"), Animal(name: "Lilly")]) {
      Text("\(String(describing: $0))")
    }
  }
  
  // MARK: Example 06
  
  /// ForEach를 이용해 정적 콘텐츠와 동적 콘텐츠를 혼합할 수 있습니다.
  let fruits = ["사과", "배", "포도", "바나나"]
  let drinks = ["물", "우유", "탄산수"]
  var example06: some View {
    List {
      Text("Fruits").font(.largeTitle)
      ForEach(fruits, id: \.self) {
        Text($0)
      }
      
      Text("Drinks").font(.largeTitle)
      ForEach(drinks, id: \.self) {
        Text($0)
      }
    }
  }
  
  // MARK: Example 07
  
  /// Section을 이용해 관련 있는 데이터들을 묶어서 표현할 수 있습니다.
  var example07: some View {
    let titles = ["Fruits", "Drinks"]
    let data = [fruits, drinks]
    return List {
      ForEach(data.indices) { index in
        Section(
          header: Text(titles[index]).font(.title),
          footer: HStack { Spacer(); Text("\(data[index].count)건") }
        ) {
          ForEach(data[index], id: \.self) {
            Text($0)
          }
        }
      }
    }
  }
  
  // MARK: Example 08
  
  /// iOS에서는 리스트에 Default, Plain, Grouped 3가지 스타일을 제공합니다.
  var example08: some View {
    let titles = ["Fruits", "Drinks"]
    let data = [fruits, drinks]
    return
      List {
        ForEach(0..<data.count) { index in
          Section(
            header: Text(titles[index]).font(.title),
            footer: HStack { Spacer(); Text("\(data[index].count)건") }
          ) {
            ForEach(data[index], id: \.self) {
              Text($0)
            }
          }
        }
      }
      .listStyle(GroupedListStyle())
  }
  
  // MARK: Example 09
  
  /// GroupedListStyle일 때 사이즈 클래스가 Regular width이면
  /// insetGrouped 스타일이 적용됩니다.
  var example09: some View {
    example08
      .environment(\.horizontalSizeClass, .regular)
  }
}


// MARK: - Previews

struct Ch03_3_List_Previews1: PreviewProvider {
  static var previews: some View {
    Ch03_3_List()
      .previewDisplayName("Sweet SwiftUI")
  }
}
