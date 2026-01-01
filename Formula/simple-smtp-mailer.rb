class SimpleSmtpMailer < Formula
  desc "High-performance SMTP mailer with queue management and OAuth2 support"
  homepage "https://github.com/blburns/simple-smtp-mailer"
  url "https://github.com/blburns/simple-smtp-mailer/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "38d4ac27b80bd6f3aa620221b06cb5cab6e04558a7d283648231a04cc7e94617"
  license "Apache-2.0"
  head "https://github.com/blburns/simple-smtp-mailer.git", branch: "main"

  # Dependencies
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@3"
  depends_on "jsoncpp"
  depends_on "curl"
  depends_on "yaml-cpp"
  depends_on "python@3.9"

  # Optional test dependency
  depends_on "googletest" => [:build, :test]

  def install
    # Create build directory
    mkdir "build" do
      # Configure CMake with proper paths
      args = %W[
        -DCMAKE_BUILD_TYPE=Release
        -DENABLE_TESTS=OFF
        -DENABLE_PACKAGING=OFF
        -DENABLE_SSL=ON
        -DENABLE_JSON=ON
        -DENABLE_CURL=ON
        -DOPENSSL_ROOT_DIR=#{Formula["openssl@3"].opt_prefix}
      ]
      args += std_cmake_args

      system "cmake", "..", *args

      # Build
      system "cmake", "--build", "."
      
      # Install
      system "cmake", "--install", "."
    end

    # Install Python dependencies for OAuth2 helper tools
    python3 = Formula["python@3.9"].opt_bin/"python3"
    system python3, "-m", "pip", "install", "--prefix", prefix, "requests"
  end

  test do
    # Test that the binary exists and shows version
    assert_match "simple-smtp-mailer", shell_output("#{bin}/simple-smtp-mailer --version")
  end
end
