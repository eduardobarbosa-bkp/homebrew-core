class Kbf < Formula
  desc "Kubernetes yml port forwarding"
  homepage "https://github.com/eduardobarbosa/kbf"
  url "https://github.com/eduardobarbosa/kbf/archive/v0.0.3.tar.gz"
  sha256 "5edbea304a1d22b24d82b23b773995088bab6a5db6369ecff010283d23e956ec"

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
