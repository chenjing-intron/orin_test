VulkanSC Pipeline Cache Compiler (PCC) Tool


JSON Generator Layer

Using the pcc tool requires using the json generator layer with a vksc application in order to generate input for the pcc tool to create a pipeline cache. The latest binaries can be found in //sw/pvt/mkeshava/VkLayer_json_gen and should be copied to the target filesystem so they can be used with the application. Usage is as follows:

1) Add registry entry for the layer json file. (the usual way of enabling VK layers)
2) Enable layer in application – “VK_LAYER_KHRONOS_json_gen”
3) Set ‘VK_JSON_FILE_PATH’ environment variable. This is where the json file will be created.


PCC Tool

The PCC tool takes the offline JSON file generated from the above as input and outputs a pipeline cache binary as output.

Pcc tool supported arguments:

-path : The path where the json files are located. The tool parses all json files in a given path.
-chip : The target chip architecture to which the binaries will be compiled to.
-out  : The output binary name
-help : Show help options.
-hex  : Get hex dump to use the binary in C++ code directly.

Ex: ./pcc -out cache.bin -chip gv11b -path /home/mkeshava/json_test_files/

