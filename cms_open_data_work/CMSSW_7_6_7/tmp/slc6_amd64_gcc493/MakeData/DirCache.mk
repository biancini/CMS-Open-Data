ALL_SUBSYSTEMS+=PhysObjectExtractorTool
subdirs_src_PhysObjectExtractorTool = src_PhysObjectExtractorTool_PhysObjectExtractor
ALL_PACKAGES += DemoAnalyzer/python
subdirs_src_DemoAnalyzer_python := 
ifeq ($(strip $(PyPhysObjectExtractorToolPhysObjectExtractor)),)
PyPhysObjectExtractorToolPhysObjectExtractor := self/src/PhysObjectExtractorTool/PhysObjectExtractor/python
src_PhysObjectExtractorTool_PhysObjectExtractor_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/PhysObjectExtractorTool/PhysObjectExtractor/python)
PyPhysObjectExtractorToolPhysObjectExtractor_files := $(patsubst src/PhysObjectExtractorTool/PhysObjectExtractor/python/%,%,$(wildcard $(foreach dir,src/PhysObjectExtractorTool/PhysObjectExtractor/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyPhysObjectExtractorToolPhysObjectExtractor_LOC_USE := self  
PyPhysObjectExtractorToolPhysObjectExtractor_PACKAGE := self/src/PhysObjectExtractorTool/PhysObjectExtractor/python
ALL_PRODS += PyPhysObjectExtractorToolPhysObjectExtractor
PyPhysObjectExtractorToolPhysObjectExtractor_INIT_FUNC        += $$(eval $$(call PythonProduct,PyPhysObjectExtractorToolPhysObjectExtractor,src/PhysObjectExtractorTool/PhysObjectExtractor/python,src_PhysObjectExtractorTool_PhysObjectExtractor_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyPhysObjectExtractorToolPhysObjectExtractor,src/PhysObjectExtractorTool/PhysObjectExtractor/python))
endif
ALL_COMMONRULES += src_PhysObjectExtractorTool_PhysObjectExtractor_python
src_PhysObjectExtractorTool_PhysObjectExtractor_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysObjectExtractorTool_PhysObjectExtractor_python,src/PhysObjectExtractorTool/PhysObjectExtractor/python,PYTHON))
ALL_PACKAGES += PhysObjectExtractorTool/PhysObjectExtractor
subdirs_src_PhysObjectExtractorTool_PhysObjectExtractor := src_PhysObjectExtractorTool_PhysObjectExtractor_test src_PhysObjectExtractorTool_PhysObjectExtractor_python src_PhysObjectExtractorTool_PhysObjectExtractor_src
ALL_SUBSYSTEMS+=DemoAnalyzer
subdirs_src_DemoAnalyzer = src_DemoAnalyzer_test src_DemoAnalyzer_python src_DemoAnalyzer_plugins src_DemoAnalyzer_doc
ALL_PACKAGES += DemoAnalyzer/test
subdirs_src_DemoAnalyzer_test := 
ALL_PACKAGES += DemoAnalyzer/doc
subdirs_src_DemoAnalyzer_doc := 
ALL_PACKAGES += DemoAnalyzer/plugins
subdirs_src_DemoAnalyzer_plugins := 
ALL_COMMONRULES += src_PhysObjectExtractorTool_PhysObjectExtractor_test
src_PhysObjectExtractorTool_PhysObjectExtractor_test_parent := PhysObjectExtractorTool/PhysObjectExtractor
src_PhysObjectExtractorTool_PhysObjectExtractor_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_PhysObjectExtractorTool_PhysObjectExtractor_test,src/PhysObjectExtractorTool/PhysObjectExtractor/test,TEST))
