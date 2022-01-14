class Jeviterm < Formula
  desc "C++ library to interact with iTerm2 using protobufs and WebSockets"
  homepage "https://github.com/jevinskie/jeviterm"
  license "MIT"
  head "https://github.com/jevinskie/jeviterm.git", :branch => "main"

  depends_on "cmake" => :build
  depends_on "protobuf"

  def install
    ENV.deparallelize
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test jeviterm`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
