require 'formula'

class EssentialMoos < Formula
  homepage 'www.robots.ox.ac.uk/~pnewman/TheMOOS'
    #url 'https://github.com/themoos/essential-moos/archive/devel.zip'
  head 'https://github.com/themoos/essential-moos.git', :branch => 'devel'
    
  #sha1 'a077343435f6b0f2cfa22d23066dcb8c7571d852'
  version '10.0.1'
  depends_on 'cmake' => :build
  depends_on 'core-moos'
    

  def install
      cmake_args = std_cmake_parameters.split
      system "cmake", ".", *cmake_args
      system "make"
      system "make install"
      
  end

end
