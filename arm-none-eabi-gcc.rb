require 'formula'

class ArmNoneEabiGcc < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftpmirror.gnu.org/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz'
  mirror 'http://ftp.gnu.org/gnu/gcc/gcc-7.2.0/gcc-7.2.0.tar.xz'
  sha256 '1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a'

  depends_on 'gmp'
  depends_on 'libmpc'
  depends_on 'mpfr'
  depends_on 'isl'
  depends_on 'arm-none-eabi-binutils'

  def install
    binutils = Formula.factory 'arm-none-eabi-binutils'

    ENV['PATH'] += ":#{binutils.prefix/"bin"}"

    mkdir 'build' do
      system '../configure', 
                             "--prefix=#{prefix}",
                             '--target=arm-none-eabi',
                             "--enable-languages=c",
                             '--enable-plugins',
                             '--disable-decimal-float',
                             '--disable-libffi',
                             '--disable-libgomp',
                             '--disable-libmudflap',
                             '--disable-libquadmath',
                             '--disable-libssp',
                             '--disable-libstdcxx-pch',
                             '--disable-nls',
                             '--disable-shared',
                             '--disable-threads',
                             '--disable-werror',
                             '--disable-tls',
                             '--with-gnu-as',
                             '--with-gnu-ld',
                             '--with-system-zlib',
                             '--with-gmp',
                             '--with-mpfr',
                             '--with-mpc',
                             '--with-isl',
                             '--with-libelf',
                             '--enable-gnu-indirect-function',
                             "--without-headers"

      system 'make all-gcc'
      system 'make install-gcc'
      FileUtils.ln_sf binutils.prefix/"arm-none-eabi", prefix/"arm-none-eabi"
      system 'make all-target-libgcc'
      system 'make install-target-libgcc'
      FileUtils.rm_rf share/"man"/"man7"
      FileUtils.rm_rf share/"info"
    end
  end
end
