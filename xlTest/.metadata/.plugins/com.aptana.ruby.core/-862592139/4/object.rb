class Object < BasicObject
  include Kernel

  ARGF = ARGF
  ARGV = []
  ArgumentError = ArgumentError
  Array = Array
  BasicObject = BasicObject
  Bignum = Bignum
  Binding = Binding
  CROSS_COMPILING = nil
  Class = Class
  Comparable = Comparable
  Complex = Complex
  Config = RbConfig
  Data = Data
  Date = Date
  DateTime = DateTime
  Dir = Dir
  ENV = {"XDG_SESSION_PATH"=>"/org/freedesktop/DisplayManager/Session1", "GNOME_KEYRING_CONTROL"=>"/tmp/keyring-is6FN7", "SHLVL"=>"1", "SSH_AGENT_PID"=>"4893", "_system_arch"=>"x86_64", "rvm_version"=>"1.25.22 (master)", "_system_name"=>"Ubuntu", "SESSION_MANAGER"=>"local/abdullah.hafiz:@/tmp/.ICE-unix/4858,unix/abdullah.hafiz:/tmp/.ICE-unix/4858", "GNOME_DESKTOP_SESSION_ID"=>"this-is-deprecated", "GDMSESSION"=>"ubuntu", "XDG_SESSION_COOKIE"=>"3e2a35a32df497ad0ee3f32d00000007-1397363849.849061-937472667", "COMPIZ_CONFIG_PROFILE"=>"ubuntu", "XDG_DATA_DIRS"=>"/usr/share/ubuntu:/usr/share/gnome:/usr/local/share/:/usr/share/", "MANDATORY_PATH"=>"/usr/share/gconf/ubuntu.mandatory.path", "PWD"=>"/home/abdullah.hafiz/Aptana_Studio_3", "rvm_prefix"=>"/usr/local", "LOGNAME"=>"abdullah.hafiz", "GPG_AGENT_INFO"=>"/tmp/keyring-is6FN7/gpg:0:1", "SSH_AUTH_SOCK"=>"/tmp/keyring-is6FN7/ssh", "LD_LIBRARY_PATH"=>"/usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64/server:/usr/lib/jvm/java-6-openjdk-amd64/jre/lib/amd64:/usr/lib/jvm/java-6-openjdk-amd64/jre/../lib/amd64", "DBUS_SESSION_BUS_ADDRESS"=>"unix:abstract=/tmp/dbus-6zMvCjL5Wq,guid=7a29bb1924d28d1afe2630de00001c5b", "SHELL"=>"/bin/bash", "rvm_bin_path"=>"/usr/local/rvm/bin", "GNOME_KEYRING_PID"=>"4847", "_system_type"=>"Linux", "XDG_CURRENT_DESKTOP"=>"Unity", "XDG_CONFIG_DIRS"=>"/etc/xdg/xdg-ubuntu:/etc/xdg", "PATH"=>"/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/rvm/bin", "DESKTOP_SESSION"=>"ubuntu", "APTANA_VERSION"=>"3.4.2.1368863613", "DISPLAY"=>":0.0", "UBUNTU_MENUPROXY"=>"libappmenu.so", "USER"=>"abdullah.hafiz", "HOME"=>"/home/abdullah.hafiz", "rvm_path"=>"/usr/local/rvm", "_system_version"=>"12.04", "XAUTHORITY"=>"/home/abdullah.hafiz/.Xauthority", "rvm_delete_flag"=>"0", "rvm_ruby_string"=>"system", "DEFAULTS_PATH"=>"/usr/share/gconf/ubuntu.default.path", "XDG_SEAT_PATH"=>"/org/freedesktop/DisplayManager/Seat0", "LANG"=>"en_US.UTF-8"}
  EOFError = EOFError
  Encoding = Encoding
  EncodingError = EncodingError
  Enumerable = Enumerable
  Enumerator = Enumerator
  Errno = Errno
  Etc = Etc
  Exception = Exception
  FALSE = false
  FalseClass = FalseClass
  Fiber = Fiber
  FiberError = FiberError
  File = File
  FileTest = FileTest
  FileUtils = FileUtils
  Fixnum = Fixnum
  Float = Float
  FloatDomainError = FloatDomainError
  GC = GC
  Gem = Gem
  Hash = Hash
  IO = IO
  IOError = IOError
  IndexError = IndexError
  Integer = Integer
  Interrupt = Interrupt
  Kernel = Kernel
  KeyError = KeyError
  LoadError = LoadError
  LocalJumpError = LocalJumpError
  Marshal = Marshal
  MatchData = MatchData
  Math = Math
  Method = Method
  Module = Module
  Mutex = Mutex
  NIL = nil
  NameError = NameError
  NilClass = NilClass
  NoMemoryError = NoMemoryError
  NoMethodError = NoMethodError
  NotImplementedError = NotImplementedError
  Numeric = Numeric
  OUTPUT_PATH = "/home/abdullah.hafiz/xlTest/.metadata/.plugins/com.aptana.ruby.core/-862592139/4/"
  Object = Object
  ObjectSpace = ObjectSpace
  Proc = Proc
  Process = Process
  Psych = Psych
  RUBY_COPYRIGHT = "ruby - Copyright (C) 1993-2011 Yukihiro Matsumoto"
  RUBY_DESCRIPTION = "ruby 1.9.3p0 (2011-10-30 revision 33570) [x86_64-linux]"
  RUBY_ENGINE = "ruby"
  RUBY_PATCHLEVEL = 0
  RUBY_PLATFORM = "x86_64-linux"
  RUBY_RELEASE_DATE = "2011-10-30"
  RUBY_REVISION = 33570
  RUBY_VERSION = "1.9.3"
  Random = Random
  Range = Range
  RangeError = RangeError
  Rational = Rational
  RbConfig = RbConfig
  Regexp = Regexp
  RegexpError = RegexpError
  RubyVM = RubyVM
  RuntimeError = RuntimeError
  STDERR = IO.new
  STDIN = IO.new
  STDOUT = IO.new
  ScanError = StringScanner::Error
  ScriptError = ScriptError
  SecurityError = SecurityError
  Signal = Signal
  SignalException = SignalException
  StandardError = StandardError
  StopIteration = StopIteration
  String = String
  StringIO = StringIO
  StringScanner = StringScanner
  Struct = Struct
  Syck = Syck
  Symbol = Symbol
  SyntaxError = SyntaxError
  SystemCallError = SystemCallError
  SystemExit = SystemExit
  SystemStackError = SystemStackError
  TOPLEVEL_BINDING = #<Binding:0x000000021110c8>
  TRUE = true
  TSort = TSort
  Thread = Thread
  ThreadError = ThreadError
  ThreadGroup = ThreadGroup
  Time = Time
  TrueClass = TrueClass
  TypeError = TypeError
  URI = URI
  UnboundMethod = UnboundMethod
  YAML = Psych
  ZeroDivisionError = ZeroDivisionError
  Zlib = Zlib

  def self.yaml_tag(arg0)
  end


  def psych_to_yaml(arg0, arg1, *rest)
  end

  def to_yaml(arg0, arg1, *rest)
  end

  def to_yaml_properties
  end


  protected


  private

  def dir_names(arg0)
  end

  def file_name(arg0)
  end

  def get_classes
  end

  def grab_instance_method(arg0, arg1)
  end

  def print_args(arg0)
  end

  def print_instance_method(arg0, arg1)
  end

  def print_method(arg0, arg1, arg2, arg3, arg4, *rest)
  end

  def print_type(arg0)
  end

  def print_value(arg0)
  end

end
