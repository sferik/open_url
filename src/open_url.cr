module OpenURL
  VERSION = "0.1.0"
  LINUX_CHECK = `which xdg-open`.strip
  MACOS_CHECK = `which open`.strip
  WINDOWS_CHECK = `which cmd`.strip

  def self.open(url : String)
    case
    when LINUX_CHECK.presence
      `xdg-open #{url}`
    when MACOS_CHECK.presence
      `open #{url}`
    when WINDOWS_CHECK.presence
      `cmd /c start #{url}`
    else
      raise "Platform not supported or required software not installed"
    end
  end
end
