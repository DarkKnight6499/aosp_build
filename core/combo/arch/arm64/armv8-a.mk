ifneq (,$(filter cortex-a53,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a53
	arch_variant_ldflags += -Wl,--fix-cortex-a53-835769
else
	arch_variant_cflags :=
	arch_variant_ldflags += -Wl,--no-fix-cortex-a53-835769
	RS_DISABLE_A53_WORKAROUND := true
endif

