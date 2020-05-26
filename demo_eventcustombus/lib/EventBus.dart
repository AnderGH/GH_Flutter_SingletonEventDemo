
typedef void NotiCallback<T>(params);

class EventBus {
  // 静态变量
  static EventBus _instance;
  // 默认无名构造方法
  factory EventBus() {
    return EventBus.sharedInstance();
  }
  // 私有构造方法
  EventBus._init();
  // 单例对外提供的构造方法
  factory EventBus.sharedInstance() {
    if (_instance == null) {
      _instance = EventBus._init();
    }
    return _instance;
  }

  // 保存callback的参数
  Map<String, NotiCallback> _notiMap = Map();

  // 对外提供添加，删除，触发的方法
  // 添加
  void add<String, NotiCallback>(eventName, callback) {
    if (eventName == null) {
      return;
    }
    if (eventName.length == 0) {
      return;
    }
    _notiMap[eventName] = callback;
  }
  // 移除
  void remove<String, NotiCallback>(eventName, callback) {
    if (eventName == null) {
      return;
    }
    if (eventName.length == 0) {
      return;
    }
    _notiMap[eventName] = null;
  }
  // 触发
  void emit<String, T>(eventName, params) {
    if (eventName == null) {
      return;
    }
    if (eventName.length == 0) {
      return;
    }
    NotiCallback callback = _notiMap[eventName];
    callback(params);
  }
}
