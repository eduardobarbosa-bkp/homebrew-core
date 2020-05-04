class Kbf < Formula
  desc "Kubernetes yml port forwarding"
  homepage "https://github.com/eduardobarbosa/kbf"
  url "https://github.com/eduardobarbosa/kbf/archive/v0.0.2.tar.gz"
  sha256 "dbda91546485a6ebee5176b227a49e89007d890a8623772dbecc02789a1cdd95"

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
