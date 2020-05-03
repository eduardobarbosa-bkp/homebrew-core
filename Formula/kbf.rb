class Kbf < Formula
  desc "Kubernetes yml port forwarding"
  homepage "https://github.com/eduardobarbosa/kbf"
  url "https://github.com/eduardobarbosa/kbf/archive/v0.0.1.tar.gz"
  sha256 "0d0ffc79e6a457e7f8e52f847a0db8b1f55198b3cce9b4f7117769c176b29214"

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
