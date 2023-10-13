class Jeviterm < Formula
  desc "C++ library to interact with iTerm2 using protobufs and WebSockets"
  homepage "https://github.com/jevinskie/jeviterm"
  license "MIT"
  url "https://github.com/jevinskie/jeviterm/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "595ade2b188b1d2dc3166252ce73399a159ee4bb05b849ff509d257bd89d8b10"
  head "https://github.com/jevinskie/jeviterm.git", :branch => "main"

  depends_on "cmake" => :build
  depends_on "boost" => :build
  depends_on "nlohmann-json" => :build
  depends_on "protobuf"

  def install
    system "cmake", "-S", ".", "-B", "build", "-DJEVITERM_HOMEBREW_DEPS=ON", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Usage: jevitermctl <tab 1 command str> <tab 2 command str> ...", shell_output("#{bin}/jevitermctl", result = 255)
  end
end
