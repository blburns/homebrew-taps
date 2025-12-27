  class SimpleSmtpMailer < Formula
	desc "Simple SMTP Mailer"
	homepage "https://github.com/blburns/simple-smtp-mailer"
	url "https://github.com/blburns/simple-smtp-mailer/archive/refs/tags/v0.2.0.tar.gz"
	sha256 "38d4ac27b80bd6f3aa620221b06cb5cab6e04558a7d283648231a04cc7e94617"
	version "v0.2.0"
  
	# Dependencies
	depends_on "openssl@1.1" => :build   # Build dependency for OpenSSL
	depends_on "cmake" => :build
	depends_on "make" => :build
  
	# Version support - install older versions if needed
	def self.latest_version
	  "v0.2.0"
	end
  
	# Installation steps for other versions or handling more complex logic
	def post_install
	  if version == "v0.2.0"
		ohai "Simple SMTP Mailer version 0.2.0 has been installed!"
		# Perform any extra setup for this version
	  end
	end
  
	# Test the installation (optional but good practice)
	test do
	  # You can write a small test to check if your app is installed properly
	  system "#{bin}/simple-smtp-mailer", "--version"
	  assert_match "simple-smtp-mailer version 0.2.0", shell_output("#{bin}/simple-smtp-mailer --version")
	end
  end
  