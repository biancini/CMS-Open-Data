ifeq ($(strip $(DemoAnalyzer/plugins)),)
src_DemoAnalyzer_plugins := self/DemoAnalyzer/plugins
DemoAnalyzer/plugins  := src_DemoAnalyzer_plugins
src_DemoAnalyzer_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/DemoAnalyzer/plugins/BuildFile
src_DemoAnalyzer_plugins_LOC_USE := self FWCore/Framework FWCore/PluginManager FWCore/ParameterSet
src_DemoAnalyzer_plugins_EX_USE   := $(foreach d,$(src_DemoAnalyzer_plugins_LOC_USE),$(if $($(d)_EX_FLAGS_NO_RECURSIVE_EXPORT),,$d))
ALL_EXTERNAL_PRODS += src_DemoAnalyzer_plugins
src_DemoAnalyzer_plugins_INIT_FUNC += $$(eval $$(call EmptyPackage,src_DemoAnalyzer_plugins,src/DemoAnalyzer/plugins))
endif

ifeq ($(strip $(PhysObjectExtractorTool/PhysObjectExtractor)),)
ALL_COMMONRULES += src_PhysObjectExtractorTool_PhysObjectExtractor_src
src_PhysObjectExtractorTool_PhysObjectExtractor_src_parent := PhysObjectExtractorTool/PhysObjectExtractor
src_PhysObjectExtractorTool_PhysObjectExtractor_src_INIT_FUNC := $$(eval $$(call CommonProductRules,src_PhysObjectExtractorTool_PhysObjectExtractor_src,src/PhysObjectExtractorTool/PhysObjectExtractor/src,LIBRARY))
PhysObjectExtractorToolPhysObjectExtractor := self/PhysObjectExtractorTool/PhysObjectExtractor
PhysObjectExtractorTool/PhysObjectExtractor := PhysObjectExtractorToolPhysObjectExtractor
PhysObjectExtractorToolPhysObjectExtractor_files := $(patsubst src/PhysObjectExtractorTool/PhysObjectExtractor/src/%,%,$(wildcard $(foreach dir,src/PhysObjectExtractorTool/PhysObjectExtractor/src ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PhysObjectExtractorToolPhysObjectExtractor_BuildFile    := $(WORKINGDIR)/cache/bf/src/PhysObjectExtractorTool/PhysObjectExtractor/BuildFile
PhysObjectExtractorToolPhysObjectExtractor_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/PatCandidates CommonTools/UtilAlgos FWCore/ServiceRegistry JetMETCorrections/Modules CondFormats/JetMETObjects HLTrigger/HLTcore
PhysObjectExtractorToolPhysObjectExtractor_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,PhysObjectExtractorToolPhysObjectExtractor,PhysObjectExtractorToolPhysObjectExtractor,$(SCRAMSTORENAME_LIB),src/PhysObjectExtractorTool/PhysObjectExtractor/src))
PhysObjectExtractorToolPhysObjectExtractor_PACKAGE := self/src/PhysObjectExtractorTool/PhysObjectExtractor/src
ALL_PRODS += PhysObjectExtractorToolPhysObjectExtractor
PhysObjectExtractorToolPhysObjectExtractor_CLASS := LIBRARY
PhysObjectExtractorTool/PhysObjectExtractor_forbigobj+=PhysObjectExtractorToolPhysObjectExtractor
PhysObjectExtractorToolPhysObjectExtractor_INIT_FUNC        += $$(eval $$(call Library,PhysObjectExtractorToolPhysObjectExtractor,src/PhysObjectExtractorTool/PhysObjectExtractor/src,src_PhysObjectExtractorTool_PhysObjectExtractor_src,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
endif
