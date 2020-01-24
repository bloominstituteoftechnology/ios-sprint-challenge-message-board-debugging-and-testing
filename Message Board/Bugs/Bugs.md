#  Bugs


1. There is an error decodeing message threads JSON. Getting this "Cannot get unkeyed decoding container -- found null value instead."  
** Looked up the error and found that "Swift.DecodingError.Context" is a struct indicating the place of the error

