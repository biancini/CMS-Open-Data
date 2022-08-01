ifeq ($(strip $(DemoAnalyzer/plugins)),)
src_DemoAnalyzer_plugins := self/DemoAnalyzer/plugins
DemoAnalyzer/plugins  := src_DemoAnalyzer_plugins
src_DemoAnalyzer_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/DemoAnalyzer/plugins/BuildFile
src_DemoAnalyzer_plugins_LOC_USE := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet
src_DemoAnalyzer_plugins_EX_USE   := $(foreach d,$(src_DemoAnalyzer_plugins_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_DemoAnalyzer_plugins
src_DemoAnalyzer_plugins_INIT_FUNC += $$(eval $$(call EmptyPackage,src_DemoAnalyzer_plugins,src/DemoAnalyzer/plugins))
endif

