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
