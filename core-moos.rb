require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class CoreMoos < Formula
  homepage ''
  url 'https://github.com/themoos/core-moos/archive/devel.zip'
  #sha1 'a077343435f6b0f2cfa22d23066dcb8c7571d852'
  version '10.0.1'
  depends_on 'cmake' => :build

  option 'use-async-comms', 'build with v10 asynchronous comms'

  def install

      cmake_args = %W[
      -DCMAKE_BUILD_TYPE=Release
      -DENABLE_V10_COMPATIBILITY
      ]

      cmake_args << "-DUSE_AYSNC_COMMS" if build.include? 'use-async-comms'

    system "cmake", ".", cmake_args
    system "make"
    system "make install"
  end

end
