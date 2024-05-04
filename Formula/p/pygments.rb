class Pygments < Formula
  include Language::Python::Virtualenv

  desc "Generic syntax highlighter"
  homepage "https://pygments.org/"
  url "https://files.pythonhosted.org/packages/8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31/pygments-2.18.0.tar.gz"
  sha256 "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199"
  license "BSD-2-Clause"
  head "https://github.com/pygments/pygments.git", branch: "master"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "5ec566a0766ff9fa0193ba3d47c2754ab9db5eb6e983ddb2ee7260bea9994e3e"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "5ec566a0766ff9fa0193ba3d47c2754ab9db5eb6e983ddb2ee7260bea9994e3e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5ec566a0766ff9fa0193ba3d47c2754ab9db5eb6e983ddb2ee7260bea9994e3e"
    sha256 cellar: :any_skip_relocation, sonoma:         "5ec566a0766ff9fa0193ba3d47c2754ab9db5eb6e983ddb2ee7260bea9994e3e"
    sha256 cellar: :any_skip_relocation, ventura:        "5ec566a0766ff9fa0193ba3d47c2754ab9db5eb6e983ddb2ee7260bea9994e3e"
    sha256 cellar: :any_skip_relocation, monterey:       "5ec566a0766ff9fa0193ba3d47c2754ab9db5eb6e983ddb2ee7260bea9994e3e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "124dabbe0e2c0f66273bb7293be63bb6c16cd2161b36cad45fb12b8bc796482f"
  end

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
    bash_completion.install "external/pygments.bashcomp" => "pygmentize"
  end

  test do
    (testpath/"test.py").write <<~EOS
      import os
      print(os.getcwd())
    EOS

    system bin/"pygmentize", "-f", "html", "-o", "test.html", testpath/"test.py"
    assert_predicate testpath/"test.html", :exist?
  end
end
