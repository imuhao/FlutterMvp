import '../data/contact_data.dart';
import '../data/contact_data_impl.dart';
import '../data/contact_data_mock.dart';

enum Flavor { MOCK, PRO }

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void config(Flavor flavor) {
    _flavor = flavor;
  }
  //命名构造函数实现一个类可以有多个构造函数，或者提供更有正对性的构造函数：
  Injector._internal();
  
  //工厂构造函数,创建时先查看缓存中是否有类的实例,有返回,没有就创建
  factory Injector() {
    return _singleton;
  }
  ContactRepository get contactRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new MockContactRepository();
      case Flavor.PRO:
        return new RandomUserRepository();
      default:
        return new MockContactRepository();
    }
  }
}
