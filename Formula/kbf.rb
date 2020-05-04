class Kbf < Formula
  desc "Kubernetes yml port forwarding"
  homepage "https://github.com/eduardobarbosa/kbf"
  url "https://github.com/eduardobarbosa/kbf/archive/v0.0.4.tar.gz"
  sha256 "2c2bbc1ca121384ee747abd4702371ed9a00b63b00b14906b7cb1f099a469f36"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    bin_path = buildpath/"src/github.com/eduardobarbosa/kbf"
    bin_path.install Dir["*"]
    cd bin_path do
      # Install the compiled binary into Homebrew's `bin` - a pre-existing
      # global variable
      system "go", "build", "-o", bin/"kbf", "."
    end
  end

  test do
    system "#{bin}/kbf", "--help"
  end
end
