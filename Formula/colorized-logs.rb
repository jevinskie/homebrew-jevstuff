class ColorizedLogs < Formula
  desc "Tools for logs with ANSI color"
  homepage "https://github.com/kilobyte/colorized-logs"
  license "MIT"
  url "https://github.com/kilobyte/colorized-logs/archive/refs/tags/v2.6.tar.gz"
  sha256 "d209d9fb45f5332ba4792624746f2bbbbcf425e6539fa69657e9602e2bee6570"
  head "https://github.com/kilobyte/colorized-logs.git"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"colorized-log.txt").write("\x1b[1mWaiting for spawn to appear...\x1b[0m No Color Here")
    assert_match "Waiting for spawn to appear... No Color Here", shell_output("#{bin}/ansi2txt < #{testpath/"colorized-log.txt"}")
  end
end
