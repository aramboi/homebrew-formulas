class BorkDev < Formula
  desc "Bash DSL for config management"
  homepage "https://github.com/mattly/bork"
  head "https://github.com/mattly/bork.git"

  bottle :unneeded

  conflicts_with "bork", :because => "differing versions of the same formula"

  def install
    prefix.install %w[bin docs lib test types]
  end

  test do
    expected_output = "checking: directory #{testpath}/foo\r" \
                      "missing: directory #{testpath}/foo \n" \
                      "verifying : directory #{testpath}/foo\n" \
                      "* success\n"
    assert_match expected_output, shell_output("#{bin}/bork do ok directory #{testpath}/foo", 1)
  end
end
