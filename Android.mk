LOCAL_PATH := $(call my-dir)

boost_common_cflags := -DBOOST_LITTLE_ENDIAN -DBOOST_BYTE_ORDER=1234 -DBOOST_DETAIL_ENDIAN_HPP

###############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE    := boost_serialization

boost_serialization_sources := basic_archive \
						basic_iarchive \
						basic_iserializer \
						basic_oarchive \
						basic_oserializer \
						basic_pointer_iserializer \
						basic_pointer_oserializer \
						basic_serializer_map \
						basic_text_iprimitive \
						basic_text_oprimitive \
						basic_xml_archive \
						binary_iarchive \
						binary_oarchive \
						extended_type_info \
						extended_type_info_typeid \
						extended_type_info_no_rtti \
						polymorphic_iarchive \
						polymorphic_oarchive \
						stl_port \
						text_iarchive \
						text_oarchive \
						void_cast \
						archive_exception \
						xml_grammar \
						xml_iarchive \
						xml_oarchive \
						xml_archive_exception \
						shared_ptr_helper


LOCAL_SRC_FILES := $(addprefix libs/serialization/src/,$(addsuffix .cpp,$(boost_serialization_sources)))

LOCAL_C_INCLUDE         += $(LOCAL_PATH)
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_C_INCLUDES)

LOCAL_CFLAGS            += $(boost_common_cflags)

include $(BUILD_STATIC_LIBRARY)
###############################################################################

###############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE    := boost_system

LOCAL_SRC_FILES := libs/system/src/error_code.cpp

LOCAL_C_INCLUDE         += $(LOCAL_PATH)
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_C_INCLUDES)

include $(BUILD_STATIC_LIBRARY)
###############################################################################

###############################################################################
include $(CLEAR_VARS)

LOCAL_MODULE    := boost_filesystem_v2

boost_filesystem_v2_sources := v2/src/v2_operations v2/src/v2_path v2/src/v2_portability v3/src/utf8_codecvt_facet

LOCAL_SRC_FILES := $(addprefix libs/filesystem/,$(addsuffix .cpp,$(boost_filesystem_v2_sources)))

LOCAL_C_INCLUDE         += $(LOCAL_PATH)
LOCAL_EXPORT_C_INCLUDES += $(LOCAL_C_INCLUDES)

LOCAL_CFLAGS            += $(boost_common_cflags) -DBOOST_FILESYSTEM_VERSION=2
LOCAL_EXPORT_CFLAGS		+= -DBOOST_FILESYSTEM_VERSION=2

LOCAL_STATIC_LIBRARIES  += androidglue

include $(BUILD_STATIC_LIBRARY)
###############################################################################

$(call import-module,androidglue)
