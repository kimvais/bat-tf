/loauyded array.tf

;========================================================================
; get_array() / get_2array()
;
; Retrieves data from a virtual array.
; USAGE:
; x := get_array("array_name", index)
; x := get_2array("array_name", index, index2)
;
; x             : Value returned.
; "array_name"  : Name of the array.
; index         : Element.
; index2        : Element of index (get_2array only).
;========================================================================
/def get_array = \
  /let pedantic_tmp=%pedantic%;\
  /set pedantic=off%;\
  /return _array_%1_%2%;\
  /set pedantic=%pedantic_tmp
  

/def get_2array = \
  /let pedantic_tmp=%pedantic%;\
  /set pedantic=off%;\
  /return _array_%1_%2_%3%;\
  /set pedantic=%pedantic_tmp

;========================================================================
; put_array() / put_2array()
;
; Stores data into a virtual array
; USAGE:
; put_array("array_name", index, value)
; put_2array("array_name2", index, index2, value)
;
; "array_name" : Name of the array.
; index        : Element.
; index2       : Element of index (put_2array only).
; value        : Data you're placing into the array.  Can be anything you want.
;========================================================================
/def put_array = \
  /eval /test _array_%1_%2 := strcat({3})

/def put_2array = \
  /eval /test _array_%1_%2_%3 := strcat({4})

;========================================================================
; tfwrite_array() / tfwrite_2array()
;
; Writes a virtual array to a disk file.
; USAGE:
; tfwrite_array(file_variable, "array_name", start_index, size)
; tfwrite_2array(file_variable, "array_name", index, start_index, size)
;
; file_variable : File variable of a tfopened file.
; "array_name"  : Name of the array.
; start_index   : The element you want to start writing from.
; index         : Start_index of index [first dimension] (tfwrite_2array only)
; Size          : Number of elements to write.
;
; NOTES: tfwrite_2array() can't write the whole array to disk.  You must
;        write each dimension at a time.
;========================================================================
/def tfwrite_array = \
  /let file_ %{1} %;\
  /let array_ %{2} %;\
  /let start_ %{3} %;\
  /let size_ %{4} %;\
  /let count_ 0 %;\
  /WHILE (++count_ <= size_) \
    /test tfwrite(file_, get_array(array_, start_)) %;\
    /test ++start_ %;\
  /DONE

/def tfwrite_2array = \
  /let file_ %{1} %;\
  /let array_ %{2} %;\
  /let index_ %{3} %;\
  /let start_ %{4} %;\
  /let size_ %{5} %;\
  /let count_ 0 %;\
  /WHILE (++count_ <= size_) \
    /test tfwrite(file_, get_2array(array_, index_, start_)) %;\
    /test ++start_ %;\
  /DONE

;========================================================================
; tfread_array() / tfread_2array()
;
; reads an array file from disk
; USAGE:
; x := tfread_array(file_variable, "array_name", start_index, size)
; x := tfread_2array(file_variable, "array_name", index, start_index, size)
;
; x             : Number of records read.
; file_variable : File variable of a tfopened file.
; "array_name"  : Name of the array.
; start_index   : Starting element you want to read into.
; index         : Start_index of index [first dimension] (tfread_2array only)
; size          : Number of elements to read.
;========================================================================
/def tfread_array = \
  /let file_ %{1} %;\
  /let array_ %{2} %;\
  /let start_ %{3} %;\
  /let size_ %{4} %;\
  /let count_ 0 %;\
  /let done_ 0 %;\
  /let err_ 0 %;\
  /let st_ 0 %;\
  /test st_ := '' %;\
  /WHILE (!done_) \
    /test err_ := tfread(file_, st_) %;\
    /IF ( (err_ != -1) & (count_ < size_) ) \
      /test put_array(array_, start_, st_) %;\
      /test ++count_ %;\
      /test ++start_ %;\
    /ELSE \
      /test done_ := 1 %;\
    /ENDIF %;\
  /DONE %;\
  /RETURN count_

/def tfread_2array = \
  /let file_ %{1} %;\
  /let array_ %{2} %;\
  /let index_ %{3} %;\
  /let start_ %{4} %;\
  /let size_ %{5} %;\
  /let count_ 0 %;\
  /let done_ 0 %;\
  /let err_ 0 %;\
  /let st_ 0 %;\
  /test st_ := '' %;\
  /WHILE (!done_) \
    /test err_ := tfread(file_, st_) %;\
    /IF ( (err_ != -1) & (count_ < size_) ) \
      /test put_2array(array_, index_, start_, st_) %;\
      /test ++count_ %;\
      /test ++start_ %;\
    /ELSE \
      /test done_ := 1 %;\
    /ENDIF %;\
  /DONE %;\
  /RETURN count_

;========================================================================
; strstr_array() / strstr_2array()
;
; Searches for a value in a virtual array and returns what element its found in.
; USAGE:
; x := strstr_array("array_name", start_index, size, value)
; x := strstr_2array("array_name", index, start_index, size, value)
;
; x             : Element of "array_name" that value was found in.
;                 -1 is returned if value was not found.
; "array_name"  : Name of the array.
; start_index   : Element to start searching at
; index         : Start_index of index [first dimension] (strstr_2arrat only).
; size          : Number of elements to search.
; value         : The item your searching for.
;
; NOTES: Strstr_2array can't search all dimensions, you must search each dimension
;        at a time.
;        If value = "" then it will return the first element that is blank.
;========================================================================
/def strstr_array = \
  /let array_ %{1} %;\
  /let start_ %{2} %;\
  /let size_ %{3} %;\
  /let value_ 0 %;\
  /test value_ := {4} %;\
  /let count_ 0 %;\
  /let pos_ 0 %;\
  /let st_ 0 %;\
  /test st_ := '' %;\
  /let element_ -1 %;\
  /WHILE ( (++count_ <= size_) & (element_ = -1) ) \
    /test st_ := get_array(array_, start_) %;\
    /IF (value_ =~ '') \
      /IF (st_ =~ '') \
        /test element_ := start_ %;\
      /ENDIF %;\
    /ELSE \
      /test pos_ := strstr(st_, value_) %;\
      /IF (pos_ > -1) \
        /test element_ := start_ %;\
      /ENDIF %;\
    /ENDIF %;\
    /test ++start_ %;\
  /DONE %;\
  /RETURN element_

/def strstr_2array = \
  /let array_ %{1} %;\
  /let index_ %{2} %;\
  /let start_ %{3} %;\
  /let size_ %{4} %;\
  /let value_ 0 %;\
  /test value_ := {5} %;\
  /let count_ 0 %;\
  /let pos_ 0 %;\
  /let st_ 0 %;\
  /let element_ -1 %;\
  /test st_ := '' %;\
  /WHILE ( (++count_ <= size_) & (element_ = -1) ) \
    /test st_ := get_2array(array_, index_, start_) %;\
    /IF (value_ =~ '') \
      /IF (st_ =~ '') \
        /test element_ := start_ %;\
      /ENDIF %;\
    /ELSE \
      /test pos_ := strstr(st_, value_) %;\
      /IF (pos_ > -1) \
        /test element_ := start_ %;\
      /ENDIF %;\
    /ENDIF %;\
    /test ++start_ %;\
  /DONE %;\
  /RETURN element_

;========================================================================
; purge_array()
;
; Purges a virtual array made by get_array() and put_array()
; USAGE:
; purge_array("array_name")
;
; "array_name" : Name of array you want to delete from memory.
;
; NOTES: Purge_array() deletes the whole entire virtual array.  It
;        can be a double dimensioned array as well.
;========================================================================
/def purge_array = \
  /IF ({1} !~ '') \
    /quote -S /unset `/listvar -mglob -s _array_%1* %;\
  /ENDIF %;\

;========================================================================
; list_array() / list_2array()
;
; List an array in an easy to read format.
; USAGE:
; list_array("array_name", startindex)
; list_2array("array_name", startindex1, startindex2)
; /list_array <array_name> <startindex>
; /list_2array <array_name> <startindex1> <startindex2>
;
; "array_name" : Name of the array you want to list. (function form only)
; startindex   : Starting element you want to list from.
; startindex1  : Starting element of startindex2 you want to list from.
; startindex2  : Starting element of startindex1.
;========================================================================
/def list_array = \
  /let name_ %{1} %;\
  /let startindex_ 0 %;\
  /test startindex_ := {2} %;\
  /let index_ 0 %;\
  /def list_array2 = \
    /let rawname_ %%{1} %%;\
    /test index_ := substr(rawname_, strlen(name_) + 8, 256) %%;\
    /IF (index_ >= startindex_) \
      /test echo(strcat(name_, '[', index_, '] :=', get_array(name_, index_))) %%;\
    /ENDIF %;\
  /quote -S /test list_array2("`"/listvar -mglob -s _array_%1_*"") %;\
  /undef list_array2

/def list_2array = \
  /let i2F_ 0 %;\
  /let name_ %{1} %;\
  /let startindex1_ %{2} %;\
  /let startindex2_ %{3} %;\
  /let pos_ 0 %;\
  /let index1_ 0 %;\
  /let index2_ 0 %;\
  /let rawindex_ 0 %;\
  /def list_2array2 = \
    /let rawname_ %%{1} %%;\
    /test rawindex_ := substr(rawname_, strlen(name_) + 8, 256) %%;\
    /test pos_ := strstr(rawindex_, '_') %%;\
    /test index1_ := substr(rawindex_, 0, pos_) %%;\
    /test index2_ := substr(rawindex_, pos_ + 1, 255) %%;\
    /IF (index1_ >= startindex1_) \
      /IF ( (i2F_ = 0) & (index2_ >= startindex2_) )\
        /test i2F_ := 1 %%;\
      /ENDIF %%;\
      /IF (i2F_ = 1) \
        /test echo(strcat(name_, '[', index1_, '][', index2_, '] :=', get_2array(name_, index1_, index2_))) %%;\
      /ENDIF %%;\
    /ENDIF %;\
  /quote -S /test list_2array2("`"/listvar -mglob -s _array_%1_*"") %;\
  /undef list_2array2
