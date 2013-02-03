module FFI
  module Stat
    module Library
      extend FFI::Library
      ffi_lib FFI::Library::LIBC

      attach_function :stat,  [ :string, :pointer ], :int
      attach_function :lstat, [ :string, :pointer ], :int
      attach_function :fstat, [ :int, :pointer    ], :int
    end
  end
end