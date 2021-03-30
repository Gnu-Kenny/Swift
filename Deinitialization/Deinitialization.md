# 초기화 해지 (Deinitialization)

> 출처: https://jusung.gitbook.io/the-swift-language-guide/language-guide/15-deinitialization

<br>

- 디이니셜라이저는 초기자(Initializer)와 반대로 클래스 인스턴스가 소멸되기 직전에 호출됩니다.

- 초기자는 선언 키워드로 init를 사용하는데 디이니셜라이저는 선언을 위해 `deinit`키워드를 사용합니다.

- 디이니셜라이저는 **오직 클래스 타입** 에서만 사용 가능합니다.

<br>

## 초기화 해지의 동작 (How Deinitialization Works)

---

기본적인 선언 형태

```swift
deinit {
    // perform the deinitialization
}
```
