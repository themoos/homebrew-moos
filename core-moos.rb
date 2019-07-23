require 'formula'

class CoreMoos < Formula
    homepage 'www.robots.ox.ac.uk/~pnewman/TheMOOS'
    url 'https://github.com/themoos/core-moos/archive/devel.zip'
    
    #sha1 'a077343435f6b0f2cfa22d23066dcb8c7571d852'
    head 'https://github.com/themoos/core-moos.git', :branch => 'devel'
    
    version '10.0.1'
    
    depends_on 'cmake' => :build
    
    
    def install
        cmake_args = std_cmake_args.split
        
        cmake_args << "-DUSE_AYSNC_COMMS:BOOL=ON"
        
        cmake_args << "-DENABLE_V10_COMPATIBILITY:BOOL=ON"
        
        system "cmake", ".", *cmake_args
        system "make"
        system "make install"
        
    end
    
    def test
        system "#{bin}/MOOSDB --help"
    end
    
    
end
