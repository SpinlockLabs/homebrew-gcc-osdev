require 'formula'

class I686ElfGcc < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz'
  mirror 'http://ftpmirror.gnu.org/gnu/gcc/gcc-8.2.0/gcc-8.2.0.tar.xz'
  sha256 '196c3c04ba2613f893283977e6011b2345d1cd1af9abeac58e916b1aab3e0080'

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'i686-elf-binutils'

  def install
    binutils = Formula.factory 'i686-elf-binutils'

    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i686-elf',
                             '--disable-werror',
                             "--prefix=#{prefix}",
                             "--enable-languages=c",
                             "--without-headers"
      system 'make all-gcc'
      system 'make install-gcc'
      FileUtils.ln_sf binutils.prefix/"i686-elf", prefix/"i686-elf"
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
    end
  end
end
