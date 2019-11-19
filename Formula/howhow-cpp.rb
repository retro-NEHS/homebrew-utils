# Copyright (C) 2019  Hsuan-Ting Lu <hsuan.ting.lu.ee05@g2.nctu.edu.tw>
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

class HowhowCpp < Formula
  HHC_VERSION = "1.0.0".freeze
  desc "HowHow classic quotes in cpp"
  homepage "https://hsuantinglu.github.io/howhow-cpp/"
  version "#{HHC_VERSION}"
  url "https://github.com/hsuantinglu/howhow-cpp/archive/v#{HHC_VERSION}.tar.gz"
  sha256 "842b4f2ccad893df84c84dfea8505bcc1c96a156a38f591942969d23f4d0c086"
  head "https://github.com/hsuantinglu/howhow-cpp.git", :branch => "develop"

  # bottle do
  #   root_url "https://github.com/HsuanTingLu/howhow-cpp/releases/download/v#{HHC_VERSION}"
  #   cellar :any
  #   sha256 "" => :catalina
  # end

  depends_on "cmake" => :build

  def install
    mkdir "_build" do
      args = std_cmake_args + %w[
        -DRELEASE=ON
      ]

      system "cmake", "..", *args, "-DBUILD_SHARED_LIBS=ON"
      system "make"
      system "make", "install"

      # TODO: build a static library too
    end
  end

  # def post_install
  # end

  test do
    ohai "Setting up howhow repository in " + testpath
    opoo "There's no test for this repo, for now."
  end
end
