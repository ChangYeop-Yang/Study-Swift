# Study-Swift

## ★ Outline
Swift는 Apple이 iOS, Mac, Apple TV 그리고 Apple Watch 앱 개발용으로 만든 강력하고 직관적인 프로그래밍 언어입니다. 개발자들에게 어느 때보다 큰 자유를 선사하기 위해 설계되었죠. Swift는 사용이 간편한 오픈 소스 언어라서, 번뜩이는 아이디어만 있다면 누구나 놀라운 결과물을 만들어낼 수 있답니다.

## ★ First-Class object - 일급 객체
스위프트는 객체지향 언어이자 동시에 함수형 언어이다. 함수형 언어를 학습하게 되면 반드시 일극 객체라는 용어를 접하게 된다. 컴퓨터 프로그래밍 언어 디자인에서, 특정 언어의 일급 객체 (first-class citizens, 일급 값, 일급 엔티티, 혹은 일급 시민)이라 함은 일반적으로 다른 객체들에 적용 가능한 연산을 모두 지원하는 객체를 가리킨다. 함수에 매개변수로 넘기기, 변수에 대입하기와 같은 연산들이 여기서 말하는 일반적인 연산의 예에 해당한다. 일급/이급 객체의 개념은 영국의 컴퓨터 과학자 크리스토퍼 스트레이치에 의해 1960년대에 처음 소개되었다. 그는 명시적으로 일급 객체의 개념을 정의하지는 않았으나, Algol 프로그래밍 언어의 실수(Real number)와 프로시저를 비교함으로써 일급 객체의 개념에 대해 처음으로 언급하였다.

#### ⌘ First-Class object Feature
* 객체가 런타임에도 생성이 가능해야 한다.
* 인자값으로 객체를 전달할 수 있어야 한다. (함수의 인자값으로 함수를 사용할 수 있다.)
* 반환값으로 객체를 사용할 수 있어야 한다. (함수의 반환 타입으로 함수를 사용할 수 있다.)
* 변수나 데이터 구조 안에 저장할 수 있어야 한다. (변수나 상수에 함수를 대입할 수 있다.)
* 할당에 사용된 이름과 관계없이 고유한 구별이 가능해야 한다.

**즉, 함수형 언어에서는 함수가 일급 객체로 대우받는다.**

## ★ Difference Struct vs Class
**⌘ 구조체의 값 전달 방식: 복사에 의한 전달**

  구조체는 인스턴스를 생성한 후 이를 변수나 상수에 할당하거나 함수의 인자값으로 전달할 때 값을 복사하여 전달하는 방식을 사용한다. 이를 값 타입(Value Type) or 복사에 의한 전달이라고 한다. 스위프트에서 모든 구조체를 값 타입이다. 열거형(Enum) 역시 값 타입이다. 또한 구조체 인스턴스를 변수에 대입하면 기존의 인스턴스가 그대로 대입되는 것이 아니라 이를 복사한 새로운 값이 대입된다.
  
  * 구조체는 값의 할당이 곧 복사이므로 하나의 인스턴스는 오로지 하나의 변수와 상수만이 참조할 수 있다.
    
* * *
    
**⌘ 클래스의 값 전달 방식: 참조에 의한 방식**

  클래스는 메모리 주소 참조에 의한 전달 방식을 사용한다. 이를 참조 타입 (Reference Type)이라한다. 참조 타입은 변수나 상수에 할당될 때, 또는 함수의 인자값으로 전달될 때 값의 복사가 이루어지지 않는다. 대신, 현재 존재하는 인스턴스에 대한 참조가 전달된다. 참조란, 인스턴스가 저장된 메모리 주소 정보가 전달된다는 뜻이다.
  
  * 클래스는 참조 타입으로서 한 곳에서 수정할 경우 다른 곳에도 적용되는 특징이 있다.
  * 하나의 클래스 인스턴스를 여러 변수나 상수, 또는 함수의 인자값에서 동시에 참조할 수 있다는 특징이 있다.
  * 클래스 인스턴스는 여러곳에서 동시 참조가 가능하므로 한 곳에서의 참조가 완료되었다고 해도 마음대로 메모리 해제를 할 수 없는 특징이 있다. 다른 곳에서 해당 인스턴스를 계속 참조하고 있기 때문이다. 이를 방치할 경우 잘못된 메모리 참조 오류가 발생한다.

## ★ Property - 프로퍼티
* 프로퍼티는 클래스나 구조체에 값을 제공하며 저장 프로퍼티와 연산 프로퍼티가 존재한다.

* Properties associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

  Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.

  In addition, you can define property observers to monitor changes in a property’s value, which you can respond to with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.

**⌘ Stored Properties - 저장 프로퍼티**
* 입력된 값을 저장하거나 저장된 값을 제공하는 역할을 제공한다.
* 상수 및 변수를 사용해서 정의 기능을 제공한다.
* 클래스와 구조체에서는 사용이 가능하지만, 열거형에서는 사용할 수 없다.

**⌘ Computed Properties - 연산 프로퍼티**
* 특정 연산을 통해 값을 만들어 제공하는 역할을 제공한다.
* 변수만 사용해서 정의 기능을 제공한다.
* 클래스, 구조체, 열거형 모두에서 사용 가능하다.

## ★ ARC (Auto Reference Counting)
* iOS는 레퍼런스 카운팅을 통해 레퍼런스가 더 이상 사용되지 않는 시점을 결정하여 레퍼런스가 할당받아 사용하던 메모리를 해제할 수 있도록 만듭니다. 개념적으로 간단한 것으로 프로퍼티, 상수, 변수에 레퍼런스가 지정되면 때 여기에 들어있는 카운트를 증가시키고 프로퍼티, 상수, 변수가 해제되면 카운트를 감소시킵니다. 보유한 카운트가 0이 되면 메모리를 해제시킵니다.

* 인스턴스를 모니터링하면서 변수나 상수, 함수의 인자값으로 할당되면 카운트를 1증가시키고 해당 변수나 상수들이 종료되면 카운트를 1 감소시키는 작업을 계속하면서 인스턴스의 참조 수를 계산한다. 이 과정에서 인스턴스의 참조 카운트가 0이 되면 메모리 해제 대상으로 간주하여 적절히 메모리에서 해제한다.

## ★ Reference
* [스위프트 ARC와 순환참조와 클로저 - Out of Bedlam](https://outofbedlam.github.io/swift/2016/01/31/Swift-ARC-Closure-weakself/)
* [꼼꼼한 재은 씨의 Swift 문법편 - Naver Book](https://book.naver.com/bookdb/book_detail.nhn?bid=12864380)
* [일급 객체 - 위키백과](https://ko.wikipedia.org/wiki/%EC%9D%BC%EA%B8%89_%EA%B0%9D%EC%B2%B4)
