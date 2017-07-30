APPLY_A53_ERRATA_FIXES :=

ifneq ($(strip $(TARGET_IS_CORTEX-A53)),)
	APPLY_A53_ERRATA_FIXES := $(TARGET_IS_CORTEX-A53)
endif

ifeq ($(APPLY_A53_ERRATA_FIXES),true)
	arch_variant_cflags := -mcpu=cortex-a53
	arch_variant_ldflags += -Wl,--fix-cortex-a53-835769
	arch_variant_cflags  += -mfix-cortex-a53-835769
else
	arch_variant_cflags :=
	arch_variant_ldflags += -Wl,--no-fix-cortex-a53-835769
	arch_variant_cflags  += -mno-fix-cortex-a53-835769
	RS_DISABLE_A53_WORKAROUND := true
endif

APPLY_A53_ERRATA_FIXES :=
