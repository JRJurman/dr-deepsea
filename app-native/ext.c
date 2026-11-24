#include <dragonruby.h>
#include <eclair/eclair.h>

static drb_api_t *drb_api;

static mrb_value speak(mrb_state *mrb, mrb_value self) {
	const char *text;
  mrb_bool interrupt = 1;
  drb_api->mrb_get_args(mrb, "z|b", &text, &interrupt);

	eclair_error status = eclair_speak(text, interrupt);

  return drb_api->mrb_str_new_cstr(mrb, eclair_error_string(status));
}

static mrb_value error_string(mrb_state *mrb, mrb_value self) {
  return drb_api->mrb_str_new_cstr(mrb, eclair_error_string(ECLAIR_OK));
}

static void on_vm_close(mrb_state *mrb) {
	eclair_shutdown();
}

DRB_FFI_EXPORT
void drb_register_c_extensions_with_api(mrb_state *state, struct drb_api_t *api) {
  drb_api = api;

	// initialize eclair on loading this extension
	eclair_init();

	// module definition
  struct RClass *FFI = drb_api->mrb_module_get(state, "FFI");
  struct RClass *module = drb_api->mrb_define_module_under(state, FFI, "Eclair");

	// function definitions
  drb_api->mrb_define_module_function(state, module, "error_string", error_string, MRB_ARGS_NONE());
  drb_api->mrb_define_module_function(state, module, "speak", speak, MRB_ARGS_ARG(1, 1));

	// close eclair when we exit
	drb_api->mrb_state_atexit(state, on_vm_close);
}
