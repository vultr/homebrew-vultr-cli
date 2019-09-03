class VultrCli < Formula
    desc "Official command-line tool for Vultr services"
    homepage "https://github.com/vultr/vultr-cli"
    url "https://github.com/vultr/vultr-cli/archive/v0.1.5.tar.gz"
    sha256 "857a3d3412e10f163d51dada8d5f7bfa230cbf644f5d8a890ee32a17fc95d77d"
    head "https://github.com/vultr/vultr-cli.git"
  
    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
      ENV["GO111MODULE"] = "on"
      dir = buildpath/"src/github.com/vultr/vultr-cli"
      dir.install buildpath.children
  
      cd dir do
        system "go", "build", "-o", bin/"vultr-cli", "-ldflags", "-X main.Version=v#{version}"
        prefix.install_metafiles
      end
    end
  
    test do
      output = shell_output("#{bin}/vultr-cli version 2>&1", 1)
      assert_match "Please export your VULTR API key as an environment variable, eg:\nexport VULTR_API_KEY='<api_key_from_vultr_account>'\n", output
    end
  end
  