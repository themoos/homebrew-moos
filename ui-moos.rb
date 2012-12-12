require 'formula'

class UiMoos < Formula
    homepage 'www.robots.ox.ac.uk/~pnewman/TheMOOS'
    url 'https://github.com/themoos/ui-moos/archive/devel.zip'
    head 'https://github.com/themoos/ui-moos.git', :branch => 'devel'
    
    #sha1 'a077343435f6b0f2cfa22d23066dcb8c7571d852'
    version '10.0.1'
    depends_on 'cmake' => :build
    depends_on 'core-moos'
    depends_on 'fltk'
    
    
    
    def install
        cmake_args = std_cmake_parameters.split
        cmake_args << "-DBUILD_GRAPHICAL_TOOLS:BOOL=ON"
        cmake_args << "-DBUILD_UMS:BOOL=ON"
        cmake_args << "-DBUILD_UPB:BOOL=ON"
        cmake_args << "-DBUILD_UPBINDEXED:BOOL=ON"
        
        system "cmake", ".", *cmake_args
        system "make"
        system "make install"
        
    end
    
end
