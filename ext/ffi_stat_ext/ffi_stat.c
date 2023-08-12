#include <extconf.h>
#include <sys/stat.h>
#include <ruby/ruby.h>

#if SIZEOF_LONG == SIZEOF_VOIDP
#define PTR2NUM(x) (LONG2NUM((long)(x)))
#else
#define PTR2NUM(x) (LL2NUM((LONG_LONG)(x)))
#endif

VALUE mFFI, cFFIPointer, mFFIStat, cFFIStatError;

VALUE stat_memsize() {
  return INT2NUM(sizeof(struct stat));
}

VALUE stat_pointer(VALUE stat) {
  VALUE argv[2];
  argv[0] = rb_intern("pointer");
  argv[1] = PTR2NUM(DATA_PTR(stat));

  return rb_class_new_instance(2, argv, cFFIPointer);
}

void Init_ffi_stat_ext() {
  mFFI = rb_const_get(rb_cObject, rb_intern("FFI"));
  cFFIPointer = rb_const_get(mFFI, rb_intern("Pointer"));
  mFFIStat = rb_define_module_under(mFFI, "Stat");
  rb_define_singleton_method(mFFIStat, "pointer", stat_pointer, 1);;
  cFFIStatError = rb_define_class_under(mFFIStat, "Error", rb_eRuntimeError);
}

